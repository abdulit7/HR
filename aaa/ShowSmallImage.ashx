<%@ WebHandler Language="C#" Class="ShowSmallImage" %>

using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Configuration;

public class ShowSmallImage : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        try
        {
            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            context.Response.Cache.SetNoStore();

            string empno = Convert.ToString(context.Request.QueryString["id"]);
            empno = empno.Replace("'", "").Replace("\"", "").Trim();

            int userId;
            if (!int.TryParse(empno, out userId))
            {
                WriteTextImage(context, "0");
                return;
            }

            byte[] imgBytes = GetEmployeeImage(userId);

            if (imgBytes != null && imgBytes.Length > 0)
            {
                context.Response.ContentType = "image/jpeg";
                context.Response.BinaryWrite(imgBytes);
            }
            else
            {
                string firstLetter = GetEmployeeFirstLetter(userId);
                WriteTextImage(context, firstLetter);
            }
        }
        catch
        {
            WriteTextImage(context, "0");
        }
    }

    private byte[] GetEmployeeImage(int userId)
    {
        string cs = @"Data Source=GFI-Loaders\SQLEXPRESS;Initial Catalog=JOJO;User ID=sa;Password=Jojo@123";

        using (SqlConnection con = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT PhotoSmall FROM userinfojojo WHERE userid=@UserID", con))
        {
            cmd.Parameters.AddWithValue("@UserID", userId);
            con.Open();

            object obj = cmd.ExecuteScalar();

            if (obj != null && obj != DBNull.Value)
                return (byte[])obj;

            return null;
        }
    }

    private string GetEmployeeFirstLetter(int userId)
    {
        string cs = @"Data Source=GFI-Loaders\SQLEXPRESS;Initial Catalog=JOJO;User ID=sa;Password=Jojo@123";

        using (SqlConnection con = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT Name FROM userinfojojo WHERE userid=@UserID", con))
        {
            cmd.Parameters.AddWithValue("@UserID", userId);
            con.Open();

            object obj = cmd.ExecuteScalar();

            if (obj != null && obj != DBNull.Value)
            {
                string name = obj.ToString().Trim();
                if (name.Length > 0)
                    return name.Substring(0, 1).ToUpper();
            }

            return "0";
        }
    }

    private void WriteTextImage(HttpContext context, string text)
    {
        byte[] bytes = DrawText(text.ToUpper());

        context.Response.ContentType = "image/bmp";
        context.Response.BinaryWrite(bytes);
    }

    private byte[] DrawText(string text)
    {
        using (Bitmap img = new Bitmap(45, 45))
        using (Graphics drawing = Graphics.FromImage(img))
        using (Font font = new Font("Arial", 20.0f))
        using (Brush textBrush = new SolidBrush(Color.White))
        using (MemoryStream ms = new MemoryStream())
        {
            drawing.Clear(Color.CornflowerBlue);
            drawing.DrawString(text, font, textBrush, 8, 5);
            drawing.Save();

            img.Save(ms, ImageFormat.Bmp);
            return ms.ToArray();
        }
    }

    public bool IsReusable
    {
        get { return false; }
    }
}
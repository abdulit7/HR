<%@ WebHandler Language="C#" Class="ShowSmallImage" %>
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public class ShowSmallImage : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string empno;
        try
        {
            if (context.Request.QueryString["id"] != null)
                empno = context.Request.QueryString["id"].ToString().Trim();
            else
                throw new ArgumentException("No parameter specified");
            context.Response.ContentType = "image/jpeg";
            Stream strm = ShowEmpImage(empno);
            if (strm == null)
            {
            }
            else
            {
                byte[] buffer = new byte[4096];
                int byteSeq = strm.Read(buffer, 0, 4096);
                while (byteSeq > 0)
                {
                    context.Response.OutputStream.Write(buffer, 0, byteSeq);
                    byteSeq = strm.Read(buffer, 0, 4096);
                }
            }
        }
        catch (Exception ex)
        {
            //BAL.Error = ex.Message.ToString().Trim();
        }
    }
    public Stream ShowEmpImage(string empno)
    {
        System.Data.SqlClient.SqlConnection connection = new SqlConnection(JOJO.strcon);
        string sql = " select Name,PhotoSmall from userinfojojo where userid=" + empno + "";
        DataTable dt = new DataTable();
        string s = string.Empty;
        dt = JOJO.GetData(sql);
        try
        {
            SqlCommand cmd = new SqlCommand(sql, connection);
            cmd.CommandType = CommandType.Text;
            connection.Open();
            object img = (byte[])dt.Rows[0]["PhotoSmall"];
            return new System.IO.MemoryStream((byte[])img);
        }
        catch
        {
            string s1 = dt.Rows[0]["Name"].ToString().Trim();
            if(s1!="")
            {
                s = s1.Substring(0, 1);
            }
            else
            {
                s = "0";
            }

            Font font = new Font("Arial", 20.0f);
            Color clrText = Color.FromName("White");
            Color clrBkg = Color.FromName("CornflowerBlue");
            return new System.IO.MemoryStream((byte[])DrawText(s.ToUpper(), font, clrText, clrBkg));
        }
        finally
        {
            connection.Close();
        }
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    private  byte[] DrawText(String text, Font font, Color textColor, Color backColor)
    {
        //first, create a dummy bitmap just to get a graphics object
        System.Drawing.Image img = new Bitmap(10,10);
        Graphics drawing = Graphics.FromImage(img);
        //measure the string to see how big the image needs to be
        SizeF textSize = drawing.MeasureString(text,font);
        //free up the dummy image and old graphics object
        img.Dispose();
        drawing.Dispose();
        //create a new image of the right size
        //img = new Bitmap((int)textSize.Width, (int)textSize.Height);
        img = new Bitmap(45, 45);
        drawing = Graphics.FromImage(img);
        //paint the background
        drawing.Clear(backColor);
        //create a brush for the text
        Brush textBrush = new SolidBrush(textColor);
        drawing.DrawString(text, font, textBrush, 8, 5);
        drawing.Save();
        textBrush.Dispose();
        drawing.Dispose();
        Bitmap pic12 = JOJO.ResizeImage(img, 45, 45);
        MemoryStream ms = new MemoryStream();
        pic12.Save(ms, ImageFormat.Bmp);
        byte[] PicSmall = ms.ToArray();
        return PicSmall;
    }
    public byte[] ImageToByteArray(System.Drawing.Image imageIn)
    {
        using (var ms = new MemoryStream())
        {
            imageIn.Save(ms,imageIn.RawFormat);
            return  ms.ToArray();
        }
    }
}
<%@ WebHandler Language="C#" Class="ShowLogo" %>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public class ShowLogo : IHttpHandler {
    public void ProcessRequest(HttpContext context)
    {
        string empno;
        try
        {
            if (context.Request.QueryString["id"] != null)
                empno = context.Request.QueryString["id"].ToString();
            else
                throw new ArgumentException("No parameter specified");
            context.Response.ContentType = "image/jpeg";
            Stream strm = ShowEmpImage(empno);
            byte[] buffer = new byte[4096];
            int byteSeq = strm.Read(buffer, 0, 4096);
            while (byteSeq > 0)
            {
                context.Response.OutputStream.Write(buffer, 0, byteSeq);
                byteSeq = strm.Read(buffer, 0, 4096);
            }
        }
        catch (Exception ex)
        {
            //BAL.Error = ex.Message.ToString();
        }
        //context.Response.BinaryWrite(buffer);
    }
    public Stream ShowEmpImage(string ID)
    {
        //string conn = ConfigurationManager.ConnectionStrings["image"].ConnectionString;
        System.Data.SqlClient.SqlConnection connection = new SqlConnection(JOJO.strcon);
        string sql = "SELECT Logo FROM DataArea where ID='" + ID + "'";//= '" + empno + "'";
        //        string sql = @" 
        //        SELECT        TEMPLATE AS image 
        //FROM            att2000.dbo.FaceTemp
        //WHERE        (FACEID = 0) AND (UserID = 260)";
        SqlCommand cmd = new SqlCommand(sql, connection);
        cmd.CommandType = CommandType.Text;
        //cmd.Parameters.AddWithValue("@ID", empno);
        connection.Open();
        object img = cmd.ExecuteScalar();
        try
        {
            return new System.IO.MemoryStream((byte[])img);
        }
        catch
        {
            return null;
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
}
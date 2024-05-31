using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Diagnostics.Eventing.Reader;

namespace ConnectSQL
{
    public partial class Appointment_Scheduler_Project : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection("Data Source=SAHIL\\SQLEXPRESS; Initial Catalog=Appointment;Integrated Security=True;");
        string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtName.Focus();
            }
        }   
        protected void btnSave_Click(object sender, EventArgs e)
        {
            captcha1.ValidateCaptcha(txtCaptcha.Text.Trim());
            if (captcha1.UserValidated)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Your Captcha Text Has Been Verified Successfully ";
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Your Captcha Text Has Not Verified Successfully! ";
            }
            bool validate = ValidateForm();
            if (validate)
            {
                SqlConnection con = new SqlConnection(dbconnection);
                SqlCommand cmd = new SqlCommand("sp_table", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@gender", DropDownList1.Text);
                cmd.Parameters.AddWithValue("@timing", txtTime.Text);
                con.Open();
                int RowAffected = cmd.ExecuteNonQuery();
                if (RowAffected != 6)
                {
                    lblMessage.Text = "Record Inserted Successfully into the Database";
                }
                else
                {
                    lblMessage.Text = "Record Not inserted";
                }
                con.Close();
            }
        }

            public bool ValidateForm()
            {
                if (string.IsNullOrEmpty(txtName.Text.ToString()) && string.IsNullOrEmpty(txtEmail.Text.ToString()) && string.IsNullOrEmpty(txtCaptcha.Text.ToString()) && string.IsNullOrEmpty(txtAddress.Text.ToString()) && string.IsNullOrEmpty(txtMobile.Text.ToString()) && string.IsNullOrEmpty(txtPassword.Text.ToString()) && string.IsNullOrEmpty(txtTime.Text.ToString()))
                {
                    lblMessage.Text = "<script>alert('Please Enter all the fields')</script>";
                    return false;
                }
                if (string.IsNullOrEmpty(txtName.Text.ToString()))
                {
                    lblMessage.Text = "<script>alert('Please Enter Name')</script>";
                    return false;
                }
                else if (string.IsNullOrEmpty(txtEmail.Text.ToString()))
                {
                    lblMessage.Text = "<script>alert('Please Enter Email Id')</script>";
                    return false;
                }
                else if (string.IsNullOrEmpty(txtCaptcha.Text.ToString()))
                {
                    lblMessage.Text = "<script>alert('Please Enter Captcha')</script>";
                    return false;
                }
                else if (string.IsNullOrEmpty(txtAddress.Text.ToString()))
                {
                    lblMessage.Text = "<script>alert('Please Enter Address')</script>";
                    return false;
                }
                else if (string.IsNullOrEmpty(txtMobile.Text.ToString()))
                {
                    lblMessage.Text = "<script>alert('Please Enter Mobile')</script>";
                    return false;
                }
                else if (string.IsNullOrEmpty(txtPassword.Text.ToString()))
                {
                    lblMessage.Text = "<script>alert('Please Enter Password')</script>";
                    return false;
                }
                else if (string.IsNullOrEmpty(txtTime.Text.ToString()))
                {
                    lblMessage.Text = "<script>alert('Please Enter Time')</script>";
                    return false;
                }
                else
                {
                    return true;
                }

            }
        
        }
    
}
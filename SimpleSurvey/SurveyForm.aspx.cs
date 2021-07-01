using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimpleSurvey
{
    public partial class SurveyForm : System.Web.UI.Page
    {
        SurveyAppConString context;
        int surveyid;
        protected void Page_Load(object sender, EventArgs e)
        {
            context = new SurveyAppConString();
            if (!IsPostBack)
                LoadSurveys();
            btnSubmit.Enabled = false;
            if (ddlSurveys.SelectedIndex > 0)
            {
                surveyid = int.Parse(ddlSurveys.SelectedValue);
                PopulateSurvey();
            }
        }
        private void LoadSurveys()
        {
            List<Survey> surveys = context.Surveys.ToList();
            ddlSurveys.DataSource = surveys;
            ddlSurveys.DataTextField = "Title";
            ddlSurveys.DataValueField = "ID";
            ddlSurveys.DataBind();
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            TextBox1.Visible = false;
            TextBox2.Visible = false;
            TextBox3.Visible = false;
            TextBox4.Visible = false;
            TextBox5.Visible = false;
            TextBox6.Visible = false;
            TextBox7.Visible = false;
            TextBox8.Visible = false;
            TextBox9.Visible = false;
            
           


        }

        protected void ddlSurveys_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void PopulateSurvey()
        {
            btnSubmit.Enabled = true;
            List<Question> questions = (from p in context.Questions
                                        join q in context.SurveyQuestions on p.ID equals q.QuestionID
                                        where q.SurveyID == surveyid
                                        select p).ToList();
           

           for(int i=0;i<questions.Count();i++)
            {
                switch(i)
                {
                    case 0:Label1.Visible = true;
                        TextBox1.Visible = true;
                        Label1.Text = questions[0].Text;
                        break;
                    case 1:Label2.Visible = true;
                        TextBox2.Visible = true;
                        Label2.Text = questions[1].Text;
                        break;
                    case 2:
                        Label3.Visible = true;
                        TextBox3.Visible = true;
                        Label3.Text = questions[2].Text;
                        break;
                    case 3:
                        Label4.Visible = true;
                        TextBox4.Visible = true;
                        Label4.Text = questions[3].Text;
                        break;
                    case 4:
                        Label5.Visible = true;
                        TextBox5.Visible = true;
                        Label5.Text = questions[4].Text;
                        break;
                    case 5:
                        Label6.Visible = true;
                        TextBox6.Visible = true;
                        Label6.Text = questions[5].Text;
                        break;
                }

            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            List<Survey_Response> response = GetSurveyReponse();
            foreach (Survey_Response sres in response)
                context.AddToSurvey_Response(sres);
            context.SaveChanges();
            Response.Redirect("HtmlPage1.html");
        }

        private List<Survey_Response> GetSurveyReponse()
        {
            List<Survey_Response> response = new List<Survey_Response>();
            foreach (Control ctr in pnlSurvey.Controls)
            {
                if (ctr is Table)
                {
                    Table tbl = ctr as Table;
                    foreach (TableRow tr in tbl.Rows)
                    {
                        Survey_Response sres = new Survey_Response();
                        sres.FilledBy = 1;
                        sres.SurveyID = surveyid;
                        sres.QuestionID = Convert.ToInt32(tr.Cells[0].Attributes["ID"]);
                        TableCell tc = tr.Cells[1];
                        foreach (Control ctrc in tc.Controls)
                        {
                            if (ctrc is TextBox)
                            {
                                sres.Response = (ctrc as TextBox).Text.Trim();
                            }
                            else if (ctrc is DropDownList)
                            {
                                sres.Response = (ctrc as DropDownList).SelectedValue;
                            }
                            else if (ctrc is CheckBox)
                            {
                                sres.Response = (ctrc as CheckBox).Checked.ToString();
                            }
                        }
                        response.Add(sres);
                    }

                }
            }
            return response;
        }

        
    }
}
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
            Table tbl = new Table();
            tbl.Width = Unit.Percentage(100);
            TableRow tr;
            TableCell tc;
            TextBox txt;
            CheckBox cbk;
            DropDownList ddl;

            foreach (Question q in questions)
            {
                tr = new TableRow();
                tc = new TableCell();
                tc.Width = Unit.Percentage(25);
                tc.Text = q.Text;
                tc.Attributes.Add("id", q.ID.ToString());
                tr.Cells.Add(tc);
                tc = new TableCell();

                if (q.QuestionType.ToLower() == "singlelinetextbox")
                {
                    txt = new TextBox();
                    txt.ID = "txt_" + q.ID;
                    txt.Width = Unit.Percentage(40);
                    tc.Controls.Add(txt);
                }

                if (q.QuestionType.ToLower() == "multilinetextbox")
                {
                    txt = new TextBox();
                    txt.ID = "txt_" + q.ID;
                    txt.TextMode = TextBoxMode.MultiLine;
                    txt.Width = Unit.Percentage(40);
                    tc.Controls.Add(txt);
                }

                if (q.QuestionType.ToLower() == "singleselect")
                {
                    ddl = new DropDownList();
                    ddl.ID = "ddl_" + q.ID;
                    ddl.Width = Unit.Percentage(41);
                    if (!string.IsNullOrEmpty(q.Options))
                    {
                        string[] values = q.Options.Split(',');
                        foreach (string v in values)
                            ddl.Items.Add(v.Trim());
                    }
                    tc.Controls.Add(ddl);
                }
                tc.Width = Unit.Percentage(80);
                tr.Cells.Add(tc);
                tbl.Rows.Add(tr);
            }
            pnlSurvey.Controls.Add(tbl);
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            List<Survey_Response> response = GetSurveyReponse();
            foreach (Survey_Response sres in response)
                context.AddToSurvey_Response(sres);
            context.SaveChanges();
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
                        sres.FilledBy = 2;
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
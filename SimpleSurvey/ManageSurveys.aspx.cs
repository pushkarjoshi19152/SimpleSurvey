using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimpleSurvey
{
    public partial class ManageSurveys : System.Web.UI.Page
    {
        SurveyAppConString context;
        protected void Page_Load(object sender, EventArgs e)
        {
            context = new SurveyAppConString();
            if (!IsPostBack)
                GetQuestions();
        }
        private void GetQuestions()
        {
            List<Question> questions = context.Questions.ToList();
            lbSource.DataSource = questions;
            lbSource.DataTextField = "Text";
            lbSource.DataValueField = "ID";
            lbSource.DataBind();

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           

            if (Page.IsValid)
            {
                Survey survey = new Survey();
                survey.Title = txtTitle.Text;
                survey.Description = txtDesc.Text;
                survey.ExpiresOn = Convert.ToDateTime(DateTime.Now);
                survey.CreatedOn = Convert.ToDateTime(DateTime.Now);
                survey.CreatedBy = 1;
                List<SurveyQuestion> questions = new List<SurveyQuestion>();
                List<Question> questions1 = context.Questions.ToList();
               
                foreach (ListItem li in lbTarget.Items)
                {
                    SurveyQuestion quest = new SurveyQuestion();
                    quest.QuestionID = 1;
                    survey.SurveyQuestions.Add(quest);
                    questions.Add(quest);
                    
                    
                }
                context.AddToSurveys(survey);
                context.SaveChanges();
                Response.Redirect("SurveyForm.aspx");

            }
        }

        protected void btnAddAll_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lbSource.Items)
                lbTarget.Items.Add(li);
            lbSource.Items.Clear();
            lbSource.SelectedIndex = -1;
            lbTarget.SelectedIndex = -1;
        }

        protected void btnAddOne_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lbSource.Items)
                if (li.Selected)
                    lbTarget.Items.Add(li);
            foreach (ListItem li in lbTarget.Items)
                lbSource.Items.Remove(li);
            lbSource.SelectedIndex = -1;
            lbTarget.SelectedIndex = -1;
        }

        protected void btnRemoveOne_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lbTarget.Items)
                if (li.Selected)
                    lbSource.Items.Add(li);
            foreach (ListItem li in lbSource.Items)
                lbTarget.Items.Remove(li);
            lbSource.SelectedIndex = -1;
            lbTarget.SelectedIndex = -1;
        }

        protected void btnRemoveAll_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lbTarget.Items)
                lbSource.Items.Add(li);
            lbTarget.Items.Clear();
            lbSource.SelectedIndex = -1;
            lbTarget.SelectedIndex = -1;
        }


    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Student_Schedule.Model;

namespace Student_Schedule
{
    public partial class index : System.Web.UI.Page
    {
        SchedWS webService = new SchedWS();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                fillPage();
        }

        private void fillPage()
        {
            sectionListDDL.DataSource = webService.getSectionList();
            sectionListDDL.DataBind();
            resetFields();            
        }

        protected void selectDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            hidePanels();
            resetFields();

            if (selectDDL.SelectedValue == "studID")            
                searchStudIDPnl.Visible = true;                        
            else
                searchSectionPnl.Visible = true;                            
        }

        private void hidePanels()
        {
            searchStudIDPnl.Visible = false;
            searchSectionPnl.Visible = false;
            studentInfoPnl.Visible = false;
            gridViewPnl.Visible = false;
            schedTimeTablePnl.Visible = false;
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            if (btn.ID == "sStudBtn")
            {
                var getStudent = webService.getStudent(sStudIDTB.Text);
                var subjList = webService.getStudSched(sStudIDTB.Text);

                if (subjList != null)
                {
                    fillSchedule(subjList);
                    fillTimeSchedTable(subjList);
                    studentInfoPnl.Visible = true;
                    gridViewPnl.Visible = true;
                    schedGV.Visible = true;
                    idLbl.Text = getStudent.stud_id;
                    nameLbl.Text = getStudent.name;
                    sectionLbl.Text = getStudent.stud_section;
                    sStatusLbl.Text = "";
                    Session["selected"] = getStudent.stud_section;
                }
                else
                {
                    sStatusLbl.Text = "ID not found";
                    gridViewPnl.Visible = false;
                    schedGV.Visible = false;
                }
            }
            else
            {
                var subjList = webService.getSectionSched(sectionListDDL.Text);
                fillSchedule(subjList);
                fillTimeSchedTable(subjList);
                Session["selected"] = sectionListDDL.Text;
            }

        }

        private void fillSchedule(List<subject> subjList)
        {
            schedGV.DataSource = subjList;
            schedGV.DataBind();            
            gridViewPnl.Visible = true;
            schedTimeTablePnl.Visible = true;            
        }

        private void resetFields()
        {            
            sStudIDTB.Text = "";
            sectionListDDL.SelectedIndex = 0;
            dayDDL.SelectedIndex = 0;
        }

        protected void dayDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            String section = Session["selected"].ToString();
            fillTimeSchedTable(webService.getSectionSched(section));
            if (dayDDL.Text == "All")     
            {
                var sched = webService.getSectionSched(section);
                fillSchedule(sched);
                gStatus.Text = "";
            }
            else if (dayDDL.Text == "Today")
            {
                string dayNow = DateTime.Now.Date.DayOfWeek.ToString();
                var sched = webService.getDaySched(dayNow, section);
                fillSchedule(sched);
                gStatus.Text = "";
            }
            else
            {
                var sched = webService.getDaySched(dayDDL.SelectedValue, section);
                if (sched.Count > 0)
                {
                    fillSchedule(sched);
                    gStatus.Text = "";
                }
                else
                {
                    fillSchedule(sched);
                    gStatus.Text = "No schedule";
                }
            }
        }

        private void fillTimeSchedTable(List<subject> subjList)
        {           
            for (int i = 0; i < 7; i++)
            {
                List<subject> dayList = new List<subject>();

                foreach (subject sbj in subjList)
                    if (sbj.day.Contains(getDay(i)))
                        dayList.Add(sbj);

                for (int a = 1; a < schedTimeTbl.Rows.Count; a++)
                {
                    Boolean flag = false;
                    String[] rowID = new String[2];
                    String ID = "";

                    foreach (subject subj in dayList)
                    {
                        String[] rowIdx = getTblRowID(subj.time);
                        if (rowIdx[0] == schedTimeTbl.Rows[a].ID)
                        {
                            rowID = rowIdx;
                            flag = true;
                            ID = subj.subj_id;
                        }
                    }

                    if (flag)
                    {                        
                        TableCell cell = new TableCell
                        {
                            CssClass = "event",
                            RowSpan = int.Parse(rowID[1]),
                            Text = ID
                        };
                        schedTimeTbl.Rows[a].Controls.Add(cell);
                        a += Convert.ToInt32(rowID[1]) - 1;
                    }
                    else
                    {
                        String rIdx = schedTimeTbl.Rows[a].ID;                        
                        int id = Convert.ToInt32(rIdx.Substring(3));
                        if ((id & 1) == 0)
                        {
                            TableCell cell = new TableCell();
                            cell.RowSpan = 2;
                            schedTimeTbl.Rows[a].Controls.Add(cell);
                            a += 1;
                        }
                        else
                        {
                            TableCell cell = new TableCell();
                            schedTimeTbl.Rows[a].Controls.Add(cell);
                        }
                    }
                }
            }                     
        }

        private String[] getTblRowID(String time)
        {
            String[] rowID = new String[2];
            String[] timeSplit = time.Split('-');
            int time1Cnt = 0;
            int time1Val = 0;

            if (timeSplit[0].Length == 4)
            {
                if (timeSplit[0].Remove(0, 2) != "30")
                {
                    rowID[0] = "row" + timeSplit[0][0];
                    time1Cnt = 2;
                    time1Val = Convert.ToInt32(timeSplit[0][0].ToString());
                }
                else
                {
                    rowID[0] = "row" + timeSplit[0][0] + "5";
                    time1Cnt = 1;
                    time1Val = Convert.ToInt32(timeSplit[0][0].ToString());
                }
            }
            else
            {
                if (timeSplit[0].Remove(0, 3) != "30")
                {
                    rowID[0] = "row" + timeSplit[0].Substring(0,2);
                    time1Cnt = 2;
                    time1Val = Convert.ToInt32(timeSplit[0].Substring(0, 2));
                }
                else
                {
                    rowID[0] = "row" + timeSplit[0].Substring(0,2) + "5";
                    time1Cnt = 1;
                    time1Val = Convert.ToInt32(timeSplit[0].Substring(0, 2));
                }
            }

            if (timeSplit[1].Length == 4)
            {
                if (timeSplit[1].Remove(0, 2) != "30")
                {
                    int t2 = Convert.ToInt32(timeSplit[1][0].ToString()) - 1;
                    rowID[1] = ((t2 - time1Val) * 2 + time1Cnt).ToString();
                }                 
                else
                {
                    int t2 = Convert.ToInt32(timeSplit[1][0].ToString()) - 1;
                    rowID[1] = (((t2 - time1Val) * 2) + 1 + time1Cnt).ToString();
                }
            }
            else
            {
                if (timeSplit[1].Remove(0, 3) != "30")
                {
                    int t2 = Convert.ToInt32(timeSplit[1].Substring(0, 2).ToString()) - 1;
                    rowID[1] = ((t2 - time1Val) * 2 + time1Cnt).ToString();
                }                 
                else
                {
                    int t2 = Convert.ToInt32(timeSplit[1].Substring(0, 2).ToString()) - 1;
                    rowID[1] = (((t2 - time1Val) * 2) + 1 + time1Cnt).ToString();
                }
            }

            return rowID;
        }

        private String getDay(int id)
        {
            switch (id)
            {
                case 0:
                    return "Monday";                    
                case 1:
                    return "Tuesday";                    
                case 2:
                    return "Wednesday";                    
                case 3:
                    return "Thursday";                    
                case 4:
                    return "Friday";                    
                case 5:
                    return "Saturday";                    
                case 6:
                    return "Sunday";
                default:
                    return null;
            }
        }
    }
}
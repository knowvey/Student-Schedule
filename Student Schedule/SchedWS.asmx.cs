using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Student_Schedule.Model;

namespace Student_Schedule
{
    /// <summary>
    /// Summary description for SchedWS
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class SchedWS : System.Web.Services.WebService
    {
        DBModel model = new DBModel();

        [WebMethod]
        public List<String> getSectionList()
        {
            return model.getSectionList();
        }

        [WebMethod]
        public List<subject> getStudSched(String id)
        {
            return model.getStudSched(id);
        }

        public List<subject> getSectionSched(String section)
        {
            return model.getSectionSched(section);
        }

        [WebMethod]
        public student getStudent(String id)
        {
            return model.getStudent(id);
        }

        [WebMethod]
        public List<subject> getDaySched(String day, String section)
        {
            return model.getDaySched(day, section);
        }
    }
}

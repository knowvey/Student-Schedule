using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Student_Schedule.Model
{
    public class DBModel
    {
        studentschedEntities db = new studentschedEntities();

        public student getStudent(String id)
        {
            try
            {
                student stud = (from c in db.students
                                where c.stud_id == id || c.id == 2
                                select c).First();
                return stud;
            }
            catch (Exception)
            {
                return null;                                
            }
        }

        public List<subject> getSubjList()
        {
            try
            {
                List<subject> subj = (from c in db.subjects select c).ToList();
                return subj;
            }
            catch (Exception)
            {
                return null;               
            }            
        }

        public List<String> getSectionList()
        {
            List<String> list = new List<String>();
            List<subject> subjList = getSubjList();

            foreach (subject sub in subjList)
            {
                if (!list.Contains(sub.stud_section))
                    list.Add(sub.stud_section);
            }

            return list;
        }

        public List<subject> getStudSched(String id)
        {
            try
            {
                stud_sched getStudSection = (from c in db.stud_sched
                                             where c.stud_id == id
                                             select c).First();

                List<subject> subjList = (from c in db.subjects
                                          where c.stud_section == getStudSection.stud_section
                                          select c).ToList();

                return subjList;
            }
            catch (Exception)
            {
                return null;               
            }
            
        }

        public List<subject> getSectionSched(String section)
        {
            try
            {
                List<subject> subjList = (from c in db.subjects
                                          where c.stud_section == section
                                          select c).ToList();
                return subjList;
            }
            catch (Exception)
            {
                return null;                
            }
            
        }

        public List<subject> getDaySched(String day, String section)
        {
            try
            {
                List<subject> current = (from c in db.subjects
                                     where c.day.Contains(day) &&
                                     c.stud_section == section
                                     select c).ToList();
                return current;
            }
            catch (Exception)
            {
                return null;                
            }
        }
    }
}
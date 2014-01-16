using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QuickNote
{
    public class Note
    {
        public String noteTitle;
        public String noteText;
        public DateTime createDate;
        public List<String> tagsList;

        public Note(String _noteTitle, String _noteText)
        {
            noteTitle = _noteTitle;
            noteText = _noteText;
            createDate = DateTime.Now;
            tagsList = new List<String>();
        }
    }
}

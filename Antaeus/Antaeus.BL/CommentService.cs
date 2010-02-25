using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;

namespace Antaeus.BL
{
    public class CommentService
    {
        public JB8ORMDataContextFactory ContextFactory = EnvironmentHelper.Current.ContextFactory;
        public IIDProvider IDProvider = new DBIDProvider();
        public ITimeProvider TimeProvider = new SimpleTimeProvider();

        public Result AddComment(string username, string content, KEYID ki, string parentId)
        {
            var con = ContextFactory.GetNewContext();
            Comment com = new Comment()
            {
                CommentID = IDProvider.GetNewId("Comment"),
                Content = content,
                CreatedTime = TimeProvider.Now,
                CrUserName = username,
                KID = ki.ToString(),
                ParentCID = parentId,
                Floor = 0
            };
            con.Comments.InsertOnSubmit(com);
            con.SubmitChanges();
            return Result.Success();
        }

        public IQueryable<Comment> GetComments(KEYID ki)
        {
            var con = ContextFactory.GetNewContext();
            var cs = from com in con.Comments
                     where com.KID == ki.ToString()
                     select com;
            return cs;
        }
    }
}
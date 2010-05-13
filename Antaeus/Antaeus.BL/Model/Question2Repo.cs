using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.BL
{
    public class Question2Repo :IRepo<Question2>
    {
        private IIDProvider idprovider;

        public Question2Repo(IIDProvider idprovider)
        {
            // TODO: Complete member initialization
            this.idprovider = idprovider;
        }

        public Question2 GetOne(KEYID id)
        {
            return null;
        }

        public List<Question2> GetList(List<KEYID> ids)
        {
            return null;
        }

        public Question2 Create()
        {
            return new Question2();
        }


        public Question2 Save(Question2 q)
        {
            q._id = idprovider.GetNewId("Question2");
            return q;
        }
    }
}

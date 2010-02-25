using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;
using System.Linq.Expressions;

namespace Antaeus.BL.Model
{
    public abstract class BaseRepository<T> : IRepository<T>
    {
        public JB8ORMDataContextFactory ContextFactory = EnvironmentHelper.Current.ContextFactory;


        #region IRepository<T> Members

        public abstract Result Insert(T obj);

        public abstract T Find(long id);

        public abstract Result Delete(long id);

        public abstract IEnumerable<T> Select(Expression<Func<T, bool>> predicate);

        #endregion
    }

    public static class BaseRepositoryExtesion
    {
        public static IEnumerable<T> SelectAll<T>(this BaseRepository<T> res)
        {
            return res.Select(item => true);
        }

    }
}

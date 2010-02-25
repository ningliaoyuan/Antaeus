using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Antaeus.BL.Model
{
    public interface IRepository<T>
    {
        Result Insert(T obj);
        T Find(long id);
        Result Delete(long id);
        IEnumerable<T> Select(Expression<Func<T, bool>> predicate);
    }
}

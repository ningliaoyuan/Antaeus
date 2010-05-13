using System;
using System.Collections.Generic;
namespace Antaeus.BL
{
    interface IRepo<TEntity> where TEntity:IEntity
    {
        TEntity Create();
        List<TEntity> GetList(List<KEYID> ids);
        TEntity GetOne(KEYID id);
    }
}

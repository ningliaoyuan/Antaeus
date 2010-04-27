using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus
{
    /// <summary>
    /// 重新设计整体题目的数据结构
    /// 
    /// 1.题目加载时，只包含qid
    /// 2.题目可以查询出完整的自身的信息
    /// 
    /// 3.题目默认会缓存在服务器端
    /// 
    /// 4.对题目的更新操作可以直接写入数据库，题目内包含写入数据库的代码
    /// 5.对题目的写操作需要做线程锁
    /// 
    /// 题目的创建由Service完成
    /// 题目集合的查询由QuestionQueryService负责，QuestionService会返回一个qid列表
    /// 
    /// 需要一个QuestionRepository来维护缓存题目库的维护(TODO:v2需要记录题目缓存利用情况）
    /// 
    /// 
    /// 
    /// </summary>
    public class Question2
    {
        public Question2(long id)
        {
            ID = id;
        }


        private long ID;
        // base info
        // CrTime CrUser

        // 
    }

    public class Question2Helper
    {
        public Question2 GetQuestion(long id)
        {
            return null;
        }


        public Question2 CreateQuestion()
        {
            return null;
        }

        public Result InsertQuestion(Question2 q)
        {
            return Result.Error("");
        }

    }
    public class Question2QueryService
    {
    }


}

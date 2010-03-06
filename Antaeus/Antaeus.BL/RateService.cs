using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Antaeus.ORM;

namespace Antaeus.BL
{
    public class RateService
    {
        public JB8ORMDataContextFactory ContextFactory = EnvironmentHelper.Current.ContextFactory;
        public IIDProvider IDProvider = new DBIDProvider();
        public ITimeProvider TimeProvider = new SimpleTimeProvider();

        public bool CanMultipleRate = true;

        public Result Rate(string userName, KEYID keyId, int score)
        {

            if (CanMultipleRate)
            {
                return InsertRate(userName, keyId, score);

            }
            else
            {
                var con = ContextFactory.GetNewContext();
                var rate = con.Rates.SingleOrDefault(r => r.CrUserName == userName && r.KID == keyId.ToString());
                if (rate == null)
                {
                    return InsertRate(userName, keyId, score);
                }
                else
                {
                    return Result.Error("already have rated the object");
                }
            }
        }

        public Score GetScore(KEYID keyId)
        {
            // TODO:用触发器或统计表实现
            var con = ContextFactory.GetNewContext();
            var rates = from rate in con.Rates
                        where rate.KID == keyId.ToString()
                        select rate;
            int times = rates.Count();
            int sum = times == 0 ? 0 : rates.Sum(r => r.Score);
            return new Score()
            {
                Sum = sum,
                Times = times
            };
        }

        Result InsertRate(string userName, KEYID keyId, int score)
        {
            var con = ContextFactory.GetNewContext();
            Rate rate = CreateNewRate(userName, keyId, score);
            con.Rates.InsertOnSubmit(rate);
            con.SubmitChanges();
            return Result.Success();
        }
        Rate CreateNewRate(string userName, KEYID keyId, int score)
        {
            var rate = new Rate()
            {
                RateID = IDProvider.GetNewId("Rate"),
                CrUserName = userName,
                CreatedTime = TimeProvider.Now,
                KID = keyId.ToString(),
                Score = score
            };
            return rate;
        }
    }

    public class KEYID
    {
        public KEYID(string key, long id)
        {
            KEY = key;
            ID = id;
        }
        public KEYID(string keyid)
        {
            if (!Valid(keyid))
            {
                throw new Exception(string.Format("the key {0} is not a valid KEYID", keyid));
            }

            var keyids = keyid.Split('_');
            KEY = keyids[0];
            ID = long.Parse(keyids[1]);
        }

        public static bool Valid(string keyid)
        {
            if (string.IsNullOrEmpty(keyid)) return false;

            var keyids = keyid.Split('_');
            if (keyids.Length == 2)
            {
                long l;
                if (long.TryParse(keyids[1], out l))
                {
                    return true;
                }
            }
            return false;
        }

        public string KEY;
        public long ID;

        public override string ToString()
        {
            return string.Format("{0}_{1}", KEY, ID.ToString());
        }
    }
    public class Score
    {
        public int Sum;
        public int Times;

        public decimal Average
        {
            get
            {
                if (Times == 0) return 0;
                return Decimal.Divide(Sum, Times);
            }
        }
    }

    public interface IWithRate : IHasKEYID
    {
    }
        
    public interface IHasKEYID
    {
        KEYID GetKeyId();
    }

    public static class RateHelper
    {
        static RateService RateService = new RateService();

        public static decimal GetAverage(this IWithRate model)
        {
            KEYID ki = model.GetKeyId();
            return RateService.GetScore(ki).Average;
        }
    }
}

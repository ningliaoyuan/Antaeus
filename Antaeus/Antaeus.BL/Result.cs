using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.BL
{
    /// <summary>
    /// Common result class
    /// </summary>
    public class Result
    {
        public bool IsSuccess;
        public string ErrorMessage;
        public string Details;


        public static Result Error(string errorMessage)
        {
            return Error(errorMessage, string.Empty);
        }

        public static Result Success()
        {
            return new Result()
            {
                IsSuccess = true
            };
        }

        public static Result Error(string errorMessage, string details)
        {
            return new Result()
            {
                IsSuccess = false,
                ErrorMessage = errorMessage,
                Details = details
            };
        }

        public string ToAjaxMessage()
        {
            if (IsSuccess)
            {
                return "ok";
            }
            else
            {
                return "error:" + this.ErrorMessage;
            }
        }
    }
}

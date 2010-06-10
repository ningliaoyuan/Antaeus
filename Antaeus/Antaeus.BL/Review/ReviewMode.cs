using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.BL.Review
{
    public enum ReviewMode
    {
        // all      全面复习：将平均分配不同题型的复习时间
        // verbal   偏重语文：语文部分的复习时间将占多数
        // sc       偏重SC：语法题（Sentences Corrected）的复习时间将会加长
        // cr       偏重CR：逻辑题（Critical Reasoning）的复习时间将会加长
        // rc       偏重RC：阅读题（Reading Comprehension）的复习时间将会加长
        // math     偏重数学：数学题（Data Sufficient & Problem Solving）的复习时间将会加长
        all,
        verbal,
        sc,
        cr,
        rc,
        math
    }
}

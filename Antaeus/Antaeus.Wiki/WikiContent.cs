using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.Wiki
{
    public class WikiContent
    {

        public const Int32 MaxValue = 4000;

        public WikiContent(String content)
            : this()
        {
            this.Text = content;
        }

        public WikiContent()
        {

        }

        private String text;

        public String Text
        {
            set
            {
                this.text = value;
                if (this.text.Length > MaxValue)
                {
                    throw new WikiException("The length of wiki content overflow. max length is " + MaxValue.ToString());
                }
            }
            get { return this.text; }
        }

        public int Length
        {
            get
            {
                if (String.IsNullOrEmpty(this.Text))
                {
                    return 0;
                }
                else
                {
                    return this.Text.Length;
                }
            }
        }

        public override string ToString()
        {
            return this.Text;
        }
    }
}

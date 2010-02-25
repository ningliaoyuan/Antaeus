using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.Wiki
{
    public class WikiName
    {
        public const Int32 MaxValue = 100;

        public WikiName(String name)
            : this()
        {
            this.Text = name;
        }

        public WikiName() { }

        private String text;

        public String Text
        {
            set
            {
                this.text = value;
                if (this.text.Length > MaxValue)
                {
                    throw new WikiException("The length of wiki name overflow. max length is " + MaxValue.ToString());
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

        public override bool Equals(object obj)
        {
            if (obj == null)
            {
                return false;
            }

            if (this.GetType() != obj.GetType())
            {
                return false;
            }

            if (this.Text != (obj as WikiName).Text)
            {
                return false;
            }

            return true;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}

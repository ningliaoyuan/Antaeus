using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Antaeus.Wiki
{
    interface IWikiProvider
    {
        void WriteWiki(Wiki wiki);

        void WriteWiki(WikiName name, WikiContent content);

        Wiki GetLatestWiki(WikiName name);

        Wiki GetWiki(WikiName name, WikiVersion version);

        WikiVersion GetLatestWikiVersion(WikiName name);

        List<Wiki> GetWikiList(WikiName name);

        void RestoreTo(WikiName name, WikiVersion version);
    }
}

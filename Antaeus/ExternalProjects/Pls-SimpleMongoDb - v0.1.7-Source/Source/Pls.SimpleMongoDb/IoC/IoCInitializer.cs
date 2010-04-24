using System.IO;
using Newtonsoft.Json;
using Pls.SimpleMongoDb.Globalization;
using Pls.SimpleMongoDb.Serialization;

namespace Pls.SimpleMongoDb.IoC
{
    public static class IoCInitializer
    {
        public static void InitializeIoC(ISimoIoC container)
        {
            container.RegisterNoArgs<ISimoPluralizer>(() => new SimoPluralizer());

            container.RegisterWithArgs<IDocumentWriter>(args =>
            {
                var stream = args.Get<Stream>(0);
                return new DocumentWriter(stream);
            });

            container.RegisterWithArgs<ISelectorWriter>(args =>
            {
                var stream = args.Get<Stream>(0);
                return new SelectorWriter(stream);
            });

            container.RegisterNoArgs<JsonSerializer, IDocumentWriter>(() =>
                new JsonSerializer
                {
                    MissingMemberHandling = MissingMemberHandling.Ignore,
                    NullValueHandling = NullValueHandling.Ignore
                });

            container.RegisterNoArgs<JsonSerializer, IDocumentReader>(() =>
                new JsonSerializer
                {
                    MissingMemberHandling = MissingMemberHandling.Ignore
                });

            container.RegisterNoArgs<JsonSerializer, ISelectorWriter>(() =>
                new JsonSerializer
                {
                    MissingMemberHandling = MissingMemberHandling.Ignore,
                    NullValueHandling = NullValueHandling.Ignore,
                    //DefaultValueHandling = DefaultValueHandling.Ignore,
                });
        }
    }
}
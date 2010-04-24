using System.IO;
using Pls.SimpleMongoDb.Globalization;
using Pls.SimpleMongoDb.IoC;
using Pls.SimpleMongoDb.Serialization;

namespace Pls.SimpleMongoDb
{
    public class SimoEngine : ISimoEngine
    {
        public static SimoEngine Instance { get; private set; }

        public ISimoIoC IoC { get; private set; }

        static SimoEngine()
        {
            Instance = new SimoEngine();
        }

        private SimoEngine()
        {
            var container = new SimoIoC();
            IoCInitializer.InitializeIoC(container);

            IoC = container;
        }
    }
}
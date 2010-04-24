using Pls.SimpleMongoDb.IoC;

namespace Pls.SimpleMongoDb
{
    public interface ISimoEngine
    {
        ISimoIoC IoC { get; }
    }
}
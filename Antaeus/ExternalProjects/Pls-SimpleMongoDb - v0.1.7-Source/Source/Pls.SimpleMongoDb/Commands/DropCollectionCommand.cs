namespace Pls.SimpleMongoDb.Commands
{
    public class DropCollectionCommand
        : DatabaseCommand
    {
        /// <summary>
        /// Defines the Database-name that holds the collection to be dropped.
        /// </summary>
        public string DatabaseName
        {
            get { return NodeName; }
            set { NodeName = value; }
        }

        /// <summary>
        /// Defined the Colleciton to be dropped.
        /// </summary>
        public string CollectionName { get; set; }

        public DropCollectionCommand(ISimoConnection connection)
            : base(connection, null)
        {
        }

        protected override void OnExecute(ISimoConnection connection)
        {
            Command = new { drop = CollectionName };

            base.OnExecute(connection);
        }
    }
}
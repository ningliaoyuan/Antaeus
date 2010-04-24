using System.Collections.Generic;
using System.Data.Entity.Design.PluralizationServices;
using System.Globalization;

namespace Pls.SimpleMongoDb.Globalization
{
    public class SimoPluralizer 
        : ISimoPluralizer
    {
        private readonly Dictionary<string, string> _specificPluralizations;
        private readonly PluralizationService _service;

        public CultureInfo Culture
        {
            get { return _service.Culture; }
        }

        public bool IsEnabled { get; private set; }

        public SimoPluralizer()
        {
            _specificPluralizations = new Dictionary<string, string>();
            _service = PluralizationService.CreateService(new CultureInfo("en"));
            IsEnabled = true;
            InitializeSpecificPluralizations();
        }

        private void InitializeSpecificPluralizations()
        {
            AdjustPluralization("Person", "Persons");
            AdjustPluralization("Child", "Childs");
        }

        public void AdjustPluralization(string value, string pluralized)
        {
            _specificPluralizations.Add(value, pluralized);
        }

        public void ClearPluralizationAdjustments()
        {
            _specificPluralizations.Clear();
        }

        public string Pluralize(string value)
        {
            if (!IsEnabled)
                return value;

            return !_specificPluralizations.ContainsKey(value) ?
                                                                   _service.Pluralize(value) : _specificPluralizations[value];
        }

        public void Disable()
        {
            IsEnabled = false;
        }

        public void Enable()
        {
            IsEnabled = true;
        }
    }
}



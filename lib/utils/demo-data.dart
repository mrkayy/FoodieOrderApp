class Activities {
  final String _entryTitle;
  final _comEntry;
  final int _totEntry;

  Activities(this._entryTitle, this._comEntry, this._totEntry);
}

List<Activities> activities = [
  Activities("Orders",3,10),
  Activities("Contacts",9,10),
  Activities("Failed",2,10),
  Activities("Completed",6,10),
  Activities("Saved",6,10),
  Activities("Demo",40,70),
];
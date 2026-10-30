class Jeepney {
  String route;
  int passengerCapacity;
  double _fare;

  Jeepney(this.route, this.passengerCapacity, this._fare);

  double get fare => _fare;

  set fare(double value) {
    if (value > 0) {
      _fare = value;
    }
  }

  void runEngine() {
    print('Jeep for route "$route" starting up...');
  }

  Future<void> syncNewRoute(String updatedRoute) async {
    print('Syncing new route to server for $route...');
    
    await Future.delayed(Duration(seconds: 2));
    
    route = updatedRoute;
    print('Done! Route changed to: $route');
  }

  void showInfo() {
    print('Route: $route | Seats: $passengerCapacity | Fare: ₱$_fare');
  }
}

void main() async {
  List<Jeepney> myJeeps = [
    Jeepney('Quirino - Quiapo', 20, 15.0),
    Jeepney('SM Manila - Baclaran', 18, 20.0),
  ];

  for (var j in myJeeps) {
    j.showInfo();
  }

  print('\nTriggering async cloud update...');
  await myJeeps[0].syncNewRoute('Quirino - Quiapo via Taft');

  myJeeps[0].showInfo();
}
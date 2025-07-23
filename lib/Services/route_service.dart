class RouteService {
  static String getBestRoute(String destination) {
    final routes = {
      'nairobi cbd': 'Take Route A via Waiyaki Way - ETA: 15 mins',
      'westlands': 'Take Route B via Ring Road - ETA: 12 mins',
      'kasarani': 'Take Route C via Thika Superhighway - ETA: 25 mins',
    };

    return routes[destination] ??
        'No optimal route found for "$destination". Please try again.';
  }
}

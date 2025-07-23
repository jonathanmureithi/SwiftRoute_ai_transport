String getSimulatedRoute(String destination, {String? from, String? mode}) {
  final dest = destination.trim().toLowerCase();
  final origin = (from ?? '').trim().toLowerCase();
  final transport = (mode ?? '').trim().toLowerCase();

  // CBD <-> Kasarani
  if ((origin == 'cbd' && dest == 'kasarani') || (origin == 'kasarani' && dest == 'cbd')) {
    if (transport == 'matatu') {
      return 'Take Matatu/Bus from CBD via Thika Road and alight at Kasarani.\nEstimated Time: 40 mins\nFare: KES 80\nTraffic: High during rush hour';
    } else if (transport == 'car') {
      return 'Drive from CBD to Kasarani via Thika Superhighway.\nEstimated Time: 25 mins\nTraffic: Moderate\nFuel Cost: KES 250';
    } else if (transport == 'walking') {
      return 'Walk from CBD to Kasarani (not recommended).\nEstimated Time: 2 hrs 30 mins\nBring water and sunscreen.';
    }
  }

  // CBD <-> Westlands
  if ((origin == 'cbd' && dest == 'westlands') || (origin == 'westlands' && dest == 'cbd')) {
    if (transport == 'matatu') {
      return 'Take Matatu/Bus from CBD to Westlands via Waiyaki Way.\nEstimated Time: 20 mins\nFare: KES 50\nTraffic: Moderate';
    } else if (transport == 'car') {
      return 'Drive from CBD to Westlands via Waiyaki Way.\nEstimated Time: 15 mins\nTraffic: Moderate';
    } else if (transport == 'walking') {
      return 'Walk from CBD to Westlands.\nEstimated Time: 1 hr\nStay safe and hydrated.';
    }
  }

  // CBD <-> Thika Town
  if ((origin == 'cbd' && dest == 'thika town') || (origin == 'thika town' && dest == 'cbd')) {
    if (transport == 'matatu') {
      return 'Take Matatu/Bus from CBD to Thika Town via Thika Superhighway.\nEstimated Time: 1 hr 10 mins\nFare: KES 150\nTraffic: Heavy during peak hours';
    } else if (transport == 'car') {
      return 'Drive from CBD to Thika Town via Thika Superhighway.\nEstimated Time: 50 mins\nTraffic: Moderate';
    } else if (transport == 'walking') {
      return 'Walking from CBD to Thika Town is not recommended.\nEstimated Time: 6 hrs';
    }
  }

  // CBD <-> Rongai
  if ((origin == 'cbd' && dest == 'rongai') || (origin == 'rongai' && dest == 'cbd')) {
    if (transport == 'matatu') {
      return 'Take Matatu/Bus from CBD to Rongai via Langata Road.\nEstimated Time: 1 hr\nFare: KES 120\nTraffic: Heavy during rush hour';
    } else if (transport == 'car') {
      return 'Drive from CBD to Rongai via Langata Road.\nEstimated Time: 45 mins\nTraffic: Moderate';
    } else if (transport == 'walking') {
      return 'Walking from CBD to Rongai is not recommended.\nEstimated Time: 5 hrs';
    }
  }

  // CBD <-> Kikuyu Town
  if ((origin == 'cbd' && dest == 'kikuyu town') || (origin == 'kikuyu town' && dest == 'cbd')) {
    if (transport == 'matatu') {
      return 'Take Matatu/Bus from CBD to Kikuyu Town via Waiyaki Way.\nEstimated Time: 50 mins\nFare: KES 100\nTraffic: Moderate';
    } else if (transport == 'car') {
      return 'Drive from CBD to Kikuyu Town via Waiyaki Way.\nEstimated Time: 35 mins\nTraffic: Moderate';
    } else if (transport == 'walking') {
      return 'Walking from CBD to Kikuyu Town is not recommended.\nEstimated Time: 4 hrs';
    }
  }

  // CBD <-> Eastlands
  if ((origin == 'cbd' && dest == 'eastlands') || (origin == 'eastlands' && dest == 'cbd')) {
    if (transport == 'matatu') {
      return 'Take Matatu/Bus from CBD to Eastlands via Jogoo Road.\nEstimated Time: 30 mins\nFare: KES 60\nTraffic: Moderate';
    } else if (transport == 'car') {
      return 'Drive from CBD to Eastlands via Jogoo Road.\nEstimated Time: 25 mins\nTraffic: Moderate';
    } else if (transport == 'walking') {
      return 'Walk from CBD to Eastlands.\nEstimated Time: 1 hr 30 mins';
    }
  }

  // Default fallback
  return 'Route from ${from ?? "your location"} to $destination via $mode.\nEstimated Time: 1 hr\nFare: KES 100';
}
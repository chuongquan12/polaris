import 'package:latlong2/latlong.dart';

class MapMarker {
  final String? image;
  final String? title;
  final String? address;
  final LatLng? location;
  final int? rating;

  MapMarker({
    required this.image,
    required this.title,
    required this.address,
    required this.location,
    required this.rating,
  });
}

final mapMarkers = [
  MapMarker(
      image: 'assets/images/restaurant_1.jpg',
      title: 'Alexander The Great Restaurant',
      address: '8 Plender St, London NW1 0JT, United Kingdom',
      location: LatLng(10.4034969, 107.0406477),
      rating: 4),
  MapMarker(
      image: 'assets/images/restaurant_2.jpg',
      title: 'Mestizo Mexican Restaurant',
      address: '103 Hampstead Rd, London NW1 3EL, United Kingdom',
      location: LatLng(10.7996985, 106.6452884),
      rating: 5),
  MapMarker(
      image: 'assets/images/restaurant_3.jpg',
      title: 'The Shed',
      address: '122 Palace Gardens Terrace, London W8 4RT, United Kingdom',
      location: LatLng(10.8005104, 106.6464047),
      rating: 2),
  MapMarker(
      image: 'assets/images/restaurant_4.jpg',
      title: 'Gaucho Tower Bridge',
      address: '2 More London Riverside, London SE1 2AP, United Kingdom',
      location: LatLng(10.7993326, 106.6489262),
      rating: 3),
  MapMarker(
    image: 'assets/images/restaurant_5.jpg',
    title: 'Bill\'s Holborn Restaurant',
    address: '42 Kingsway, London WC2B 6EY, United Kingdom',
    location: LatLng(10.7985047, 106.6505167),
    rating: 4,
  ),
];

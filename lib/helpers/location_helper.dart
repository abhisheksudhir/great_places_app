import 'dart:convert';

import 'package:http/http.dart' as http;

// const GOOGLE_API_KEY = 'AIzaSyA9TlrnqWIGOzmOwZLzbggy4kgQkkObO1I';
const MAPBOX_API_KEY = 'pk.eyJ1IjoiYWJoaXNoZWtzdWRoaXIiLCJhIjoiY2tiaTBuMXFjMDllODJyczdjYjc3MjFydCJ9.7T4jreS4JHDR2S7RR2wL9A';

class LocationHelper {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    // return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/$longitude,$latitude,16,0,60/600x600?access_token=$MAPBOX_API_KEY';
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-s-marker+FF0000($longitude,$latitude)/$longitude,$latitude,18,0,60/600x600?access_token=$MAPBOX_API_KEY';
    // return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lon,) async {
    // final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key==$MAPBOX_API_KEY';
    final url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/$lon,$lat.json?&access_token=$MAPBOX_API_KEY'; //types=poi
    final response = await http.get(url);
    // return json.decode(response.body)['results'][0]['formatted_address'];
    return json.decode(response.body)['features'][0]['place_name'];
  }
}

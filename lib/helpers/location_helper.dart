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
}

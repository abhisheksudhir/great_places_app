import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart' as latlon;
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreen({
    this.initialLocation =
        const PlaceLocation(latitude: 19.052, longitude: 72.868),
    this.isSelecting = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // LatLng _pickedLocation;

  // void _selectLocation(LatLng position) {
  //   setState(() {
  //     _pickedLocation = position;
  //   });
  // }

  latlon.LatLng _pickedLocation;

  void _selectLocation(latlon.LatLng position) {
    if (widget.isSelecting) {
      setState(() {
        _pickedLocation = position;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
        actions: <Widget>[
          if (widget.isSelecting)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
            ),
        ],
      ),
      // body: GoogleMap(
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(
      //       widget.initialLocation.latitude,
      //       widget.initialLocation.longitude,
      //     ),
      //     zoom: 16,
      //   ),
      //   onTap: widget.isSelecting ? _selectLocation : null,
      //   markers: (_pickedLocation == null && widget.isSelecting)
      //       ? null
      //       : {
      //           Marker(
      //             markerId: MarkerId('m1'),
      //             position: _pickedLocation ??
      //                  LatLng(
      //                             widget.initialLocation.latitude,
      //                             widget.initialLocation.longitude,
      //                           ),
      //           ),
      //         },
      // ),

      // body: MapboxMap(
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(
      //       widget.initialLocation.latitude,
      //       widget.initialLocation.longitude,
      //     ),
      //     zoom: 16,
      //   ),
      //   onMapClick: widget.isSelecting ? _selectLocation : null,
      // ),
      body: FlutterMap(
        options: MapOptions(
          center: latlon.LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 16,
          onTap: _selectLocation,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/abhisheksudhir/ckbjfo4vr2et21imrfy9urtfv/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWJoaXNoZWtzdWRoaXIiLCJhIjoiY2tiaTBuMXFjMDllODJyczdjYjc3MjFydCJ9.7T4jreS4JHDR2S7RR2wL9A",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoiYWJoaXNoZWtzdWRoaXIiLCJhIjoiY2tiaTBuMXFjMDllODJyczdjYjc3MjFydCJ9.7T4jreS4JHDR2S7RR2wL9A',
                'id': 'mapbox.mapbox-streets-v8'
              }),
          MarkerLayerOptions(
              markers: (_pickedLocation == null && widget.isSelecting)
                  ? [
                      // Marker(
                      //   point: latlon.LatLng(
                      //     widget.initialLocation.latitude,
                      //     widget.initialLocation.longitude,
                      //   ),
                      //   builder: (ctx) => Container(
                      //     child: Icon(
                      //       Icons.location_on,
                      //       color: Colors.red,
                      //     ),
                      //   ),
                      // ),
                    ]
                  : [
                      Marker(
                        point: _pickedLocation == null
                            ? latlon.LatLng(
                                widget.initialLocation.latitude,
                                widget.initialLocation.longitude,
                              )
                            : latlon.LatLng(
                                _pickedLocation.latitude,
                                _pickedLocation.longitude,
                              ),
                        builder: (ctx) => Container(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ]),
        ],
      ),
    );
  }
}

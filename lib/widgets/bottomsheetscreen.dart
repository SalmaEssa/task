import 'dart:ffi';

import 'package:chatApp/providers/usera.dart';
import 'package:chatApp/screens/final_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatApp/helpers/location_helper.dart';
import 'package:chatApp/models/place.dart';
import 'package:location/location.dart';
import 'package:simple_location_picker/simple_location_picker_screen.dart';
import 'package:provider/provider.dart';

class BottomSheetscreen extends StatefulWidget {
  final String phon;
  final String name;
  BottomSheetscreen(this.name, this.phon);
  @override
  _BottomSheetscreenState createState() => _BottomSheetscreenState();
}

class _BottomSheetscreenState extends State<BottomSheetscreen> {
  String _mapView;
  String id;
  PlaceLocation locat;

  Future<void> _currentLocation() async {
    final location = await Location().getLocation();
    // print(location.altitude);
    setState(() {
      _mapView = LocationHelper.getStaticImageWithMarker(
          location.altitude, location.longitude);

      /* PlaceLocation newPlace = PlaceLocation(
          atitude: location.altitude,
          adress: null,
          longtude: location.longitude); */
      //widget.onpressedPlace(newPlace);
      //LocationHelper.tCity(location.altitude, location.longitude);
    });
  }

  void dynamicLocation(double latitude, double longitude) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SimpleLocationPicker(
                  zoomLevel: 10,
                  initialLatitude: latitude,
                  initialLongitude: longitude,
                ))).then((value) {
      if (value != null) {
        setState(() {
          _mapView = LocationHelper.getStaticImageWithMarker(
              value.latitude, value.longitude);
          submit(value.latitude, value.longitude);
          //widget.onpressedPlace(newPlace);
        });
      }
    });
  }

  Future<Void> submit(double lat, double long) async {
    var adress = await LocationHelper.tCity(lat, long);
    locat = PlaceLocation(atitude: lat, adress: adress, longtude: long);
    id = await Provider.of<Users>(context, listen: false)
        .addUser(widget.phon, widget.name, locat);
    //await Provider.of<Users>(context, listen: false).feacth();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          height: 250,
          width: double.infinity,
          child: _mapView == null
              ? Text(
                  "No Location Chosen",
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _mapView,
                  //fit: BoxFit.cover,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
            FlatButton.icon(
              onPressed: _currentLocation,
              icon: Icon(Icons.location_on),
              label: Text("Current Location"),
              textColor: Theme.of(context).primaryColor,
            ),*/

            FlatButton.icon(
              onPressed: () => dynamicLocation(30, 30),
              icon: Icon(Icons.map),
              label: Text("Select on map"),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LasrScreen.routeName,
                  arguments: {
                    "id": id,
                    "locatotion": locat.adress,
                    "phone": widget.phon,
                    "name": widget.name
                  });
            },
            child: Text(
              "Submit",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ))
      ],
    );
  }
}

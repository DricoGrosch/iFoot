import 'package:app/controllers/mapController.dart';
import 'package:app/models/match.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MatchCreationStep2 extends StatefulWidget {
  final Match match;
  final Function parentSetState;
  const MatchCreationStep2(this.match, this.parentSetState, {Key key})
      : super(key: key);

  @override
  _MatchCreationStep2State createState() =>
      _MatchCreationStep2State(match, parentSetState);
}

class _MatchCreationStep2State extends State<MatchCreationStep2> {
  final Match match;
  final Function parentSetState;
  GoogleMapController googleMapController;
  List<Marker> markers = [];
  MapController mapController = new MapController();

  _MatchCreationStep2State(this.match, this.parentSetState);

  void handleTap(LatLng latLng) {
    setState(() => {
          markers = [],
          markers.add(
              Marker(markerId: MarkerId(latLng.toString()), position: latLng)),
        });
    parentSetState(() => {
          match.latitude = latLng.latitude,
          match.longitude = latLng.longitude,
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return Container(
          height: MediaQuery.of(context).size.height / 2 + 100,
          child: GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: LatLng(snapshot.data.latitude, snapshot.data.longitude),
              zoom: 11,
            ),
            onMapCreated: (controller) => {googleMapController = controller},
            markers: Set.from(markers),
            onTap: handleTap,
          ),
        );
      },
      future: mapController.fetchCurrentLocation(),
    );
  }
}

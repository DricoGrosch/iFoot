import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MatchCreationStep2 extends StatefulWidget {
  const MatchCreationStep2({Key key}) : super(key: key);

  @override
  _MatchCreationStep2State createState() => _MatchCreationStep2State();
}

class _MatchCreationStep2State extends State<MatchCreationStep2> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2 + 100,
      child: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.427, -122.0834),
          zoom: 11,
        ),
        onMapCreated: (controller) => {mapController = controller},
      ),
    );
  }
}

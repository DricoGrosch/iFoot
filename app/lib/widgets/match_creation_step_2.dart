import 'package:app/models/match.dart';
import 'package:flutter/cupertino.dart';
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
  _MatchCreationStep2State(this.match, this.parentSetState);
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

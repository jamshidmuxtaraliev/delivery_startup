import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:delivery_startup/generated/assets.dart';
import 'package:delivery_startup/utils/app_colors.dart';
import 'package:delivery_startup/view/map_order_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_stopper/stopper.dart';
// import 'package:flutter_stopper/stopper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLen = <LatLng>[
    LatLng(40.36670366997483, 71.77366069638434),
    LatLng(40.36823792163901, 71.79024545747686),
    LatLng(40.378547708377525, 71.76931479096903),
    LatLng(40.36565820931183, 71.78354023776305)
  ];

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  Uint8List? marketimages;

  @override
  void initState() {
    // getPolyPoints();
    // getCurrentLocation();
    addMarkersData();
    super.initState();
  }

  Future<Uint8List> getImages(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  addMarkersData()async{
    for(int i=0 ;i<4; i++){
      final Uint8List markIcons = await getImages(Assets.imagesLocationStore3, 80);
      _markers.add(
          Marker(
            markerId: MarkerId(i.toString()),
            icon: BitmapDescriptor.fromBytes(markIcons),
            position: _latLen[i],
            infoWindow: InfoWindow(
              title: 'Location: '+i.toString(),
            ),
          )
      );
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      // currentLocation == null
        // ? const Center(child: Text("Loading")) :
    Stack(
            children: [
              GoogleMap(
                myLocationButtonEnabled: true,
                initialCameraPosition: const CameraPosition(
                  // target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                  target: LatLng(40.36565820931183, 71.78354023776305),
                  zoom: 13.5,
                ),
                markers: Set<Marker>.of(_markers),
                onMapCreated: (mapController) {
                  _controller.complete(mapController);
                },
                // polylines: {
                //   Polyline(
                //     polylineId: const PolylineId("route"),
                //     points: polylineCoordinates,
                //     color: const Color(0xFF7B61FF),
                //     width: 5,
                //   ),
                // },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 130,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, child){
                    return MapOrderItemView();
                  }),
                ),
              )
            ],
          );
  }

  // void getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     "AIzaSyCVy6B23XItbtD9R7TOqSeXnqu9YtXGlvI",
  //     PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
  //     PointLatLng(destination.latitude, destination.longitude),
  //   );
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach(
  //       (PointLatLng point) => polylineCoordinates.add(
  //         LatLng(point.latitude, point.longitude),
  //       ),
  //     );
  //     setState(() {});
  //   }
  // }

  void showBottomSheet(h){
    showStopper(
      context: context,
      stops: [0.4 * h, h],
      builder: (context, scrollController, scrollPhysics, stop) {
        return ClipRRect(
          borderRadius: stop == 0
              ? const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
              : const BorderRadius.only(),
          clipBehavior: Clip.antiAlias,
          child: Container(
            color: Colors.orange,
            child: CustomScrollView(
              slivers: <Widget>[
                const SliverAppBar(
                  title: Text("What's Up?"),
                  backgroundColor: Colors.orange,
                  automaticallyImplyLeading: false,
                  primary: false,
                  floating: true,
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, idx) => ListTile(
                      title: const Text("Nothing much"),
                      subtitle: Text("$idx"),
                    ),
                    childCount: 100,
                  ),
                )
              ],
              controller: scrollController,
              physics: scrollPhysics,
            ),
          ),
        );
      },
    );
  }

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ),
            ),
          ),
        );
        setState(() {});
      },
    );
  }
}

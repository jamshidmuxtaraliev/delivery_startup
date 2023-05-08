import 'dart:async';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:delivery_startup/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../generated/assets.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 45.0, left: 16.0, right: 16.0, bottom: 16.0),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Padding(
                      padding: EdgeInsets.only(right: 3.0),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Order details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    CherryToast(
                            icon: Icons.date_range,
                            themeColor: Colors.pink,
                            title: Text("Salom"),
                            displayTitle: false,
                            description: Text("A bottom cherry toast example"),
                            toastPosition: Position.bottom,
                            animationDuration: Duration(milliseconds: 1000),
                            autoDismiss: true)
                        .show(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Icon(
                      Icons.date_range_outlined,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  margin: const EdgeInsets.only(top: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GoogleMap(
                      initialCameraPosition: const CameraPosition(
                        // target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                        target: LatLng(40.36565820931183, 71.78354023776305),
                        zoom: 13.5,
                      ),
                      markers: {
                        const Marker(
                            markerId: MarkerId("store"),
                            position: LatLng(40.378547708377525, 71.76931479096903))
                      },
                      onMapCreated: (mapController) {
                        _controller.complete(mapController);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: const [
                    Text(
                      "Klient : ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Expanded(
                        child: Text(
                      "Ahmadjon aka bozor orqasi",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: const [
                    Text(
                      "Buyurtmma ID : ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Expanded(
                        child: Text(
                      "#105714",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: const [
                    Text(
                      "Manzil : ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Expanded(
                        child: Text(
                      "Farg'ona shahar Aeroport k.si 1-uy",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                const Divider(
                  color: AppColors.secondary,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Tovarlar",
                  style: TextStyle(fontSize: 18, color: AppColors.TEXT_COLOR2),
                  textAlign: TextAlign.right,
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(top: 0),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: 15,
                      padding: const EdgeInsets.only(top: 0),
                      itemBuilder: (_, position) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.blue.withOpacity(0.2),
                                width: 1,
                              )),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(Assets.imagesDrinks),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                            title: const Text("Pepsi cola 1,5 l"),
                            subtitle: const Text("5 dona * 12 000 so'm"),
                            style: ListTileStyle.drawer,
                            trailing: const Text(
                              "120 000 so'm",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                      }),
                )),
                Divider(
                  color: AppColors.GREY_ICON,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0, left: 6, right: 6),
                  child: Row(
                    children: [
                      Text(
                        "Umumiy summa : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.TEXT_COLOR2),
                      ),
                      const Expanded(
                          child: Text(
                        "1 250 000 so'm",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.right,
                      )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {},
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.blue),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: const Center(
                        child: Text(
                      "Yetkazib berish",
                      style: TextStyle(fontSize: 18, fontFamily: "semibold", color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

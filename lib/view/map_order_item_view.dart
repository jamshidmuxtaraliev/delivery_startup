import 'package:delivery_startup/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stopper/stopper.dart';

import '../generated/assets.dart';
import 'order_detail_item_view.dart';

class MapOrderItemView extends StatefulWidget {
  MapOrderItemView({
    Key? key,
  }) : super(key: key);

  @override
  State<MapOrderItemView> createState() => _MapOrderItemViewState();
}

class _MapOrderItemViewState extends State<MapOrderItemView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        showStopper(
          context: context,
          stops: [0.5 * h, h],
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
                color: AppColors.secondaryBg,
                child: Stack(
                  children: [
                    CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          title: Row(
                            children: [
                              const SizedBox(
                                width: 6,
                              ),
                              const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 5,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: Text(
                                  "Buyurtma Id : #18070",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.WHITE,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                "KUTILMOQDA",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.COLOR_COMPLETED,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 24,
                              )
                            ],
                          ),
                          backgroundColor: AppColors.PRIMARY_COLOR,
                          automaticallyImplyLeading: false,
                          primary: false,
                          floating: true,
                          pinned: true,
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, position) => OrderDetailItemView(),
                            childCount: 15,
                          ),
                        ),
                      ],
                      controller: scrollController,
                      physics: scrollPhysics,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Wrap(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(
                                      1,
                                      1,
                                    ),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    color: AppColors.nbarBg)
                              ],
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
                                  child: Text(
                                    "Farg'ona viloyati, Rishton tumani, Tinchlik ko'chasi 43-uy",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {},
                                  child: Container(
                                    height: 36,
                                    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12), color: Colors.blue),
                                    padding: const EdgeInsets.symmetric(horizontal: 18),
                                    child: const Center(
                                      child: Text(
                                        "Boshlash",
                                        style: TextStyle(
                                            fontSize: 20, fontFamily: "semibold", color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.only(left: 10, bottom: 8, top: 8),
        width: 240,
        height: 120,
        decoration: BoxDecoration(
            color: AppColors.WHITE,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: AppColors.COLOR_ORANGE.withOpacity(0.3),
                  offset: const Offset(
                    0.0,
                    0.0,
                  ),
                  blurRadius: 5,
                  spreadRadius: 1)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 5,
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    "id : #392070",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.TEXT_COLOR2,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  "KUTILMOQDA",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.COLOR_COMPLETED,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_up_outlined,
                  size: 14,
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.person,
                  size: 14,
                  color: AppColors.TEXT_COLOR,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Ahmadjon aka bozorni orqasi",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.TEXT_COLOR,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  maxLines: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.add_location_outlined,
                  size: 14,
                  color: AppColors.TEXT_COLOR,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    "Aeroport ko'chasi, Farg'ona, Uzbekistan",
                    style:
                        TextStyle(color: AppColors.TEXT_COLOR, fontSize: 16, overflow: TextOverflow.ellipsis),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Icon(
                  Icons.payment,
                  size: 14,
                  color: AppColors.TEXT_COLOR,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "1 250 000 so'm",
                  style: TextStyle(color: AppColors.TEXT_COLOR, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget scrollBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0,
      maxChildSize: 0.7,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.blue[100],
          child: ListView.builder(
            controller: scrollController,
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text('Item $index'));
            },
          ),
        );
      },
    );
  }
}

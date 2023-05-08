import 'package:delivery_startup/screens/main/order_list/order_type_screen.dart';
import 'package:delivery_startup/view/order_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class OrderListScreeen extends StatefulWidget {
  OrderListScreeen({Key? key}) : super(key: key);

  @override
  State<OrderListScreeen> createState() => _OrderListScreeenState();
}

class _OrderListScreeenState extends State<OrderListScreeen> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Container(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              unselectedLabelColor: AppColors.secondary,
              indicatorColor: AppColors.WHITE,
              labelStyle: TextStyle(fontSize: 18),
              indicatorWeight: 4,
              tabs: const [
                Tab(
                  text: "Umumiy zakazlar",
                ),
                Tab(
                  text: "Mening zakazlarim",
                ),
              ],
            ),
            Expanded(child: TabBarView(
              controller: _tabController,
                children: [
                  Container(
                    child: OrderTypeScreen(status: 1,),
                  ),
                  Container(
                    child: OrderTypeScreen(status: 2,),
                  ),
            ]))

          ],
        ),
      ),
    );
  }
}

import 'package:delivery_startup/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../view/order_item_view.dart';

class OrderTypeScreen extends StatefulWidget {
  int status;

  OrderTypeScreen({Key? key, required this.status}) : super(key: key);

  @override
  State<OrderTypeScreen> createState() => _OrderTypeScreenState();
}

class _OrderTypeScreenState extends State<OrderTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBg,
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {},
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 8),
                itemCount: 15,
                itemBuilder: (context, child) {
                  return OrderItemView(status: widget.status,);
                }),
          ),
        ],
      ),
    );
  }
}

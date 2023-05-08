import 'package:flutter/material.dart';

import '../generated/assets.dart';

class OrderDetailItemView extends StatefulWidget {
  const OrderDetailItemView({Key? key}) : super(key: key);

  @override
  State<OrderDetailItemView> createState() => _OrderDetailItemViewState();
}

class _OrderDetailItemViewState extends State<OrderDetailItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left:12, right:12, bottom: 8),
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
  }
}

import 'package:delivery_startup/generated/assets.dart';
import 'package:delivery_startup/screens/main/order_list/order_detail_screen.dart';
import 'package:delivery_startup/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderItemView extends StatefulWidget {
  int status;
  OrderItemView({Key? key, required this.status}) : super(key: key);

  @override
  State<OrderItemView> createState() => _OrderItemViewState();
}

class _OrderItemViewState extends State<OrderItemView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailScreen()));
      },
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 6),
        child: Container(
          padding: EdgeInsets.all( 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 5,
              ),
              SizedBox(width: 6,),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "id : 70",
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
                        (widget.status == 2) ? "YETKAZIB_BERILMOQDA" : "KUTILMOQDA",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: (widget.status == 2) ? AppColors.COLOR_COMPLETED : AppColors.COLOR_ACCENT,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Icon(CupertinoIcons.person, size: 14, color: AppColors.TEXT_COLOR,),
                      SizedBox(width: 4,),
                      Text(
                        "Klient : ",
                        style: TextStyle(color: AppColors.TEXT_COLOR, fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        "Ahmadjon aka bozorni orqasi",
                        style: TextStyle(color: AppColors.TEXT_COLOR, fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 6,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.add_location_outlined, size: 14, color: AppColors.TEXT_COLOR,),
                      SizedBox(width: 4,),
                      Expanded(
                        child: Text(
                          "Manzil : 1, Aeroport ko'chasi, Farg'ona, Uzbekistan",
                          style: TextStyle(color: AppColors.TEXT_COLOR,  fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6,),
                  Row(
                    children: [
                      Icon(Icons.payment, size: 14, color: AppColors.TEXT_COLOR,),
                      SizedBox(width: 4,),
                      Text(
                        "Summa : 1 250 000 so'm",
                        style: TextStyle(color: AppColors.TEXT_COLOR, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              )),
              SizedBox(width: 2,),
              Image.asset(Assets.imagesNext, width: 24, height: 24, color: AppColors.PRIMARY_COLOR,)
            ],
          ),
        ),
      ),
    );
  }
}

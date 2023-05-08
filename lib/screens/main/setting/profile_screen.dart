import 'package:delivery_startup/screens/main/setting/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../responsive/responsive.dart';
import '../../../responsive/size_config.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/style.dart';
import '../../../view/barchart_component.dart';
import '../../../view/header.dart';
import '../../../view/history_table.dart';
import '../../../view/info_card.dart';
import '../../../view/paymentdetails.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollControlle2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: double.infinity,
              height: SizeConfig.screenHeight,
              color: AppColors.secondaryBg,
              child: SingleChildScrollView(
                controller: scrollController1,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(),
                    SizedBox(height: 20),
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1 / 0.75,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        children: [
                          const InfoCard(
                            assetName: 'assets/images/credit-card.svg',
                            title: 'Mening \nBalansim',
                            amount: '\$1200',
                          ),
                          const InfoCard(
                            assetName: 'assets/images/pie-chart.svg',
                            title: 'Buyurtmalar \ntarixi',
                            amount: "\$150",
                          ),
                          const InfoCard(
                            assetName: 'assets/images/clipboard.svg',
                            title: "Mendagi tovarlar qoldig'i",
                            amount: '\$3000',
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                            },
                            child: const InfoCard(
                              assetName: 'assets/images/setting.svg',
                              title: 'Boshqa \nSozlamalar',
                              amount: '\$1500',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: const [
                            PrimaryText(
                              text: 'Balans',
                              size: 16,
                              fontWeight: FontWeight.w800,
                              color: AppColors.secondary,
                            ),
                            PrimaryText(
                              text: '\$1500',
                              size: 30,
                              fontWeight: FontWeight.w800,
                              //color: AppColors.secondary,
                            ),
                          ],
                        ),
                        const PrimaryText(
                          text: 'Oxirgi 30 KUNLIK',
                          size: 16,
                          //fontWeight: FontWeight.w800,
                          color: AppColors.secondary,
                        ),
                      ],
                    ),
                    // SizedBox(height: SizeConfig.blockSizeVertical! * 3),
                    const SizedBox(height: 20),
                    const SizedBox(
                      height: 180,
                      child: BarChartComponent(),
                    ),
                    // SizedBox(height: SizeConfig.blockSizeVertical! * 5),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        PrimaryText(
                          text: 'History',
                          size: 30,
                          color: AppColors.secondary,
                        ),
                        PrimaryText(
                          text: 'Transaction of last 6 months',
                          size: 16,
                          //color: AppColors.secondary,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                    // SizedBox(height: SizeConfig.blockSizeVertical! * 3),
                    SizedBox(height: 20),
                    HistoryTable(),
                    // if (!Responsive.isDesktop(context))
                    //   const PaymentDetailList(),
                  ],
                ),
              ))),
    );
  }
}

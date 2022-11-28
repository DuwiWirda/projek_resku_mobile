import 'dart:io';

import 'package:resku3/presentation/dashboard_screen/dashboard_screen.dart';
//import 'package:resku3/presentation/proses_screen/proses_screen.dart';
import '../validasi_screen/validasi_item_widget.dart';
import 'package:resku3/core/app_export.dart';
import 'package:flutter/material.dart';

class ValidasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesanan"),
        centerTitle: true,
        backgroundColor: ColorConstant.red800Bc,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            }),
      ),
      body: Form(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 106,
                    top: 5,
                    right: 106,
                  ),
                  child: Text(
                    "Pesanan Meja 1",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.black900,
                      fontSize: getFontSize(
                        15,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              // return Scaffold(
              //   appBar: AppBar(
              //     title: Text("Pesanan"),
              //     centerTitle: true,
              //     backgroundColor: ColorConstant.red800Bc,
              //     leading: IconButton(
              //         icon: Icon(Icons.arrow_back_rounded),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => DashboardScreen()),
              //           );
              //         }),
              //   ),
              //   body: Form(
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Align(
              //           alignment: Alignment.centerLeft,
              //           child: Padding(
              //             padding: getPadding(
              //               left: 50,
              //               top: 10,
              //               right: 50,
              //               bottom: 8,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              //   Container(
              //     height: getVerticalSize(
              //       28.00,
              //     ),
              //     width: getHorizontalSize(
              //       117.00,
              //     ),
              //     margin: getMargin(
              //       right: 10,
              //     ),
              //     child: Stack(
              //       alignment: Alignment.centerRight,
              //       children: [
              //         Align(
              //           alignment: Alignment.centerLeft,
              //           child: Container(
              //             height: getVerticalSize(
              //               28.00,
              //             ),
              //             width: getHorizontalSize(
              //               100.00,
              //             ),
              //             margin: getMargin(
              //               right: 10,
              //             ),
              //             decoration: BoxDecoration(
              //               color: ColorConstant.whiteA700,
              //               borderRadius: BorderRadius.circular(
              //                 getHorizontalSize(
              //                   10.00,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Align(
              //           alignment: Alignment.centerRight,
              //           child: Padding(
              //             padding: getPadding(
              //               left: 10,
              //               top: 6,
              //               bottom: 6,
              //             ),
              //             child: Text(
              //               "Pesanan MEJA 1",
              //               overflow: TextOverflow.ellipsis,
              //               textAlign: TextAlign.left,
              //               style: TextStyle(
              //                 color: ColorConstant.black900,
              //                 fontSize: getFontSize(
              //                   13,
              //                 ),
              //                 fontFamily: 'Inter',
              //                 fontWeight: FontWeight.w400,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),

              Container(
                height: getVerticalSize(
                  1.00,
                ),
                width: size.width,
                margin: getMargin(
                  top: 1,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.gray800,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 24,
                    top: 9,
                    right: 24,
                  ),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ValidasiItemWidget();
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: getVerticalSize(
                    39.00,
                  ),
                  width: getHorizontalSize(
                    84.00,
                  ),
                  margin: getMargin(
                    left: 24,
                    top: 143,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                  ),
                ),
              ),
              Container(
                margin: getMargin(
                  top: 36,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.bluegray100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 14,
                        bottom: 12,
                      ),
                      child: Text(
                        " Rp. 21.000",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            15,
                          ),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: getMargin(
                        left: 50,
                        top: 1,
                        bottom: 1,
                      ),
                      padding: getPadding(
                        left: 5,
                        top: 12,
                        right: 5,
                        bottom: 12,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.redA700A5,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()),
                          );
                        },
                        child: Text(
                          "BAYAR SEKARANG",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorConstant.whiteA700,
                            fontSize: getFontSize(
                              13,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
            // Align(
            //   alignment: Alignment.center,
            //   child: Padding(
            //     padding: getPadding(
            //       left: 24,
            //       top: 29,
            //       right: 24,
            //       bottom: 7,
            //     ),
            //     child: Text(
            //       "www.myresku.com",
            //       overflow: TextOverflow.ellipsis,
            //       textAlign: TextAlign.left,
            //       style: TextStyle(
            //         color: ColorConstant.gray700,
            //         fontSize: getFontSize(
            //           10,
            //         ),
            //         fontFamily: 'Inter',
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //   ),

            // ),
            ),
      ),
    );
  }
}

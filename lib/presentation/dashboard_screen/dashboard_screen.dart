import 'package:resku3/DrawerScreen.dart';
import 'package:resku3/core/app_export.dart';
import 'package:resku3/presentation/validasi_screen/validasi_screen.dart';
import 'package:resku3/widgets/custom_button.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesanan"),
        centerTitle: true,
        backgroundColor: ColorConstant.red800Bc,
      ),
      drawer: DrawerScreen(),
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
                  "Validasi menu",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorConstant.redA700,
                    fontSize: getFontSize(
                      15,
                    ),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              margin: getMargin(
                top: 8,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.bluegray1004f,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 24,
                      top: 18,
                      bottom: 18,
                    ),
                    child: Text(
                      "MEJA 10",
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
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ValidasiScreen()),
                        );
                      },
                      child: CustomButton(
                        width: 50,
                        text: "CEK",
                        margin: getMargin(
                          top: 14,
                          right: 20,
                          bottom: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: getMargin(
                top: 2,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.bluegray1004f,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 23,
                      top: 18,
                      bottom: 18,
                    ),
                    child: Text(
                      "MEJA 8",
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
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ValidasiScreen()),
                        );
                      },
                      child: CustomButton(
                        width: 50,
                        text: "CEK",
                        margin: getMargin(
                          top: 14,
                          right: 20,
                          bottom: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: getMargin(
                top: 2,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.bluegray1004f,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 24,
                      top: 18,
                      bottom: 18,
                    ),
                    child: Text(
                      "MEJA 7",
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
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ValidasiScreen()),
                        );
                      },
                      child: CustomButton(
                        width: 50,
                        text: "CEK",
                        margin: getMargin(
                          top: 14,
                          right: 20,
                          bottom: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: getPadding(
                  left: 106,
                  top: 198,
                  right: 106,
                  bottom: 7,
                ),
                child: Text(
                  "www.myresku.com",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorConstant.gray700,
                    fontSize: getFontSize(
                      10,
                    ),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      //drawer: DrawerScreen(),
    );
  }
}

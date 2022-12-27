import 'package:resku3/DrawerScreen.dart';
import 'package:resku3/core/app_export.dart';
import 'package:resku3/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:resku3/presentation/proses_screen/proses_screen.dart';
import 'package:resku3/presentation/validasi_screen/validasi_screen.dart';
import 'package:resku3/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("RESKU"),
          centerTitle: true,
          backgroundColor: ColorConstant.red800Bc,
        ),
        drawer: DrawerScreen(),
        body: GridView.count(
            padding: const EdgeInsets.all(30),
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(20),
                color: ColorConstant.whiteA700,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DashboardScreen()));
                    },
                    splashColor: ColorConstant.red800Bc,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.receipt_long_outlined,
                            size: 50,
                            color: Colors.redAccent,
                          ),
                          Text(
                            "Pesanan",
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.redAccent),
                          ),
                        ],
                      ),
                    )),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                color: ColorConstant.whiteA700,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DashboardScreen()));
                  },
                  splashColor: ColorConstant.red800Bc,
                  child: Center(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.shopping_cart_checkout_outlined,
                            size: 50,
                            color: Colors.redAccent,
                          ),
                          Text(
                            "Transaksi",
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.redAccent),
                          ),
                        ]),
                  ),
                ),
              ),
            ]));
  }
}

//           childAspectRatio: 0.68,
//           crossAxisCount: 2,
//           shrinkWrap: true,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(30),
//               // margin: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: ColorConstant.red800Bc,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Text(
//                         "6",
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: ColorConstant.whiteA700,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (_) => DashboardScreen()));
//                   },
//                   child: Center(
//                       child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: const <Widget>[
//                       Icon(
//                         Icons.restaurant,
//                         size: 60,
//                         color: Colors.redAccent,
//                       ),
//                       Text(
//                         "Pesanan",
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.redAccent,
//                         ),
//                       )
//                     ],
//                   )),
//                 )
//               ]),
//             ),
//           ],
//         ));
//   }
// }
   
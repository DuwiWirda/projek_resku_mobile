import 'dart:convert';

import 'package:resku3/home.dart';
import 'package:resku3/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:resku3/presentation/validasi_screen/validasi_screen.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../proses_screen/proses_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:resku3/core/app_export.dart';
import 'package:resku3/widgets/custom_button.dart';
import 'package:http/http.dart' as http;

class ProsesScreen extends StatefulWidget {
  int? value;
  ProsesScreen({Key? key, this.value}) : super(key: key);

  @override
  _ProsesScreenState createState() => _ProsesScreenState(value);
}

class _ProsesScreenState extends State<ProsesScreen> {
  int? value;
  _ProsesScreenState(this.value);
  Map? data;
  String? uri;
  @override
  void initState() {
    var url = "https://reqres.in/api/users/${value.toString()}";
    _getRefreshDaata(url);

    print("susu +${value}");
  }

  Future<void> _getRefreshDaata(url) async {
    setState(() {
      uri = url;
    });
    var response = await http.get(Uri.parse(uri.toString()),
        headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['data'];
    });
  }

  Widget _buildListTile() {
    return ListTile(
      title: Text(
        data!["first_name"],
      ),
      subtitle: Text(data!["email"]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.redA700A5,
          title: const Text('Pesanan'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => ValidasiScreen()),
              );
            }),
          ),
        ),
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 25,
                    top: 7,
                    right: 25,
                  ),
                  child: Text(
                    "Transaksi " + data!["first_name"],
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.red800,
                      fontSize: getFontSize(
                        15,
                      ),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: getVerticalSize(
                      1.00,
                    ),
                    width: size.width,
                    margin: getMargin(
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray800,
                    ),
                  ),
                ),
                Container(
                  child: data == null
                      ? Center(
                          child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Loading. . . .",
                                    style: TextStyle(
                                      color: ColorConstant.red800,
                                    ),
                                  )
                                ],
                              )))
                      : Container(
                          height: 400,
                          width: 300,
                          child: ScrollableTableView(
                            columns: [
                              "Nama Barang",
                              "Jumlah",
                              "Harga",
                            ].map((column) {
                              return TableViewColumn(
                                label: column,
                              );
                            }).toList(),
                            rows: [
                              [
                                data!["first_name"],
                                data!["first_name"],
                                data!["first_name"]
                              ],
                            ].map((record) {
                              return TableViewRow(
                                height: 60,
                                cells: record.map((value) {
                                  return TableViewCell(
                                    child: Text(value),
                                  );
                                }).toList(),
                              );
                            }).toList(),
                          )),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: getVerticalSize(
                      1.00,
                    ),
                    width: size.width,
                    margin: getMargin(
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray800,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      left: 185,
                      top: 0,
                      right: 0,
                    ),
                    child: Container(
                      height: 120,
                      color: Colors.white,
                      alignment: Alignment.bottomLeft,
                      child: Column(children: [
                        Text(''),
                        Container(
                          width: 150,
                          height: 100,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                hintText: 'Jumlah Bayar',
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      left: 35,
                      top: 17,
                      right: 35,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "KEMBALI",
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
                        Padding(
                          padding: getPadding(
                            left: 40,
                          ),
                          child: Text(
                            " Rp. 9.000",
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
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: getVerticalSize(
                      44.00,
                    ),
                    width: size.width,
                    margin: getMargin(
                      top: 12,
                    ),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: getMargin(
                              right: 1,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.bluegray100,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 110,
                                      top: 13,
                                      right: 99,
                                      bottom: 13,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 100,
                          margin: getMargin(
                            left: 0,
                            top: 0,
                            bottom: 3,
                          ),
                          padding: EdgeInsets.only(top: 4),
                          child: MaterialButton(
                              child: Text("Bayar"),
                              minWidth: double.infinity,
                              height: 45.0,
                              color: ColorConstant.redA700A5,
                              textColor: Colors.white70,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(""),
                                      content: Text("Transaksi berhasil !"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DashboardScreen()),
                                                    (route) => false);
                                          },
                                          child: Text("Okay"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

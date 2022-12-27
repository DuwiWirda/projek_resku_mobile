import 'dart:convert';
import 'package:resku3/home.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:resku3/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:resku3/presentation/proses_screen/proses_screen.dart';
import 'package:http/http.dart' as http;
import '../validasi_screen/validasi_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:resku3/core/app_export.dart';
import 'package:resku3/widgets/custom_button.dart';

class ValidasiScreen extends StatefulWidget {
  int? value;
  ValidasiScreen({Key? key, this.value}) : super(key: key);

  @override
  _ValidasiScreenState createState() => _ValidasiScreenState(value);
}

class _ValidasiScreenState extends State<ValidasiScreen> {
  int? value;
  _ValidasiScreenState(this.value);
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

  // Widget _buildListTile() {
  //   return ListTile(
  //     title: Text(
  //       data!["first_name"],
  //     ),
  //     subtitle: Text(data!["email"]),
  //   );
  // }

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
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
                  "Pesanan " + data!["first_name"],
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
                    color: ColorConstant.black900,
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
                                  builder: (context) =>
                                      ProsesScreen(value: data!["id"])),
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
              )
            ],
          ),
        ),
      ),
    ));
  }
}

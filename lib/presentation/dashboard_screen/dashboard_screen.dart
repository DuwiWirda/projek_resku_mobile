import 'dart:convert';
import 'package:resku3/DrawerScreen.dart';
import 'package:resku3/core/app_export.dart';
import 'package:resku3/presentation/login_screen/login_screen.dart';
import 'package:resku3/presentation/validasi_screen/validasi_screen.dart';
import 'package:resku3/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:resku3/presentation/dashboard_screen/detail_dashboard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final String url = "https://reqres.in/api/users?page=1";
  List? data;
  @override
  void initState() {
    _getRefreshDaata();
    super.initState();
  }

  Future<void> _getRefreshDaata() async {
    this.getJsonData(context);
  }

  Future<void> getJsonData(BuildContext context) async {
    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
    });
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pesanan"),
          backgroundColor: ColorConstant.redA700A5,
          centerTitle: true,
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                  textTheme: TextTheme().apply(bodyColor: Colors.white),
                  dividerColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.white)),
              child: PopupMenuButton<int>(
                color: Colors.white,
                itemBuilder: (context) => [
                  // PopupMenuItem<int>(value: 0, child: Text("Setting")),
                  // PopupMenuItem<int>(value: 1, child: Text("Privacy")),
                  // PopupMenuDivider(),
                  PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: ColorConstant.red800Bc,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(color: ColorConstant.red800Bc),
                          )
                        ],
                      )),
                ],
                onSelected: (item) => SelectedItem(context, item),
              ),
            ),
          ],
        ),
        // drawer: const DrawerScreen(),
        body: RefreshIndicator(
          onRefresh: _getRefreshDaata,
          child: data == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: data == null ? 0 : data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Text(data![index]["first_name"]),
                                trailing: Column(
                                  children: <Widget>[
                                    Expanded(
                                        child: MaterialButton(
                                            child: Text(
                                              "CEK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            color: ColorConstant.red800Bc,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            minWidth: 55,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ValidasiScreen(
                                                              value:
                                                                  data![index]
                                                                      ["id"])));
                                            }))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Divider()
                        ],
                      ),
                    );
                  }),
        ));
  }

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      // case 0:
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => LoginScreen()));
      //   break;
      // case 1:
      //   print("Privacy Clicked");
      //   break;
      case 0:
        print("User Logged out");
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Informasi"),
                  content: Text("Apakah anda yakin ingin keluar ?"),
                  actions: [
                    MaterialButton(
                      color: ColorConstant.red800Bc,
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false);
                      },
                      child: Text("YA"),
                      textColor: ColorConstant.whiteA700,
                    ),
                    MaterialButton(
                      color: ColorConstant.red800Bc,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("TIDAK"),
                      textColor: ColorConstant.whiteA700,
                    ),
                  ]);
            });
    }
  }
}

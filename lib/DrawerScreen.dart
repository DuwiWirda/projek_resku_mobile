import 'package:flutter/material.dart';
import 'package:resku3/core/app_export.dart';
import 'package:resku3/main.dart';
import 'package:resku3/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:resku3/presentation/login_screen/login_screen.dart';
import 'package:resku3/presentation/validasi_screen/validasi_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        Container(
            color: ColorConstant.redA700A5,
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.only(top: 20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profil.png'),
                  ),
                ),
              ),
              Text(
                "Duwi Wirda Septania",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Petugas 1",
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 14,
                ),
              )
            ])),
        SizedBox(
          height: 10,
        ),
        DrawerListTile(
            iconData: Icons.logout_sharp,
            title: "Logout",
            onTilePressed: () {
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
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
            })
      ],
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

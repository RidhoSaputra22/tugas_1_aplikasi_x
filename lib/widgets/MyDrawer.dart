import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyLoginPageDesktop.dart';

class MyDrawer extends StatelessWidget {
  final double drawerWidth;

  MyDrawer({super.key, required this.drawerWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * drawerWidth,
      child: Drawer(
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: BeveledRectangleBorder(),
        backgroundColor: MyColors.primaryColor,
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('images/profile.png'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'This User',
                    style: TextStyle(
                      color: MyColors.primaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '@thisuser_',
                    style: TextStyle(
                      color: MyColors.gray,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '1 ',
                            style: TextStyle(
                              color: MyColors.primaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Following',
                            style: TextStyle(
                              color: MyColors.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '0 ',
                            style: TextStyle(
                              color: MyColors.primaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Folowers',
                            style: TextStyle(
                              color: MyColors.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 30,
                          color: MyColors.primaryTextColor,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? AssetImage('images/logo-black.png')
                                  : AssetImage('images/logo-white.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Premium',
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.groups_outlined,
                          size: 30,
                          color: MyColors.primaryTextColor,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Communities',
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.list_alt_outlined,
                          size: 30,
                          color: MyColors.primaryTextColor,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'List',
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.bookmark_outline,
                          size: 30,
                          color: MyColors.primaryTextColor,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Bookmarks',
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.electric_bolt_rounded,
                          size: 30,
                          color: MyColors.primaryTextColor,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Verivied Orgs',
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.monetization_on_outlined,
                          size: 30,
                          color: MyColors.primaryTextColor,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Monetization',
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.ads_click_outlined,
                          size: 30,
                          color: MyColors.primaryTextColor,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Ads',
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.work_outline,
                          size: 30,
                          color: MyColors.primaryTextColor,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Jobs',
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings_outlined,
                          size: 30,
                          color: MyColors.primaryTextColor,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Setting and Privacy',
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyLoginPageDesktop()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          size: 30,
                          color: MyColors.primaryTextColor,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Log out',
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyBottomNavigatorBar.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyDrawer.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyFloatingActionButton.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyPost.dart';

class DesktopLayouts extends StatefulWidget {
  const DesktopLayouts({super.key});

  @override
  State<DesktopLayouts> createState() => _DesktopLayoutsState();
}

class _DesktopLayoutsState extends State<DesktopLayouts>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 150),
        child: Row(
          children: [
            MyDrawer(
              drawerWidth: 0.25,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    iconTheme:
                        const IconThemeData(color: MyColors.primaryTextColor),
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      child: Builder(builder: (context) {
                        return InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: CircleAvatar(
                            radius: 1,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('images/profile.png'),
                          ),
                        );
                      }),
                    ),
                    title: Center(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                Theme.of(context).brightness == Brightness.light
                                    ? AssetImage('images/logo-black.png')
                                    : AssetImage('images/logo-white.png'),
                          ),
                        ),
                      ),
                    ),
                    bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(50),
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: MyColors.primaryTextColor,
                          controller: tabController,
                          indicatorColor: MyColors.primaryTextColor,
                          unselectedLabelColor: MyColors.gray,
                          tabs: [
                            Tab(
                              child: Text(
                                "For You",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Following",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              ),
                            ),
                          ],
                        )),
                    floating: true,
                    backgroundColor: MyColors.primaryColor,
                    expandedHeight: 150,
                    actions: [
                      Text("Upgrade",
                          style: TextStyle(
                            color: MyColors.primaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          )),
                      IconButton(
                        icon: const Icon(
                          Icons.more_vert_sharp,
                          color: MyColors.primaryTextColor,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SliverFillRemaining(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: const [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              MyPost(),
                              MyPost(),
                              MyPost(),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              MyPost(),
                              MyPost(),
                              MyPost(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 30),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      border: Border.all(
                        color: MyColors.gray,
                        width: 0.2,
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(color: MyColors.primaryTextColor),
                      cursorColor: MyColors.primaryTextColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: MyColors.primaryTextColor,
                        ),
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: MyColors.primaryTextColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              border: Border.all(
                                color: MyColors.gray,
                                width: 0.2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Subscribe to Premium",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                  "Subscribe to unlock new features and if eligible, receive a share of revenue.",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),
                                      color: MyColors.secondaryColor,
                                    ),
                                    child: Text(
                                      "Subscribe",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: MyColors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              border: Border.all(
                                color: MyColors.gray,
                                width: 0.2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "What's happening",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: MyColors.gray,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                text: "Music • Trending"),
                                          ),
                                          Text(
                                            "#HOS_TOUR_JAKARTA_D2_TEST_TEST",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "65.2K post",
                                            style: TextStyle(
                                                color: MyColors.gray,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.more_horiz,
                                        color: MyColors.gray,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: MyColors.gray,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                text: "Trending in Indonesia"),
                                          ),
                                          Text(
                                            "Senin",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "100K post",
                                            style: TextStyle(
                                                color: MyColors.gray,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.more_horiz,
                                        color: MyColors.gray,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: MyColors.gray,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                text:
                                                    "Entertainment • Trending"),
                                          ),
                                          Text(
                                            "#zonauang",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.more_horiz,
                                        color: MyColors.gray,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: MyColors.gray,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                text: "Trending in Indonesia"),
                                          ),
                                          Text(
                                            "Mayday",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "112K post",
                                            style: TextStyle(
                                                color: MyColors.gray,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.more_horiz,
                                        color: MyColors.gray,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Show more",
                                  style:
                                      TextStyle(color: MyColors.secondaryColor),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              border: Border.all(
                                color: MyColors.gray,
                                width: 0.2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Who to follow",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage('images/profile.png'),
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Those user",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(
                                                Icons.verified,
                                                size: 20,
                                                color: MyColors.secondaryColor,
                                              )
                                            ],
                                          ),
                                          Text(
                                            "@thoseuser_",
                                            style:
                                                TextStyle(color: MyColors.gray),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: MyColors.black,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                            color: MyColors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage('images/profile.png'),
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Those user",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(
                                                Icons.verified,
                                                size: 20,
                                                color: MyColors.secondaryColor,
                                              )
                                            ],
                                          ),
                                          Text(
                                            "@thoseuser_",
                                            style:
                                                TextStyle(color: MyColors.gray),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: MyColors.black,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                            color: MyColors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage('images/profile.png'),
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Those user",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(
                                                Icons.verified,
                                                size: 20,
                                                color: MyColors.secondaryColor,
                                              )
                                            ],
                                          ),
                                          Text(
                                            "@thoseuser_",
                                            style:
                                                TextStyle(color: MyColors.gray),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: MyColors.black,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                            color: MyColors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage('images/profile.png'),
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Those user",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(
                                                Icons.verified,
                                                size: 20,
                                                color: MyColors.secondaryColor,
                                              )
                                            ],
                                          ),
                                          Text(
                                            "@thoseuser_",
                                            style:
                                                TextStyle(color: MyColors.gray),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: MyColors.black,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                            color: MyColors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Show more",
                                  style:
                                      TextStyle(color: MyColors.secondaryColor),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MyFloatigActionButton(),
    );
  }
}

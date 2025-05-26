import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyBottomNavigatorBar.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyDrawer.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyFloatingActionButton.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyPost.dart';

class MobileLayouts extends StatefulWidget {
  const MobileLayouts({super.key});

  @override
  State<MobileLayouts> createState() => _MobileLayoutsState();
}

class _MobileLayoutsState extends State<MobileLayouts>
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
        drawer: MyDrawer(
          drawerWidth: 0.9,
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: const IconThemeData(color: MyColors.primaryTextColor),
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
                      backgroundImage: NetworkImage(
                          'http://localhost:3000/user/profile.png'),
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
                      image: Theme.of(context).brightness == Brightness.light
                          ? NetworkImage('images/logo-black.png')
                          : NetworkImage('images/logo-white.png'),
                    ),
                  ),
                ),
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(20),
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
              expandedHeight: 100,
              actions: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                  decoration: BoxDecoration(),
                  child: Text(
                    "Tingkatkan",
                    style: TextStyle(
                      color: MyColors.primaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            SliverFillRemaining(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        MyPost(
                          image: "http://localhost:3000/feed/1.png",
                          profileImage: "http://localhost:3000/user/ok1.jpg",
                        ),
                        MyPost(
                          image: "http://localhost:3000/feed/2.png",
                          profileImage: "http://localhost:3000/user/ok2.jpg",
                        ),
                        MyPost(
                          image: "http://localhost:3000/feed/3.png",
                          profileImage: "http://localhost:3000/user/p1.jpg",
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        MyPost(
                          image: "http://localhost:3000/feed/1.png",
                          profileImage: "http://localhost:3000/user/ok1.jpg",
                        ),
                        MyPost(
                          image: "http://localhost:3000/feed/2.png",
                          profileImage: "http://localhost:3000/user/ok2.jpg",
                        ),
                        MyPost(
                          image: "http://localhost:3000/feed/3.png",
                          profileImage: "http://localhost:3000/user/p1.jpg",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: MyFloatigActionButton(),
        bottomNavigationBar: MyBottomNavigatorBar());
  }
}

import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';
import 'package:tugas_1_aplikasi_x/models/Post.dart';
import 'package:tugas_1_aplikasi_x/models/User.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyAddPost.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyBottomNavigatorBar.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyDrawer.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyFloatingActionButton.dart';
import 'package:tugas_1_aplikasi_x/widgets/MyPost.dart';

class MobileLayouts extends StatefulWidget {
  final User user;
  const MobileLayouts({super.key, required this.user});

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
                      print(widget.user.avatar);
                      Scaffold.of(context).openDrawer();
                    },
                    child: CircleAvatar(
                      radius: 1,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(widget.user.avatar!),
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
                  FutureBuilder<List<Post>>(
                    future: Post.fetchPosts(),
                    builder: (context, snapshot) {
                      print(snapshot);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }

                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Container(
                          child: MyPost(post: snapshot.data![index]),
                        ),
                      );
                    },
                  ),
                  FutureBuilder<List<Post>>(
                    future: Post.fetchPosts(),
                    builder: (context, snapshot) {
                      print(snapshot);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }

                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Container(
                          child: MyPost(post: snapshot.data![index]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: MyFloatigActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height,
                      child: MyAddPost(
                        user: widget.user,
                      ));
                });
          },
        ),
        bottomNavigationBar: MyBottomNavigatorBar());
  }
}

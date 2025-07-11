// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';
import 'package:tugas_1_aplikasi_x/models/Post.dart';
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

  double postFormHeight = 100;

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
                            image:
                                Theme.of(context).brightness == Brightness.light
                                    ? NetworkImage('images/logo-black.png')
                                    : NetworkImage('images/logo-white.png'),
                          ),
                        ),
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(150),
                      child: Column(
                        children: [
                          Container(
                            height: postFormHeight,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Profile Image
                                    const CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                          'https://i.pravatar.cc/150?img=3'), // Use user's photo
                                    ),
                                    const SizedBox(width: 12),
                                    // Text Field
                                    Expanded(
                                      child: TextField(
                                        maxLines: null,
                                        decoration: InputDecoration(
                                          hintText: "What's happening?",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                        icon: const Icon(Icons.image_outlined),
                                        onPressed: () {}),
                                    IconButton(
                                        icon:
                                            const Icon(Icons.gif_box_outlined),
                                        onPressed: () {}),
                                    IconButton(
                                        icon: const Icon(Icons.poll_outlined),
                                        onPressed: () {}),
                                    IconButton(
                                        icon: const Icon(
                                            Icons.emoji_emotions_outlined),
                                        onPressed: () {}),
                                    IconButton(
                                        icon:
                                            const Icon(Icons.schedule_outlined),
                                        onPressed: () {}),
                                    IconButton(
                                        icon: const Icon(
                                            Icons.location_on_outlined),
                                        onPressed: () {}),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed:
                                          () {}, // Enable when user types something
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey[700],
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      child: const Text("Post"),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          // Spacer(),
                          TabBar(
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Following",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    floating: true,
                    backgroundColor: MyColors.primaryColor,
                    expandedHeight: 100,
                    actions: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 16),
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
                      children: [
                        FutureBuilder<List<Post>>(
                          future: Post.fetchPosts(),
                          builder: (context, snapshot) {
                            print(snapshot);
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
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
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
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
                                            "#HOS_TOUR_JAKARTA_D2",
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
                                        backgroundImage: NetworkImage(
                                            'http://localhost:3000/user/p2.jpg'),
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
                                        backgroundImage: NetworkImage(
                                            'http://localhost:3000/user/p1.jpg'),
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
                                        backgroundImage: NetworkImage(
                                            'http://localhost:3000/user/ok2.jpg'),
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
                                        backgroundImage: NetworkImage(
                                            'http://localhost:3000/user/cc.png'),
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

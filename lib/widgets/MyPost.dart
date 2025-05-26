import 'package:flutter/material.dart';
import 'package:tugas_1_aplikasi_x/models/MyColors.dart';

class MyPost extends StatelessWidget {
  final String image;
  final String profileImage;
  MyPost({super.key, required this.image, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MyColors.gray,
            width: 0.2,
          ),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 10, bottom: 15),
              child: Row(
                children: [
                  Icon(Icons.recycling, color: MyColors.gray),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "SOME USER Reposted",
                    style: TextStyle(
                      color: MyColors.gray,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(profileImage),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: "This User ",
                                style: TextStyle(
                                  color: MyColors.primaryTextColor,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(
                                text: "@thisuser_ ",
                                style: TextStyle(
                                  color: MyColors.gray,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(
                                text: "• 1d ",
                                style: TextStyle(
                                  color: MyColors.gray,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.golf_course,
                          color: MyColors.gray,
                          size: 20,
                        ),
                        // Spacer(),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.more_vert,
                          color: MyColors.gray,
                          size: 20,
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Replying to ",
                          style: TextStyle(
                            color: MyColors.gray,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: "@someuser_ ",
                          style: TextStyle(
                            color: MyColors.secondaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ]),
                    ),
                    Text(
                      "This User Message",
                      style: TextStyle(
                          color: MyColors.primaryTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w100),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        child: Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.chat_outlined,
                              color: MyColors.gray,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("12K",
                                style: TextStyle(
                                    color: MyColors.gray, fontSize: 15))
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.recycling_outlined,
                              color: MyColors.gray,
                              weight: 0.5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("12K",
                                style: TextStyle(
                                    color: MyColors.gray, fontSize: 15))
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.favorite_outline,
                              color: MyColors.gray,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("12K",
                                style: TextStyle(
                                    color: MyColors.gray, fontSize: 15))
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.insert_chart_outlined,
                              color: MyColors.gray,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("12K",
                                style: TextStyle(
                                    color: MyColors.gray, fontSize: 15))
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.share_outlined,
                              color: MyColors.gray,
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

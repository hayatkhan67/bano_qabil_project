// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../data/fb_data.dart';
import '../../widget/customText.dart';
import '../../widget/custom_Divider.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_post.dart';
import 'friend_list.dart';
import 'friends_profile.dart';

// ignore: must_be_immutable
class UserProfile extends StatefulWidget {
  UserProfile({super.key, required this.isBack});
  bool isBack = false;
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var data = fbData;

  var currentIndex = 0;
  List name = [
    'Posts',
    'Reels',
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async {
          return widget.isBack;
        },
        child: Scaffold(
          appBar: CustomAppBar(
            elevation: 0,
            barHeigth: 45,
            leading: widget.isBack == true
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  )
                : const SizedBox(),
            actions: const [
              SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.edit, color: Colors.black),
                    Icon(Icons.search, color: Colors.black),
                  ],
                ),
              )
            ],
            title: MyText(
              text: data[0].userName,
              size: 18.0,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(clipBehavior: Clip.none, children: [
                  Container(
                    height: w > 600
                        ? MediaQuery.of(context).size.height * 0.60
                        : 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        image: DecorationImage(
                            image: AssetImage(data[0].userBanner.toString()),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    bottom: -30,
                    left: 8,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 57,
                        backgroundImage:
                            AssetImage(data[0].profileImage.toString()),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: -15,
                    left: 100,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 14,
                      ),
                    ),
                  ),
                ]),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 35, bottom: 10, left: 20, right: 20),
                      child: Row(
                        children: [
                          MyText(
                              text: data[0].userName,
                              size: 20.0,
                              fWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: MyText(
                                          text: 'Add to story',
                                          maxline: 1,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: MyText(
                                          text: 'Edit profile',
                                          maxline: 1,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                            ))
                      ],
                    )
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const MyDivider(),
                      SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: name.length,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {});
                                          currentIndex = index;
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.17,
                                          decoration: BoxDecoration(
                                            color: currentIndex != index
                                                ? Colors.grey.shade200
                                                : Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: MyText(
                                              text: name[index],
                                              color: currentIndex != index
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                      ),
                      const MyDivider(
                        indent: 14.0,
                        endIndent: 14.0,
                        thick: 3.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              text: 'Details',
                              size: 18,
                              fWeight: FontWeight.bold,
                            ),
                            ...List.generate(
                                idDetailIcon.length,
                                (index) => ListTile(
                                      leading: Icon(idDetailIcon[index],
                                          size: 20
                                          // MediaQuery.of(context).size.height *
                                          //     0.03,
                                          ),
                                      title: MyText(
                                          text: idDetailInfo[index], size: 16
                                          // MediaQuery.of(context).size.height *
                                          //     0.02,
                                          ),
                                    )),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(double.maxFinite, 40),
                                    backgroundColor: Colors.blue.shade400,
                                    elevation: 3),
                                child: const MyText(
                                  text: 'Edit public details',
                                  color: Colors.white,
                                  fWeight: FontWeight.bold,
                                )),
                            const MyDivider(
                              thick: 3.0,
                              indent: 14.0,
                              endIndent: 14.0,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: const MyText(
                                        text: "Friends",
                                        fWeight: FontWeight.bold,
                                        size: 15.0,
                                      ),
                                      subtitle: MyText(
                                          text:
                                              '${data[0].friendsNames!.length} friends'),
                                    ),
                                  ),
                                  const Expanded(
                                    child: ListTile(
                                      trailing: MyText(
                                        text: 'Find Friends',
                                        color: Colors.blue,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 05,
                                      mainAxisSpacing: 10,
                                      mainAxisExtent: w < 600
                                          ? MediaQuery.of(context).size.height *
                                              0.26
                                          : MediaQuery.of(context).size.height *
                                              0.45),
                              shrinkWrap: true,
                              itemCount: 6,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FriendProfile(
                                            image:
                                                data[0].friendsImages![index],
                                            userName:
                                                data[0].friendsNames![index]),
                                      ));
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(data[0]
                                                  .friendsImages![index]
                                                  .toString()),
                                              fit: BoxFit.fill),
                                          color: Colors.blue,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10))),
                                    )),
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.070,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                        child: Center(
                                            child: MyText(
                                          text: data[0]
                                              .friendsNames![index]
                                              .toString(),
                                          fWeight: FontWeight.bold,
                                        )))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FriendList(
                                            data: FriendlistData(image: [
                                          data[0].friendsImages!
                                        ], userName: [
                                          data[0].friendsNames!
                                        ])),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade200,
                                  fixedSize: const Size(double.maxFinite, 40),
                                ),
                                child: const MyText(
                                  text: 'See all friends',
                                  fWeight: FontWeight.bold,
                                )),
                            const MyDivider(
                              indent: 14.0,
                              endIndent: 14.0,
                              thick: 3.0,
                            ),
                            //Your Post
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    text: 'Your posts',
                                    fWeight: FontWeight.bold,
                                    size: 20.0,
                                  ),
                                  MyText(
                                    text: "Filters",
                                    color: Color.fromARGB(255, 16, 113, 192),
                                    size: 18.0,
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(data[0].profileImage.toString()),
                              ),
                              title:
                                  const MyText(text: 'What\'s on your mind?'),
                              trailing: const Icon(
                                Icons.photo,
                                color: Colors.green,
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: double.infinity,
                              color: Colors.grey.shade200,
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(110, 30),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.video_collection_rounded,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        MyText(text: 'Reels')
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(110, 30),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.ondemand_video_rounded,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        MyText(text: 'Live')
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(double.maxFinite, 40),
                                    backgroundColor: Colors.grey.shade200,
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.manage_accounts_outlined,
                                        color: Colors.black,
                                      ),
                                      MyText(
                                        text: 'Manage Post',
                                      ),
                                    ],
                                  )),
                            ),
                            const MyDivider(),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(120, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Colors.grey.shade200,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.photo,
                                    color: Colors.black,
                                  ),
                                  MyText(
                                    text: 'Photos',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data[0].post![0].userPosts!.length,
                        itemBuilder: (context, index) => CustomPostContainer(
                            profileImage: data[0].profileImage,
                            userName: data[0].userName,
                            postImage: data[0].post![0].userPosts![index],
                            postText: data[0].post![0].userPostsText![index]),
                      )
                    ]),
              ],
            ),
          ),
        ));
  }
}

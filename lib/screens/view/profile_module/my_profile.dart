import 'package:bano_qabil_project/utils/data/fb_data.dart';
import 'package:bano_qabil_project/widgets/custom_Divider.dart';
import 'package:bano_qabil_project/widgets/custom_ElevatedButton.dart';
import 'package:flutter/material.dart';

import '../../../widgets/customText.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_post.dart';
import '../../../widgets/navigator_widget.dart';
import 'friend_list.dart';
import 'myfriend_profile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key, required this.isBack});

  final bool? isBack;

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var data = fbData;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        barHeigth: 45,
        centerTitle: true,
        leading: widget.isBack == true
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios))
            : const SizedBox(),
        title: MyText(text: data[0].userName),
        actions: const [
          Icon(Icons.edit_outlined),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: isDesktop ? h * 0.60 : 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(data[0].userBanner.toString()),
                      fit: BoxFit.cover)),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 5,
                    bottom: -40,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 57,
                        backgroundImage:
                            AssetImage(data[0].profileImage.toString()),
                        onBackgroundImageError: (exception, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    bottom: -22,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey[200],
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                MyText(
                  text: data[0].userName,
                  fWeight: FontWeight.bold,
                  size: 18,
                ),
              ],
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
            ),
            const MyDivider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 197, 225, 238),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: MyText(
                              text: 'Post',
                              color: Colors.blue[800],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const MyText(
                          text: 'Reels',
                          fWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const MyDivider(
                    thick: 2,
                  ),
                  const MyText(
                    text: 'Details',
                    fWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...List.generate(
                      idDetailIcon.length,
                      (index) => Row(
                            children: [
                              Icon(
                                idDetailIcon[index],
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: idDetailInfo[index],
                                size: 17,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          )),
                  CustomElevatedButton(
                    onPressed: () {},
                    color: const Color.fromARGB(255, 129, 195, 250),
                    child: const MyText(
                        text: 'Edit public details', color: Colors.white),
                  ),
                  const MyDivider(
                    thick: 1,
                  ),
                  const ListTile(
                    title: MyText(
                      text: 'Friends',
                      fWeight: FontWeight.bold,
                      size: 17,
                    ),
                    subtitle: MyText(text: '10'),
                    trailing: MyText(
                      text: 'Find Friends',
                      color: Color.fromARGB(255, 129, 195, 250),
                    ),
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 05,
                        mainAxisSpacing: 10,
                        mainAxisExtent: isDesktop
                            ? MediaQuery.of(context).size.height * 0.45
                            : MediaQuery.of(context).size.height * 0.26),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          myNavigator(
                            context,
                            MyFriend(
                                friendData: FriendData(
                                    image: data[0].friendsImages![index],
                                    name: data[0].friendsNames![index])),
                          );
                        },
                        child: Column(
                          children: [
                            Expanded(
                                child: Hero(
                              tag: data[0].friendsImages![index],
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            data[0].friendsImages![index]),
                                        fit: BoxFit.fill),
                                    color: Colors.grey[200],
                                    border: Border.all(color: Colors.black),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                              ),
                            )),
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                  child: MyText(
                                text: data[0].friendsNames![index],
                                align: TextAlign.center,
                              )),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FriendList(
                                  userName: data[0].userName.toString(),
                                  data: FriendlistData(
                                      image: data[0].friendsImages,
                                      userName: data[0].friendsNames)),
                            ));
                      },
                      sizeHeight: 30,
                      color: Colors.grey[200],
                      child: const MyText(text: 'See all friends'),
                    ),
                  ),
                  const MyDivider(
                    thick: 1,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: 'Your posts',
                        fWeight: FontWeight.bold,
                        size: 16,
                      ),
                      MyText(
                        text: 'Filters',
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(data[0].profileImage.toString()),
              ),
              title: const MyText(
                text: 'What\'s on your mind?',
                maxline: 1,
              ),
              trailing: const Icon(
                Icons.photo,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 40,
                width: double.infinity,
                color: Colors.grey[50],
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Row(
                        children: [
                          Icon(
                            Icons.video_collection_rounded,
                            size: 17,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(
                            text: 'Reel',
                            color: Colors.black,
                          )
                        ],
                      )),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Row(
                        children: [
                          Icon(
                            Icons.ondemand_video_rounded,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(
                            text: 'Live',
                            color: Colors.black,
                          )
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: CustomElevatedButton(
                onPressed: () {},
                sizeHeight: 30,
                color: Colors.grey[300],
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
                ),
              ),
            ),
            const MyDivider(),
            Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    children: [
                      Icon(Icons.photo),
                      MyText(
                        text: 'Photos',
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    children: [
                      Icon(Icons.music_note),
                      MyText(
                        text: 'Music',
                      )
                    ],
                  ),
                )
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data[0].post![0].userPosts!.length,
              itemBuilder: (context, index) => CustomPostContainer(
                userName: data[0].userName,
                profileImage: data[0].profileImage,
                postImage: data[0].post![0].userPosts![index],
                postText: data[0].post![0].userPostsText![index],
              ),
            )
          ],
        ),
      ),
    );
  }
}

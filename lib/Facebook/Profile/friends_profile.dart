import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/fb_data.dart';
import '../../widget/customText.dart';
import '../../widget/custom_Divider.dart';
import '../../widget/custom_ElevatedButton.dart';
import '../../widget/custom_post.dart';
import 'friend_list.dart';

class FriendProfile extends StatefulWidget {
  const FriendProfile({super.key, this.userName, this.image, this.post});
  final String? userName;
  final String? image;
  final String? post;

  @override
  State<FriendProfile> createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  var data = fbData;
  List detailsIcon = [
    Icons.home,
    Icons.location_on_sharp,
    FontAwesomeIcons.heart,
    Icons.more_horiz_outlined
  ];
  List detailsText = [
    'Lives in Karachi,Pakistan',
    'from Karachi',
    'Single',
    'See Your About Info'
  ];
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: MyText(text: widget.userName),
          centerTitle: true,
          actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: w > 600
                        ? MediaQuery.of(context).size.height * 0.60
                        : w > 1200
                            ? MediaQuery.of(context).size.height * 0.70
                            : 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(data[0].post![0].friendPost![2]),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    bottom: -75,
                    left: 10,
                    child: CircleAvatar(
                      minRadius: 40,
                      maxRadius: 75,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        minRadius: 30,
                        maxRadius: 72,
                        backgroundImage: AssetImage(widget.image.toString()),
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 90,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: MyText(
                  text: widget.userName,
                  size: 19,
                  fWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
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
                              Icons.person_add_alt_1,
                              color: Colors.black,
                            ),
                            Expanded(
                              child: Center(
                                child: MyText(
                                    text: 'Friend',
                                    maxline: 2,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black),
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
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.facebookMessenger,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Center(
                                child: MyText(
                                    text: 'Message',
                                    maxline: 2,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white),
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
              ...List.generate(
                  detailsIcon.length,
                  (index) => ListTile(
                        leading: Icon(
                          detailsIcon[index],
                          size: 20,
                        ),
                        title: MyText(
                          text: detailsText[index],
                          size: 16,
                        ),
                      )),
              const MyDivider(
                thick: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        text: 'Friends',
                        size: 18,
                      ),
                      const MyText(text: '6 mutual friends'),
                      const SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            mainAxisExtent:
                                MediaQuery.of(context).size.height * 0.26),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FriendProfile(
                                      image: data[0].friendsImages![index],
                                      userName: data[0].friendsNames![index],
                                    ),
                                  ));
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        image: DecorationImage(
                                            image: AssetImage(data[0]
                                                .friendsImages![index]
                                                .toString()),
                                            fit: BoxFit.fill),
                                        border: Border.all(color: Colors.black),
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10))),
                                  ),
                                ),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10))),
                                    child: Center(
                                        child: MyText(
                                      text: data[0]
                                          .friendsNames![index]
                                          .toString(),
                                      fWeight: FontWeight.bold,
                                    )))
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FriendList(
                                  userName: widget.userName,
                                ),
                              ));
                        },
                        color: Colors.grey.shade200,
                        child: const Center(
                            child: MyText(text: 'See all friends')),
                      )
                    ]),
              ),
              const MyDivider(
                thick: 1,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: MyText(
                  text: 'Posts',
                  size: 19,
                  fWeight: FontWeight.w600,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(widget.image.toString()),
                ),
                title: MyText(text: 'Write something to ${widget.userName}...'),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {},
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black12)),
                      color: Colors.white,
                      elevation: 0,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.penToSquare,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(text: 'Write Post')
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {},
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black12)),
                      color: Colors.white,
                      elevation: 0,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(text: 'Share Photo')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const MyDivider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomElevatedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  sizeWidth: 130,
                  color: Colors.grey.shade200,
                  elevation: 0,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MyText(text: 'Photos')
                    ],
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data[0].post![0].friendPost!.length,
                itemBuilder: (context, index) => CustomPostContainer(
                  userName: widget.userName,
                  profileImage: widget.image,
                  postImage: data[0].post![0].friendPost![index],
                ),
              )
            ],
          ),
        ));
  }
}

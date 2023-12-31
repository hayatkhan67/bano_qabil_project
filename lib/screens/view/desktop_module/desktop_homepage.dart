import 'package:bano_qabil_project/screens/view/profile_module/my_profile.dart';
import 'package:bano_qabil_project/utils/data/images.dart';
import 'package:bano_qabil_project/widgets/circle_icon.dart';
import 'package:bano_qabil_project/widgets/customText.dart';
import 'package:bano_qabil_project/widgets/custom_Divider.dart';
import 'package:bano_qabil_project/widgets/custom_appbar.dart';
import 'package:bano_qabil_project/widgets/navigator_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../menu_module/menu_page.dart';
import '../watch_videos_module/chewievideo.dart';
import '../../../services/api/shopHome.dart';
import '../Chats/chats.dart';
import '../notification_module/notifications.dart';
import '../home/user_newsfeed.dart';
import '../home/create_story.dart';
import '../home/music.dart';
import '../../../utils/data/fb_data.dart';
import 'column1.dart';
import 'column3.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenmd = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
          appBar: CustomAppBar(
            color: Colors.white,
            leadingWidth: 280,
            barHeigth: 60,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    MdiIcons.facebook,
                    color: Colors.blue,
                    size: 46,
                  ),
                  SizedBox(
                    height: 35,
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.all(11),
                          fillColor: const Color(0xfff0f2f5),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  )
                ],
              ),
            ),
            title: const SizedBox(
              width: 400,
              child: Row(
                children: [
                  Expanded(
                    child: TabBar(indicatorColor: Colors.amber, tabs: [
                      Tab(
                          icon: Icon(
                        Icons.home_outlined,
                        color: Colors.black,
                      )),
                      Tab(
                        icon:
                            Icon(Icons.person_2_outlined, color: Colors.black),
                      ),
                      Tab(
                        icon: Icon(Icons.notifications_outlined,
                            color: Colors.black),
                      ),
                      Tab(
                        icon: Icon(Icons.shopping_cart_outlined,
                            color: Colors.black),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            actions: [
              CircleIcon(
                icon: Icons.settings,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Menu(),
                      ));
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleIcon(
                    icon: MdiIcons.facebookMessenger,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Chats(),
                          ));
                    }),
              ),
              CircleIcon(
                icon: Icons.personal_video_outlined,
                onPressed: () {
                  myNavigator(context, const Videos());
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleIcon(
                  image: AssetImage(hayat),
                ),
              )
            ],
          ),
          body: Container(
            color: const Color(0xfff0f2f5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Column1(),
                  Expanded(
                      flex: 2,
                      child: TabBarView(children: [
                        home(context, screenmd),
                        const MyProfile(isBack: false),
                        const Notifications(),
                        const MyHomePage(
                          isBack: false,
                        )
                      ])),
                  const Column3()
                ],
              ),
            ),
          )),
    );
  }

  Widget home(BuildContext context, Size screenmd) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: screenmd.height * 0.3,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const Music(),
                  const SizedBox(width: 3),
                  const CreateStory(),
                  const SizedBox(width: 3),
                  ...List.generate(
                    fbData[0].friendsImages!.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Container(
                        width: screenmd.width < 800
                            ? MediaQuery.of(context).size.width * 0.3
                            : MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image:
                                      CachedNetworkImageProvider(story[index]),
                                  fit: BoxFit.fill)),
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 0.09,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: CircleAvatar(
                                      radius: 19,
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundImage: AssetImage(
                                            fbData[0].friendsImages![index]),
                                      ),
                                    ),
                                  )),
                              Positioned(
                                bottom: 8.0,
                                left: 8.0,
                                right: 8.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: MyText(
                                    text: fbData[0].friendsNames![index],
                                    align: TextAlign.center,
                                    size: 10,
                                    fWeight: FontWeight.bold,
                                    color: Colors.white,
                                    maxline: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          card(),
          const UserNewsFeed()
        ],
      ),
    );
  }

  Card card() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(hayat),
                  radius: 18,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)),
                    child:
                        const MyText(text: 'What\'s on your mind,Hayat Khan'),
                  ),
                )
              ],
            ),
            const MyDivider(
              thick: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.video_call_sharp,
                      color: Colors.red,
                    ),
                    label: const MyText(text: 'Live Video')),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo,
                      color: Colors.green,
                    ),
                    label: const MyText(text: ' Photo/video')),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.face,
                      color: Colors.yellow,
                    ),
                    label: const MyText(text: 'Feeling/activity'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

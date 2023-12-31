import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../widgets/circle_icon.dart';
import '../../../widgets/customText.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_listtile.dart';
import '../../../widgets/navigator_widget.dart';
import 'chat_model_class.dart';
import 'chats_home.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final data = chatDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const MyText(text: 'Chat'),
        centerTitle: true,
        actions: [
          CircleIcon(circle: false, icon: MdiIcons.cog),
          CircleIcon(
            circle: false,
            icon: MdiIcons.squareEditOutline,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 3)),
                      hintText: 'Search',
                      contentPadding: const EdgeInsets.all(12)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height * 0.18,
              // height: 150,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              myNavigator(
                                context,
                                ChatHomePage(
                                    chatData: ChatData(
                                        userName: data[index].userName,
                                        image: data[index].userImage,
                                        message: data[index].message)),
                              );
                            },
                            child: Container(
                                constraints: const BoxConstraints(
                                  minHeight: 60,
                                  minWidth: 60,
                                  maxHeight: 80,
                                  maxWidth: 80,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          data[index].userImage.toString()),
                                      fit: BoxFit.fill),
                                ),
                                child: Stack(
                                  textDirection: TextDirection.rtl,
                                  fit: StackFit.loose,
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Positioned(
                                      bottom: 0.0,
                                      right: 3.0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 8,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.green,
                                          radius: 6,
                                        ),
                                      ),
                                    ),
                                    // SizedBox(height: 5),
                                    Positioned(
                                      bottom: -20,
                                      right: 8.0,
                                      left: 8.0,
                                      child: FittedBox(
                                        child: MyText(
                                          text: data[index].userName!,
                                          maxline: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return MyListTile(
                  leadingWidth: 15,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatHomePage(
                              chatData: ChatData(
                                  userName: data[index].userName,
                                  image: data[index].userImage,
                                  message: data[index].message)),
                        ));
                  },
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage(data[index].userImage.toString()),
                    radius: 36,
                    onBackgroundImageError: (exception, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                  title: MyText(text: data[index].userName),
                  subtitle: MyText(text: data[index].message),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

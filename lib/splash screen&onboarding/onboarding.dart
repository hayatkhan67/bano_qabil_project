import 'package:bano_qabil_project/widget/customText.dart';
import 'package:bano_qabil_project/widget/custom_ElevatedButton.dart';
import 'package:flutter/material.dart';

import '../Login_page/login_page.dart';
import '../model class/onboarding_modelclass.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var currentPage = 0;

  //page controller
  PageController myPage = PageController();

  //added model class list for details
  var data = onboardingDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 10,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                controller: myPage,
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(19.0),
                          child: MyText(
                            text: data[index].title.toString(),
                            fontFamily: "Montserrat",
                            fWeight: FontWeight.bold,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Image(
                        image: AssetImage(data[index].image.toString()),
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyText(
                        text: data[index].detail.toString(),
                        size: 20.0,
                        align: TextAlign.center,
                        fWeight: FontWeight.w400,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: currentPage != index ? 10 : 20,
                      width: currentPage != index ? 10 : 20,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 147, 196, 237),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: CustomElevatedButton(
                onPressed: () {
                  myPage.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                  if (currentPage == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  } else {
                    null;
                  }
                },
                sizeHeight: 50.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 0.0,
                color: Colors.blueAccent,
                child: MyText(
                  fontFamily: "Montserrat",
                  text: currentPage == 2 ? 'Continue' : 'Next',
                  // text: 'Next $currentPage',
                  size: 16.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

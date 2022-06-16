import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared_constants/widgets.dart';
import 'home/home.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: PageView(
            controller: controller,
            onPageChanged: (index) => setState(() {
              isLastPage = index == 3;
            }),
            children: const [
              ContentTile(
                  title: "Schedule Tasks",
                  image: "assets/images/onboard1.png",
                  subtitle:
                      "Easily schedule tasks and to-dos\nranging from everyday activities to\noccassional events."),
              ContentTile(
                title: "Set Reminders",
                image: "assets/images/onboard4.png",
                subtitle:
                    "Never forget by setting reminders for\nthe things you want to do when you\nwant to do them.",
              ),
              ContentTile(
                  title: "Create a Bucket List",
                  image: "assets/images/onboard3.png",
                  subtitle:
                      "Create your own personalized bucket\nlist and strike out long term goals as\nyou go."),
              ContentTile(
                  title: "Plan with others",
                  image: "assets/images/onboard2.png",
                  subtitle:
                      "To plan is to succeed. Organize tasks\nand plan activities with your friends\nand colleagues!"),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff454893),
                  child: MaterialButton(
                    minWidth: 200,
                    height: 60,
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return const HomeScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 120,
                child: Column(
                  children: [
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 4,
                        effect: CustomizableEffect(
                          activeDotDecoration: const DotDecoration(
                            width: 30,
                            height: 3,
                            color: Color(0xff454893),
                          ),
                          dotDecoration: DotDecoration(
                            width: 10,
                            height: 10,
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                controller.jumpTo(3);
                              },
                              child: const Text("Skip",
                                  style: TextStyle(
                                      color: Color(0xff454893),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700))),
                          TextButton(
                              onPressed: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              },
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                    color: Color(0xff454893),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              )),
                        ]),
                  ],
                ),
              ));
  }
}

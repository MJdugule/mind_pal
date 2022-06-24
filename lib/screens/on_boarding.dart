import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind_pal/screens/authentication/login_screen.dart';
import 'package:mind_pal/shared_constants/res_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    ResConfig().init(context);

    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: ResConfig.screenHeight / 50),
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
                      "Easily schedule tasks and to-dos ranging from everyday activities to occassional events."),
              ContentTile(
                title: "Set Reminders",
                image: "assets/images/onboard4.png",
                subtitle:
                    "Never forget by setting reminders for the things you want to do when you want to do them.",
              ),
              ContentTile(
                  title: "Create a Bucket List",
                  image: "assets/images/onboard3.png",
                  subtitle:
                      "Create your own personalized bucket list and strike out long term goals as you go."),
              ContentTile(
                  title: "Plan with others",
                  image: "assets/images/onboard2.png",
                  subtitle:
                      "To plan is to succeed. Organize tasks and plan activities with your friends and colleagues!"),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 60,
                      child: TextButton(
                        onPressed: () async {
                          final initScreen =
                              await SharedPreferences.getInstance();
                          initScreen.setInt('initScreen', 0);

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff454893)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              )

            // Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 20, horizontal: 75),
            //     child: Material(
            //       borderRadius: BorderRadius.circular(15),
            //       color: const Color(0xff454893),
            //       child: MaterialButton(
            //         minWidth: 200,
            //         height: 60,
            //         onPressed: () async {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) {
            //                 return LoginScreen();
            //               },
            //             ),
            //           );
            //         },
            //         child: Text(
            //           "Get Started",
            //           style: GoogleFonts.poppins(
            //               color: Colors.white, fontWeight: FontWeight.bold),
            //           // style: TextStyle(
            //           //     color: Colors.white, fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ),
            //   )
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
                                controller.jumpToPage(3);
                              },
                              child: Text(
                                "Skip",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff454893),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                // TextStyle(
                                //     color: Color(0xff454893),
                                //     fontSize: 18,
                                //     fontWeight: FontWeight.w700)
                              )),
                          TextButton(
                              onPressed: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              },
                              child: Text(
                                "Next",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff454893),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              )),
                        ]),
                  ],
                ),
              ));
  }
}

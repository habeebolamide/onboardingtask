import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding/utils/responsive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  final PageController _page = PageController();

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF6E8EE), Color(0xFFEFDBF4), Color(0xFFF2E8F8)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _page,
                  children: [
                    _Subscriptions(),
                    _ToolKits(),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              SmoothPageIndicator(
                controller: _page,
                count: 2,
                effect: WormEffect(
                  radius: 6,
                  spacing: 8,
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: Color(0x3D000000),
                  activeDotColor: Colors.black,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(14)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5), 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Color(0xFFE9D3F6), 
                      width: 1.5,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 183, 183, 183), 
                          Color.fromARGB(255, 24, 24, 24),
                          Color(0xFF000000),
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(16)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Text(
                        "Get started",
                        style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Subscriptions() {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(12), horizontal: getProportionateScreenWidth(20)),
                margin: EdgeInsets.only(bottom: 18.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFF6E8EE),
                      Color(0xFFEFDBF4),
                      Color(0xFFF2E8F8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1AA96686),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  border: Border.all(color: Colors.white, width: 0.6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/framer.png',width: getProportionateScreenWidth(16), height: getProportionateScreenHeight(24)),
                            SizedBox(width: 20.w),
                            Text("Framer", style: TextStyle(fontSize: getProportionateFontSize(16))),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("\$12", style: TextStyle(fontSize: getProportionateFontSize(16))),
                            Text(
                              "Billed in 4 days",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(25)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0x0D9013FE),
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20),
                            ),
                          ),
                          child: Text(
                            "View",
                            style: TextStyle(
                              color: Color(0xFF9013FE),
                              fontSize: getProportionateFontSize(14),
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0x0A111111),
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20),
                            ),
                          ),
                          child: Text(
                            "Remind",
                            style: TextStyle(color: Colors.black, fontSize: getProportionateFontSize(14),fontWeight: FontWeight.w400),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xFFFFE0E0),
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20),
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red, fontSize: getProportionateFontSize(14),fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              _SubscriptionCard(
                'assets/figma.png',
                'Figma',
                '12',
                '9',
                1
              ),
              _SubscriptionCard(
                'assets/notion.png',
                'Notion',
                '12',
                '16',
                0.6
              ),
              _SubscriptionCard(
                'assets/chatgpt.png',
                'Chatgpt',
                '12',
                '24',
                0.4
              ),
              SizedBox(height: 7.h),
              _SubscriptionCard(
                'assets/blender.png',
                'Blender',
                '12',
                '24',
                0.2
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: getProportionateScreenHeight(125),
              child: Column(
                children: [
                  Text(
                    "Keep track of every\nsubscription",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getProportionateFontSize(28),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.5,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(4)),
                  Text(
                    "Stay On Top of what you want to pay for",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: getProportionateFontSize(12), color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _SubscriptionCard(
    String logo,
    String title,
    String price,
    String billingInfo,
    double withOpacity,
  ) {
    return Opacity(
      opacity: withOpacity,
      child: Container(
        margin: EdgeInsets.only(bottom: 18.h),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(23),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          gradient: LinearGradient(
            colors: [Color(0xFFF6E8EE), Color(0xFFEFDBF4), Color(0xFFF2E8F8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          boxShadow: [
            BoxShadow(
              color: Color(0x1AA96686),
              blurRadius: 40,
              offset: Offset(0, 5),
            ),
          ],

          border: Border.all(color: Colors.white, width: 0.6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(logo, width: getProportionateScreenWidth(18), height: getProportionateScreenHeight(24)),
                SizedBox(width: 20.w),
                Text(title, style: TextStyle(fontSize: getProportionateFontSize(16))),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$$price',
                  style: TextStyle(fontSize: getProportionateFontSize(16), fontWeight: FontWeight.bold),
                ),
                Text(
                  "Billed in $billingInfo days",
                  style: TextStyle(color: Colors.grey.shade600,fontSize:getProportionateFontSize(12) ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _ToolKits() {
    return Container(
       padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(14),
          vertical: getProportionateScreenHeight(14),
        ),
      child: Stack(
        children: [
          Column(
            children: [
              Kits(
                angle: -0.04,
                topText: "Designers Toolkit",
                imageUrls: [
                  'assets/figma.png',
                  'assets/framer.png',
                  'assets/canvas.png',
                ],
                bottomText: "1,200 creatives trust this stack",
              ),
              SizedBox(height: getProportionateScreenHeight(17)),
              Kits(
                angle: 0.04,
                topText: " Indie Hacker’s Essentials",
                imageUrls: [
                  'assets/vercel.png',
                  'assets/notion.png',
                  'assets/stripe.png',
                ],
                bottomText:
                    "Curated by Sam Ortega  building profitable products solo",
              ),
              SizedBox(height: getProportionateScreenHeight(17)),
              Kits(
                angle: -0.04,
                topText: "Remote Team Starter Pack",
                imageUrls: [
                  'assets/slack.png',
                  'assets/framer.png',
                  'assets/canvas.png',
                ],
                bottomText:
                    "Curated by Kendra Holt helping distributed teams thrive",
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: getProportionateScreenHeight(125),
              child: Column(
                children: [
                  Text(
                    "Work Like the \nbest",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: getProportionateFontSize(28),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.5,
                    ),
                  ),
                  Text(
                    "Discover proven tools from the people who master their craft",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: getProportionateFontSize(12), color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Kits({
    required double angle,
    required String topText,
    required List<String> imageUrls,
    required String bottomText,
  }) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(20),
          horizontal: getProportionateScreenWidth(20)
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromRGBO(255, 255, 255, 0.6),
          border: Border.all(
            color: Color.fromRGBO(255, 215, 215, 1),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              topText,
              style: TextStyle(fontSize: getProportionateFontSize(15), fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            Row(
              children:
                  imageUrls
                      .map(
                        (url) => Padding(
                          padding: EdgeInsets.only(right: 28.0),
                          child: Image.asset(
                            url,
                            height: getProportionateScreenHeight(25),
                            width: getProportionateScreenWidth(25),
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: 20.h),

            Text(
              bottomText,
              style: TextStyle(color: Colors.grey.shade700, fontSize: getProportionateFontSize(11)),
            ),
          ],
        ),
      ),
    );
  }
}

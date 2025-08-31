import 'dart:ffi';

import 'package:flutter/material.dart';
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
  final double _deviceHeight = MediaQuery.of(context).size.height;
  final double _deviceWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF9E9EA), Color(0xFFEFE5F7)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _page,
                  children: [_Subscriptions(_deviceHeight,_deviceWidth), _ToolKits(_deviceHeight,_deviceWidth)],
                ),
              ),
              SizedBox(height: 8),
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
              SizedBox(height: 14),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Subscriptions(_deviceHeight, _deviceWidth) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: _deviceHeight*0.005),
                padding: EdgeInsets.all(_deviceHeight*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.pink.shade50, Colors.purple.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/framer.png'),
                            SizedBox(width: _deviceWidth*0.025),
                            Text("Framer", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("\$12", style: TextStyle(fontSize: 20)),
                            Text(
                              "Billed in 4 days",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: _deviceHeight*0.006),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0x0D9013FE),
                            padding: EdgeInsets.symmetric(horizontal: _deviceHeight*0.03),
                          ),
                          child: Text(
                            "View",
                            style: TextStyle(
                              color: Color(0xFF9013FE),
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0x0A111111),
                            padding: EdgeInsets.symmetric(horizontal: _deviceHeight*0.03),
                          ),
                          child: Text(
                            "Remind",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xFFFFE0E0),
                            padding: EdgeInsets.symmetric(horizontal: _deviceHeight*0.03),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              _SubscriptionCard('assets/figma.png', 'Figma', '12', '9', 1,_deviceHeight,_deviceWidth),
              _SubscriptionCard('assets/notion.png', 'Notion', '12', '16', 0.6,_deviceHeight,_deviceWidth),
              _SubscriptionCard(
                'assets/chatgpt.png',
                'Chatgpt',
                '12',
                '24',
                0.4,
                _deviceHeight,_deviceWidth
              ),
              SizedBox(height: 9),
              _SubscriptionCard(
                'assets/blender.png',
                'Blender',
                '12',
                '24',
                0.3,
                _deviceHeight,_deviceWidth
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: _deviceHeight * 0.18,
              child: Column(
                children: [
                  Text(
                    "Keep track of every\nsubscription",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: _deviceHeight*0.02),
                  Text(
                    "Stay On Top of what you want to pay for",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
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
    double deviceHeight,
    double deviceWidth,
  ) {
    return Opacity(
      opacity: withOpacity,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: deviceHeight * 0.015),
        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.025, vertical: deviceHeight * 0.025),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.pink.shade50, Colors.purple.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(logo, width: 28, height: 28),
                SizedBox(width: 20),
                Text(title, style: TextStyle(fontSize: 20)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Billed in $billingInfo days",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _ToolKits(_deviceHeight, _deviceWidth) {
    return Container(
      padding: EdgeInsets.all(_deviceHeight*0.020),
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
              SizedBox(height: 17),
              Kits(
                angle: 0.04,
                topText: " Indie Hacker’s Essentials",
                imageUrls: [
                  'assets/vercel.png',
                  'assets/notion.png',
                  'assets/stripe.png',
                ],
                bottomText: "Curated by Sam Ortega  building profitable products solo",
              ),
              SizedBox(height: 17),
              Kits(
                angle: -0.04,
                topText: "Remote Team Starter Pack",
                imageUrls: [
                  'assets/slack.png',
                  'assets/framer.png',
                  'assets/canvas.png',
                ],
                bottomText: "Curated by Kendra Holt helping distributed teams thrive",
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(top: _deviceHeight * 0.0034),
                  child: Column(
                    children: [
                      Text(
                        "Work Like the \nbest",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      // SizedBox(height: 20),
                      Text(
                        "Discover proven tools from the people who master their craft",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(20),
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
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
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
                            height: 35, // fixed size
                            width: 35,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: 20),

            Text(bottomText, style: TextStyle(color: Colors.grey.shade700,fontSize: 12.5)),
          ],
        ),
      ),
    );
  }
}

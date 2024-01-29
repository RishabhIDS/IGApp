import 'package:flutter/material.dart';

import 'notification_screen.dart';

class AboutIG extends StatefulWidget {
  const AboutIG({super.key});

  @override
  State<AboutIG> createState() => _AboutIDSState();
}

class _AboutIDSState extends State<AboutIG> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_left,
              color: Color(0xFFE35B63),
              size: 60,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: height * 0.03),
            child: Text(
              "अद्वैतम्",
              style: TextStyle(color: Colors.white, fontSize: height * 0.035),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(
                  Icons.notification_add_outlined,
                  size: height * 0.03,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IgNotificationScreen()));
                },
              ),
            ),
          ]),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.075, horizontal: width * 0.05),
              child: const Text(
                "The Institute Development Society\n at VNIT Nagpur is a student\n organization focused on promoting We \nDevelopment, Android Development\nBlockchain technology , Competitive \nprogramming and UI/UX. IDS's primary\naim is to prepare its members for\nHackathons and cultivate a coding\n culture at VNIT Nagpur. Through\n workshops, seminars, coding\n challenges, and collaborative projects,\n IDS equips its members with Practical \n skills for success in these dynamic tech\n fields. Serving as a bridge between\n academics and industry requirements,\n IDS ensures students are well-prepared\n for tech careers.",
                style: TextStyle(color: Colors.white, fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: height * 0.25,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("deptlogos/logo-removebg-preview.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igapp/models/imagemodel.dart';
import 'package:igapp/screens/HomeScreen.dart';
import 'package:igapp/screens/calendarcontainer.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../view_model/ig_view_model.dart';

import 'ig_schedule_screen.dart';
import 'notification_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Picoftheday extends StatefulWidget {
  const Picoftheday({super.key});

  @override
  State<Picoftheday> createState() => _PicofthedayState();
}

class _PicofthedayState extends State<Picoftheday> {
  IgViewModel igViewModel = new IgViewModel();
  FilterList? selectedMenu;
  Map<int, String> customNames = {
    1: 'Fri',
    2: 'Sat',
    3: 'Sun',
    4: 'Mon',
    5: 'Tue',
    6: 'Wed',
    0: 'Thur',
  };

  // picture pic = new picture();

  final format = DateFormat('dd/MM/yy');
  String name = "10-02-2023";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: Icon(
              Icons.arrow_left_outlined,
              color: Colors.redAccent,
              size: height * 0.07,
            ),
          ),
          title: Text(
            "अद्वैतम्",
            style: TextStyle(color: Colors.white, fontSize: height * 0.03),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: Colors.blue,
            ),
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 4),
                      child: Text(
                        DateFormat.d().format(DateTime.now()),
                        style: TextStyle(
                            fontSize: height * 0.04, color: Colors.redAccent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.EEEE().format(DateTime.now()),
                            style: TextStyle(
                                fontSize: height * 0.016, color: Colors.white),
                          ),
                          Text(
                            DateFormat('MMMM yyyy').format(DateTime.now()),
                            style: TextStyle(
                                fontSize: height * 0.016, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.35,
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.22,
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(width * 0.026, 0, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              'Day',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: height * 0.030),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  width * 0.02, 0, width * 0.01, 0),
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: height * 0.035,
                                    color: Colors.redAccent),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.blue,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 1; i < 10; i++)
                    Calendercontainer(
                      val: i,
                      day: customNames,
                    ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.4,
                      width: width,
                      child: FutureBuilder<List<imagemodel>>(
                        future: igViewModel.fetchIgimageApi(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: SpinKitCircle(
                                size: 50,
                                color: Colors.blue,
                              ),
                            );
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data?.length ?? 0,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  //   DateTime dateTime = DateTime.parse(snapshot.data!.notifications![index].timeatcreate);
                                  if (index < snapshot.data!.length) {
                                    if (snapshot.data![index].imageUrl !=
                                            null &&
                                        snapshot.data![index].imageUrl
                                                .toString() !=
                                            "null") {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Container(
                                          height: height * 0.3,
                                          width: width * 0.9,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data![index].imageUrl
                                                  .toString(),
                                              fit: BoxFit.fitHeight,
                                              placeholder: (context, url) =>
                                                  Container(
                                                child: spinkitty,
                                              ),
                                              errorWidget:
                                                  (context, url, error) => Icon(
                                                Icons.error_outline,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  } else {
                                    Container();
                                  }
                                });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Description : ",
                  style: GoogleFonts.prozaLibre(
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in.",
                style:
                    GoogleFonts.prozaLibre(fontSize: 16, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const spinkitty = SpinKitFadingCircle(
  size: 50,
  color: Colors.amber,
);

class NumberedList extends StatelessWidget {
  const NumberedList({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: NumberedBox(number: index + 1),
        );
      },
    );
  }
}

class NumberedBox extends StatelessWidget {
  final int number;

  const NumberedBox({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          width * 0.02, width * 0.02, width * 0.02, width * 0.02),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(),
        child: Column(
          children: [
            Center(
              child: Text(
                '$number',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height * 0.030,
                ),
              ),
            ),
            Text(
              getCustomWeekdayName(DateTime.now().weekday),
            )
          ],
        ),
      ),
    );
  }
}

String getCustomWeekdayName(int weekday) {
  Map<int, String> customNames = {
    1: 'Sun',
    2: 'Mon',
    3: 'Tue',
    4: 'Wed',
    5: 'Thu',
    6: 'Fri',
    7: 'Sat',
  };
  if (weekday < 1 || weekday > 7) {
    return 'Invalid Weekday';
  }

  return customNames[weekday] ?? 'Unknown';
}

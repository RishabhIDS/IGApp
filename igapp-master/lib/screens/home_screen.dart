//
//
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:igapp/screens/article_screen.dart';
// import 'package:igapp/screens/ig_schedule_screen.dart';
// import 'package:igapp/screens/igenthu.dart';
// import 'package:igapp/screens/igleader2.dart';
// import 'package:igapp/screens/notification_screen.dart';
//
// import 'ig_enthu_screen.dart';
// import 'ig_leader_screen.dart';
//
// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});
//
//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }
//
// class _HomescreenState extends State<Homescreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     final height= MediaQuery.sizeOf(context).height;
//     final width=MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: InkWell(
//                 onTap: (){
//                    Navigator.push(context, MaterialPageRoute(builder: (context)=>IgEnthuScreen()));
//                 },
//                 child: Container(
//                   height: height*0.1,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.blueAccent
//                   ),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('IG Enthuboard',style: GoogleFonts.brawler(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black87),)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: InkWell(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>IgLeaderScreen()));
//                 },
//                 child: Container(
//                   height: height*0.1,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.blueAccent
//                   ),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('IG Leaderboard',style: GoogleFonts.brawler(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black87),)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: InkWell(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>IgScheduleScreen()));
//                 },
//                 child: Container(
//                   height: height*0.1,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.blueAccent
//                   ),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('IG Schedule',style: GoogleFonts.brawler(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black87),)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: InkWell(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>IgArticleScreen()));
//                 },
//                 child: Container(
//                   height: height*0.1,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.blueAccent
//                   ),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('IG Article',style: GoogleFonts.brawler(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black87),)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: InkWell(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>IgNotificationScreen()));
//                 },
//                 child: Container(
//                   height: height*0.1,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.blueAccent
//                   ),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('IG Notification',style: GoogleFonts.brawler(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black87),)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






// class NumberedList extends StatelessWidget {
//   const NumberedList({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       scrollDirection: Axis.horizontal,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 1,
//       ),
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return InkWell(
//           onTap: () {},
//           child: NumberedBox(number: index + 1),
//         );
//       },
//     );
//   }
// }

// class NumberedBox extends StatelessWidget {
//   final int number;

//   const NumberedBox({super.key, required this.number});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width * 1;
//     final height = MediaQuery.sizeOf(context).height * 1;
//     return Padding(
//       padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ButtonStyle(),
//         child: Column(
//           children: [
//             Center(
//               child: Text(
//                 '$number',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: height * 0.030,
//                 ),
//               ),
//             ),
//             Text(
//               getCustomWeekdayName(DateTime.now().number),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// String getCustomWeekdayName(int number) {
//   Map<int, String> customNames = {
//     1: 'Sun',
//     2: 'Mon',
//     3: 'Tue',
//     4: 'Wed',
//     5: 'Thu',
//     6: 'Fri',
//     7: 'Sat',
//   };
//   if (number < 1 || number > 7) {
//     return 'Invalid Weekday';
//   }
//   return customNames[number] ?? 'Unknown';
// }

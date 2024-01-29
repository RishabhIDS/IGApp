import 'package:flutter/material.dart';

class Calendercontainer extends StatefulWidget {
  Calendercontainer({super.key, required this.val, required this.day});
  final int val;
  final Map<int, String> day;

  @override
  State<Calendercontainer> createState() => _CalendercontainerState();
}

class _CalendercontainerState extends State<Calendercontainer> {
  Color _containerColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            _containerColor = Colors.white;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 6,
          height: MediaQuery.of(context).size.height / 13,
          decoration: BoxDecoration(
              color: _containerColor, borderRadius: BorderRadius.circular(3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${widget.day[widget.val % 7]}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text("${widget.val}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

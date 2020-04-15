import "package:flutter/material.dart";
import "package:enbox/colors.dart";

class EnboxNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 23),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: EnboxColors.e1,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {},
            tooltip: "Today",
          ),
        ],
      ),
    );
  }
}

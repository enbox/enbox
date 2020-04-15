import "package:flutter/material.dart";
import "package:enbox/colors.dart";

class EnboxAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(85);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 13),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: EnboxColors.e7,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.mail),
        ],
      ),
    );
  }
}

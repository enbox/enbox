import "package:flutter/material.dart";
import "package:enbox/items.dart";
import "package:enbox/item_widgets.dart";
import "package:enbox/colors.dart";

class EnboxItemsDisplay extends StatelessWidget {
  final String currentViewName;
  final List<EnboxItem> _items = [
    EmailItem("Sender", "subject", "Description goes here lorem ipsum",
        more: List.filled(5, "Item name here")),
    EmailItem("Client Doe", "Important business",
        "Important business description goes here, blah blah blah blah",
        isImportant: true),
    EmailItem("Mom", "Stay home",
        "Hey baby! Stay safe! cdc.gov/coronavirus/2019-ncov/index.html",
        customIcon: Icon(Icons.favorite, color: Colors.pink)),
  ];

  EnboxItemsDisplay(this.currentViewName);

  Widget _buildListItem(EnboxItem item) {
    if (item is EmailItem) {
      return EmailWidget(item);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 27),
            child: Text(currentViewName),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: EnboxColors.e1,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
              ),
              child: ListView.builder(
                itemBuilder: (context, i) =>
                    i < _items.length ? _buildListItem(_items[i]) : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

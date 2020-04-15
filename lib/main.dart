import 'package:flutter/material.dart';

void main() => runApp(EnboxApp());

class EnboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EnboxHome());
  }
}

class EnboxHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EnboxAppBar(),
      body: EnboxBody(),
    );
  }
}

class EnboxBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        EnboxNavbar(),
        EnboxItemsDisplay(
          "Today",
        ),
        //EnboxItemDisplay(),
      ],
    );
  }
}

/* Types of Enbox items */
abstract class EnboxItem {}

class EmailItem extends EnboxItem {
  String sender;
  String subject;
  String description;
  bool isImportant;
  Icon customIcon;
  List<String> more;

  EmailItem(this.sender, this.subject, this.description,
      {this.isImportant = false, this.customIcon, this.more});
}

class BundleItem extends EnboxItem {
  String name;
  int numNew;
  List<String> senders;
  Icon icon;

  BundleItem(this.name, this.numNew, this.senders, this.icon);
}

const Color bookmarkPink = const Color.fromARGB(255, 241, 150, 150);
const Color importantYellow = const Color.fromARGB(255, 245, 201, 75);
const Color cf = const Color.fromARGB(255, 207, 207, 207);

const TextStyle descriptionStyle = const TextStyle(
  color: const Color.fromARGB(255, 189, 189, 189),
);
const TextStyle moreStyle = const TextStyle(
  color: const Color.fromARGB(255, 143, 143, 143),
);

class EmailWidget extends StatelessWidget {
  final EmailItem _email;

  EmailWidget(this._email);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              _email.customIcon ??
                  Icon(
                    _email.isImportant ? Icons.label_important : Icons.bookmark,
                    color: _email.isImportant ? importantYellow : bookmarkPink,
                  ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${_email.sender}  ∙  ${_email.subject}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _email.description,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: descriptionStyle,
          ),
          SizedBox(
            height: 10,
          ),
          if (_email.more != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (String item in _email.more.take(3))
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: cf,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      item,
                      style: moreStyle,
                    ),
                  ),
                if (_email.more.length > 3)
                  Text("+${_email.more.length - 3}", style: moreStyle),
              ],
            ),
        ],
      ),
    );
  }
}

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
                    color: e1,
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

const Color e1 = const Color.fromARGB(255, 225, 225, 225);

class EnboxNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 23),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: e1,
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

const Color e7 = Color.fromARGB(255, 231, 231, 231);

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
            color: e7,
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

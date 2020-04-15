import "package:flutter/material.dart";

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

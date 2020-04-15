import "package:flutter/material.dart";
import "package:enbox/items.dart";

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

import 'package:enbox/constants.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// A common Enbox [Drawer].
class EnboxDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.check),
            title: const Text(PageTitles.today),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, RouteNames.today);
            },
          ),
        ],
      ),
    );
  }
}

/// A common Enbox [AppBar].
class EnboxAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// See [AppBar.preferredSize], which is [kToolbarHeight] by default.
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Enbox"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.chat_bubble),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.apps),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
        const CircleAvatar(
          backgroundColor: Colors.grey,
        ),
      ],
    );
  }
}

/// A Enbox [ListTile] representing an email or promotion.
class EnboxTile extends StatefulWidget {
  final String sender;
  final int smallNumber;
  final String subject;
  final String body;
  final Icon icon;

  const EnboxTile(
      {@required this.sender,
      @required this.smallNumber,
      @required this.subject,
      @required this.body,
      this.icon,
      Key key})
      : super(key: key);

  @override
  _EnboxTileState createState() => _EnboxTileState();
}

class _EnboxTileState extends State<EnboxTile> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (e) {
        setState(() {
          _isHovering = false;
        });
      },
      child: ListTile(
        leading: widget.icon ??
            const CircleAvatar(
              child: const Icon(
                Icons.account_circle,
              ),
            ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("${widget.sender}, me",
                style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(width: 5),
            Text(
              "${widget.smallNumber}",
              style: Theme.of(context).textTheme.overline.copyWith(
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
            ),
            const SizedBox(
              width: 60,
            ),
            Text(
              widget.subject,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Expanded(
              child: Text(
                " - ${widget.body}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Color.fromRGBO(0, 0, 0, 0.38)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        trailing: isMobile(context) || _isHovering
            ? Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(MdiIcons.pin),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(MdiIcons.clockOutline),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
                mainAxisSize: MainAxisSize.min,
              )
            : null,
      ),
    );
  }
}

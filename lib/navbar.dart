/* Suspend this file for now. */
/*
import "package:equatable/equatable.dart";
import "package:flutter/material.dart";
import "package:enbox/colors.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:enbox/bloc.dart";

class _NavbarItem extends Equatable {
  final String name;
  final IconData icon;
  final String tooltip;

  const _NavbarItem(
      {@required this.name, @required this.icon, @required this.tooltip})
      : assert(name != null),
        assert(icon != null),
        assert(tooltip != null);

  @override
  List<Object> get props => [name, icon, tooltip];
}

final List<_NavbarItem> _navbarItems = [
  _NavbarItem(
    name: "today",
    icon: Icons.check,
    tooltip: "Today",
  ),
];

class EnboxNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final ViewBloc bloc = BlocProvider.of<ViewBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(23),
      child: BlocBuilder<ViewBloc, ViewState>(
        builder: (context, state) {
          String selected = state is ViewSelected ? state.selectedView : null;
          return Column(
            children: <Widget>[
              for (_NavbarItem item in _navbarItems)
                Ink(
                  // (25 // 2) matches IconButton
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.name == selected
                        ? Colors.black87
                            .withOpacity(0.12) // check docs for getSplashColor
                        : Colors.transparent,
                  ),
                  child: IconButton(
                    icon: Icon(
                      item.icon,
                      size: 25,
                    ),
                    onPressed: () => bloc.add(SelectView(viewName: item.name)),
                    tooltip: item.tooltip,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
*/

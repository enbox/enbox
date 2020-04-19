import 'package:flutter/material.dart';
import "package:meta/meta.dart";
import "package:equatable/equatable.dart";

import "package:enbox/items.dart";

abstract class EmailsState extends Equatable {
  const EmailsState();
}

class EmailsAvailable extends EmailsState {
  final List<EnboxItem> emails;
  final bool moreAvailable;

  const EmailsAvailable({@required this.emails, this.moreAvailable = false})
      : assert(emails != null);

  EmailsAvailable copyWith({List<EnboxItem> emails, bool moreAvailable}) =>
      EmailsAvailable(
        emails: emails ?? this.emails,
        moreAvailable: moreAvailable ?? this.moreAvailable,
      );

  @override
  List<Object> get props => [emails];
}

class EmailsAvailableAndSelected extends EmailsState {
  final List<EnboxItem> emails;
  final bool moreAvailable;
  final int _selectedIndex;

  EnboxItem get selectedItem => emails[_selectedIndex];

  const EmailsAvailableAndSelected(this._selectedIndex,
      {@required this.emails, this.moreAvailable = false})
      : assert(_selectedIndex < emails.length),
        assert(emails != null);

  // Convenience constructor.
  EmailsAvailableAndSelected.from(EmailsAvailable state, this._selectedIndex)
      : assert(_selectedIndex < state.emails.length),
        this.emails = state.emails,
        this.moreAvailable = state.moreAvailable;

  EmailsAvailableAndSelected copyWith(
          {int selectedIndex, List<EnboxItem> emails, bool moreAvailable}) =>
      EmailsAvailableAndSelected(
        selectedIndex ?? this._selectedIndex,
        emails: emails ?? this.emails,
        moreAvailable: moreAvailable ?? this.moreAvailable,
      );

  @override
  List<Object> get props => [emails, _selectedIndex];
}

import "package:meta/meta.dart";
import "package:equatable/equatable.dart";

abstract class EmailsEvent extends Equatable {
  const EmailsEvent();
}

class FetchEmails extends EmailsEvent {
  final int amount;

  const FetchEmails({@required this.amount});

  @override
  List<Object> get props => [amount];
}

class SelectEmail extends EmailsEvent {
  final int index;

  // N.B. item is preferred over index
  const SelectEmail({@required this.index});

  @override
  List<Object> get props => [index];
}

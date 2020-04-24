import "dart:async";

import "package:bloc/bloc.dart";

import "package:flutter/material.dart";

import "package:enbox/bloc/emails.dart";
import "package:enbox/items.dart";

class EmailsBloc extends Bloc<EmailsEvent, EmailsState> {
  // Mock state for now.
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
  final int _max = 200;

  @override
  EmailsState get initialState => const EmailsAvailable(emails: []);

  @override
  Stream<EmailsState> mapEventToState(
    EmailsEvent event,
  ) async* {
    if (event is FetchEmails) {
      yield* mapFetchToState(event);
    } else if (event is SelectEmail) {
      yield* mapSelectToState(event);
    }
  }

  Stream<EmailsState> mapFetchToState(
    FetchEmails fetch,
  ) async* {
    List<EnboxItem> items;
    if (state is EmailsAvailable) {
      items = (state as EmailsAvailable).emails;
    } else if (state is EmailsAvailableAndSelected) {
      items = (state as EmailsAvailableAndSelected).emails;
    }
    assert(items != null); // exhaustive condition

    // TODO: Fetch items
    int targetLength = items.length + fetch.amount;
    while (items.length < targetLength && items.length <= _max) {
      int index = items.length;
      items.add(_items[index % _items.length]);
    }
    bool maxed = items.length == _max;
    // Simulate latency (3s)
    await Future.delayed(Duration(seconds: 3));

    if (state is EmailsAvailable) {
      yield (state as EmailsAvailable)
          .copyWith(emails: items, moreAvailable: !maxed);
    } else if (state is EmailsAvailableAndSelected) {
      yield (state as EmailsAvailableAndSelected)
          .copyWith(emails: items, moreAvailable: !maxed);
    }
  }

  Stream<EmailsState> mapSelectToState(
    SelectEmail select,
  ) async* {
    if (state is EmailsAvailable) {
      yield EmailsAvailableAndSelected.from(state, select.index);
    } else if (state is EmailsAvailableAndSelected) {
      yield (state as EmailsAvailableAndSelected)
          .copyWith(selectedIndex: select.index);
    }
  }
}

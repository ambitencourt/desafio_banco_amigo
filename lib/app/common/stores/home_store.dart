import 'package:flutter/material.dart';

class HomeStore extends ValueNotifier<String?> {
  HomeStore() : super("Bom dia");

  setMoment(String moment) => value = moment;
}

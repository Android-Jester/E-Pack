import 'package:flutter/material.dart';

smoothScrollToTop(ScrollController scroll) {
  if (scroll.hasClients) {
    scroll.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }
}
import 'package:flutter/material.dart';

enum TopicAction { none, book, lock }

class Learnings {
  final String heading;
  final List<Topic> topics;
  Learnings({required this.heading, required this.topics});
}

class Topic {
  final String imagePath;
  final String title;
  final String description;
  final String information;
  final VoidCallback onTap;
  final TopicAction action;
  Topic({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.information,
    required this.onTap,
    required this.action,
  });
}

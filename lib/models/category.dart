import 'package:flutter/material.dart';

enum PartType {
  ev,
  petrol,
}

class SpareCategory {
  final String id;
  final String name;
  final PartType type;
  final String description;
  final IconData icon;
  final List<String> popularParts;
  final String? image;

  const SpareCategory({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.icon,
    required this.popularParts,
    this.image,
  });
}

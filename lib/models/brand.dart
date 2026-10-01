import 'package:flutter/material.dart';

enum BrandCategory {
  ev,
  petrol,
}

class SupportedBrand {
  final String id;
  final String name;
  final BrandCategory category;
  final String tagline;
  final List<String> popularModels;
  final IconData icon;
  final String? image;

  const SupportedBrand({
    required this.id,
    required this.name,
    required this.category,
    required this.tagline,
    required this.popularModels,
    required this.icon,
    this.image,
  });
}

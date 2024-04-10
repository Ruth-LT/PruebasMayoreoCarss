import 'package:flutter/material.dart';

class ServiceModel {
  final String title;
  final String description;
  final Color color;
  final String background;
  final IconData icon;

  ServiceModel(
      { this.title,
       this.description,
       this.color,
       this.background,
       this.icon});
}

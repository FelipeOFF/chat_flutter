import 'package:flutter/material.dart';

extension BoxConstraintsExt on BoxConstraints {
  double calcTranslation(double statusAnimation) =>
      ((this.maxHeight * 0.2) * statusAnimation);
}

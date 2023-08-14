import 'dart:ui';

class EntryPoint {
  final String navigationEndPoint;
  final String text;
  final Color borderColor;
  final Color boxColor;

  EntryPoint(this.navigationEndPoint, this.text, this.borderColor, this.boxColor);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntryPoint &&
          runtimeType == other.runtimeType &&
          navigationEndPoint == other.navigationEndPoint &&
          text == other.text &&
          borderColor == other.borderColor &&
          boxColor == other.boxColor;

  @override
  int get hashCode =>
      navigationEndPoint.hashCode ^
      text.hashCode ^
      borderColor.hashCode ^
      boxColor.hashCode;
}
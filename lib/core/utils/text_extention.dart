
extension StringExtension on String {
  /// this would capitalize the first letter of the String
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

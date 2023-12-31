extension FormatSecondsExtension on int {
  String toMMSS() {
    int minutes = this ~/ 60;
    int remainingSeconds = this % 60;

    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');

    return '$formattedMinutes:$formattedSeconds';
  }
}

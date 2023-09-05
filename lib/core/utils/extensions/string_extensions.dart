extension StringExtensions on String {
  List<String> splitWords() {
    RegExp pattern = RegExp(r"[\w']+|[.,!?';]|\s+");

    Iterable<Match> matches = pattern.allMatches(this);

    List<String> result = [];

    for (Match match in matches) {
      result.add(match.group(0)!);
    }
    return result;
  }

  bool isWord() {
    RegExp pattern = RegExp(r'^[a-zA-Z\-]+$');
    return pattern.hasMatch(this);
  }
}

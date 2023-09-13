extension StringExtensions on String {
  List<String> splitWords() {
    RegExp pattern = RegExp(r"(?:[\w'’-]+(?:,\d{3})*|[“”,.\-—!?@#;])|\s+");

    Iterable<Match> matches = pattern.allMatches(this);

    List<String> result = [];

    for (Match match in matches) {
      result.add(match.group(0)!);
    }
    return result;
  }

  bool isWord() {
    RegExp pattern = RegExp(r"[a-zA-Z'’-]+");
    //RegExp(r'^[a-zA-Z\-]+$');
    return pattern.hasMatch(this);
  }

  Map<String, String> splitMeaning() {
    final input = trim();
    final regex = RegExp(r"(\w+\.)");

    final matches = regex.allMatches(input);
    final meanings = input.split(regex).where((s) => s.isNotEmpty).toList();

    final resultMap = <String, String>{};

    for (int i = 0; i < meanings.length; i++) {
      final key = matches.elementAt(i).group(0);
      final value = meanings[i];
      resultMap[key!] = value;
    }
    return resultMap;
  }
}

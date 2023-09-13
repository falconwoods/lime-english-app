import 'dart:convert';
import 'dart:io';

class EpisodeMeta {
  late final List<Map<int, int>> pos;

  EpisodeMeta();

  Future<EpisodeMeta> loadFromFile(String filePath) async {
    final file = File(filePath);
    final text = await file.readAsString();
    dynamic arg = jsonDecode(text);

    pos = (arg['pos'] as List)
        .map((item) => (item as Map<String, dynamic>)
            .map<int, int>((key, value) => MapEntry(int.parse(key), value)))
        .toList();

    return this;
  }

  int getVocabPOSIndex(int sequence, int startIndex) {
    sequence--;
    if (sequence < 0 || startIndex < 0) return 0;
    Map<int, int> sentence = pos[sequence];
    if (!sentence.containsKey(startIndex)) {
      return 0;
    }
    return sentence[startIndex]!;
  }
}

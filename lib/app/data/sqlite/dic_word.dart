class DicWord {
  late final String word;
  late final String pronunciation;
  late final String meaning;

  DicWord(this.word, this.pronunciation, this.meaning);

  factory DicWord.fromMap(Map<String, dynamic> map) {
    return DicWord(map['word'], map['pronunciation'], map['meaning']);
  }

  factory DicWord.empty(String vocab) {
    return DicWord(vocab, '', '');
  }
}

// ignore_for_file: constant_identifier_names

class VocabPOS {
  static const int NO_TAG = 1 << 1; // 00000001
  static const int ADJ = 1 << 2; // 00000001
  static const int ADP = 1 << 3; // 00000010
  static const int ADV = 1 << 4; // 00000100
  static const int AUX = 1 << 5; // 00001000
  static const int CONJ = 1 << 6; // 00010000
  static const int CCONJ = 1 << 6; // 00100000
  static const int DET = 1 << 8; // 01000000
  static const int INTJ = 1 << 9; // 10000000
  static const int NOUN = 1 << 10; // 100000000
  static const int NUM = 1 << 11; // 1000000000
  static const int PART = 1 << 12; // 1000000000
  static const int PRON = 1 << 13; // 1000000000
  static const int PROPN = 1 << 14; // 1000000000
  static const int PUNCT = 1 << 15; // 1000000000
  static const int SCONJ = 1 << 16; // 1000000000
  static const int SYM = 1 << 17; // 1000000000
  static const int VERB = 1 << 18; // 1000000000
  static const int X = 1 << 19; // 1000000000
  static const int EOL = 1 << 20; // 1000000000
  static const int SPACE = 1 << 21; // 1000000000

  static const Map<String, int> typeMap = {
    'adj.': ADJ,
    'n.': NOUN,
    'v.': VERB,
    'vt.': VERB,
    'vi.': VERB,
    'vbl.': VERB,
    'adv.': ADV,
    'pron.': PRON,
    'num.': NUM,
    'prep.': ADP,
    'conj.': CONJ,
    'cconj.': CONJ,
    'interj.': INTJ,
    'part.': PART,
    'sym.': SYM,
    'aux.': AUX,
    'x.': X,
  };

  static int getTypeValueByIndex(int index) {
    return 1 << index;
  }

  static int getPosIndexByValue(int value) {
    int index = 0;
    while (value > 1) {
      value >>= 1;
      index++;
    }
    return index;
  }

  static int getPOSValue(String type) {
    return typeMap[type] ?? 0;
  }

  static int getPOSIndex(String type) {
    return getPosIndexByValue(typeMap[type] ?? 0);
  }

  static int addWordPOS(int curTypes, String type) {
    curTypes |= getPOSValue(type);
    return curTypes;
  }

  static int rmWordPOS(int curTypes, String type) {
    curTypes &= ~getPOSValue(type);
    return curTypes;
  }

  static bool hasWordPOS(int curTypes, String type) {
    return (curTypes & getPOSValue(type)) != 0;
  }
}

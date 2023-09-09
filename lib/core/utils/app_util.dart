class AppUtil {
  /// episodeId = programId(16bits) + episodeSequence(16bits) = 32bits
  /// episodeId(32bits) + captionSequence(32bits) = 64bits
  static int encodeExampleRef(int episodeId, int captionSequence) {
    // Make sure num1, num2, and num3 are within the valid range.
    if (episodeId < 0 ||
        episodeId >= (1 << 32) ||
        captionSequence < 0 ||
        captionSequence >= (1 << 32)) {
      throw ArgumentError('Input numbers out of range');
    }

    // Combine the three numbers into a 64-bit integer.
    int compressedValue = (episodeId << 32) | captionSequence;

    var ret = decodeExampleRef(compressedValue);

    return compressedValue;
  }

  static List<int> decodeExampleRef(int exampleRef) {
    // Extract the three numbers from the compressed 64-bit integer.
    int episodeId = (exampleRef >> 32) & 0xFFFFFFFF;
    int sequence = exampleRef & 0xFFFFFFFF;

    return [episodeId, sequence];
  }

  static String tryGetSingular(String word) {
    // s
    if (word.endsWith('s')) {
      return word.substring(0, word.length - 1);
    }

    // es
    if (word.endsWith('es')) {
      String stem = word.substring(0, word.length - 2);
      if (stem.endsWith('s') ||
          stem.endsWith('x') ||
          stem.endsWith('z') ||
          stem.endsWith('sh') ||
          stem.endsWith('ch')) {
        return stem;
      }
    }

    // y
    if (word.endsWith('ies')) {
      String stem = word.substring(0, word.length - 3);
      if (!isVowel(stem[stem.length - 1])) {
        return stem + 'y';
      }
    }

    // Irregular
    // if (word == 'men') {
    //   return 'man';
    // }

    return word;
  }

  static bool isVowel(String character) {
    return 'aeiouAEIOU'.contains(character);
  }
}

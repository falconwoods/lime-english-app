import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

class Subtitle {
  late List<SubtitleEntry> _entries;

  Future<void> loadFromFile(String filePath) async {
    final file = File(filePath);
    final lines = await file.readAsLines();
    _entries = parseEntries(lines);
  }

  SubtitleEntry getSubtitle(Duration duration) {
    final matchingEntry = _entries.firstWhere(
      (entry) => entry.start <= duration && entry.end >= duration,
      orElse: () => SubtitleEntry(0, Duration.zero, Duration.zero, ''),
    );
    return matchingEntry;
  }

  SubtitleEntry getPreLine(Duration duration) {
    SubtitleEntry se = getSubtitle(duration);
    return getSubtitleByLine(se.index - 1);
  }

  SubtitleEntry getNextLine(Duration duration) {
    SubtitleEntry se = getSubtitle(duration);
    return getSubtitleByLine(se.index + 1);
  }

  // String getSubtitle(Duration duration) {
  //   final matchingEntry = _entries.firstWhere(
  //     (entry) => entry.start <= duration && entry.end >= duration,
  //     orElse: () => SubtitleEntry(0, Duration.zero, Duration.zero, ''),
  //   );
  //   return matchingEntry.text;
  // }

  SubtitleEntry getSubtitleByLine(int lineIndex) {
    lineIndex = lineIndex.clamp(0, _entries.length - 1);
    return _entries[lineIndex];
  }

  // String getSubtitleByLine(int lineIndex) {
  //   if (lineIndex < 0 || lineIndex >= _entries.length) {
  //     return '';
  //   }
  //   return _entries[lineIndex].text;
  // }

  List<SubtitleEntry> parseEntries(List<String> lines) {
    final List<SubtitleEntry> entries = [];
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].isEmpty) continue;

      final index = int.parse(lines[i]);
      i++;

      final timeParts = lines[i].split(' --> ');
      final start = parseTime(timeParts[0]);
      final end = parseTime(timeParts[1]);
      i++;

      final text = lines[i];
      i++;

      entries.add(SubtitleEntry(index, start, end, text));
    }
    return entries;
  }

  Duration parseTime(String timeString) {
    final parts = timeString.split(':');
    final hours = int.parse(parts[0]);
    final minutes = int.parse(parts[1]);
    final secondsParts = parts[2].split(',');
    final seconds = int.parse(secondsParts[0]);
    final milliseconds = int.parse(secondsParts[1]);
    return Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
    );
  }

  bool isEmpty() {
    return _entries.isEmpty;
  }
}

class SubtitleEntry {
  final int index;
  final Duration start;
  final Duration end;
  final String text;

  SubtitleEntry(this.index, this.start, this.end, this.text);
}

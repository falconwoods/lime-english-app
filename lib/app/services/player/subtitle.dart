import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

class Subtitle {
  late List<SubtitleEntry> _entries;

  Future<Subtitle> loadFromFile(String filePath) async {
    final file = File(filePath);
    final lines = await file.readAsLines();
    _entries = parseEntries(lines);
    return this;
  }

  SubtitleEntry getSubtitle(Duration duration) {
    SubtitleEntry? matchingEntry;

    for (int i = 0; i < _entries.length; i++) {
      if (duration >= _entries[i].start && duration <= _entries[i].end) {
        matchingEntry = _entries[i];
        break;
      } else if (duration < _entries[i].start) {
        matchingEntry = i > 0 ? _entries[i - 1] : _entries[0];
        break;
      }
    }

    return matchingEntry ?? SubtitleEntry(1, Duration.zero, Duration.zero, '');
  }

  SubtitleEntry getPreLine(Duration duration) {
    SubtitleEntry se = getSubtitle(duration);
    return getLine(se.sequence - 1);
  }

  SubtitleEntry getNextLine(Duration duration) {
    SubtitleEntry se = getSubtitle(duration);
    return getLine(se.sequence + 1);
  }

  // String getSubtitle(Duration duration) {
  //   final matchingEntry = _entries.firstWhere(
  //     (entry) => entry.start <= duration && entry.end >= duration,
  //     orElse: () => SubtitleEntry(0, Duration.zero, Duration.zero, ''),
  //   );
  //   return matchingEntry.text;
  // }

  SubtitleEntry getLine(int sequence) {
    int index = sequence - 1;
    index = index.clamp(0, _entries.length - 1);
    return _entries[index];
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

  int get length {
    return _entries.length;
  }
}

class SubtitleEntry {
  /// start from 1
  final int sequence;
  final Duration start;
  final Duration end;
  final String text;

  SubtitleEntry(this.sequence, this.start, this.end, this.text);
}

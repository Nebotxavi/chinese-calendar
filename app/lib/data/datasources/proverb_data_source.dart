import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'package:feng_shui_calendar/domain/proverb.dart';

class ProverbDataSource {
  List<Proverb>? _cachedProverbs;

  static const _assetPath = 'assets/data/proverbs.min.json';

  Future<List<Proverb>> loadProverbs() async {
    if (_cachedProverbs != null) {
      return _cachedProverbs!;
    }

    final jsonString = await rootBundle.loadString(_assetPath);
    final jsonList = json.decode(jsonString) as List<dynamic>;
    _cachedProverbs = jsonList
        .map((e) => Proverb.fromJson(e as Map<String, dynamic>))
        .toList();
    return _cachedProverbs!;
  }
}

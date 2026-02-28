import 'package:feng_shui_calendar/data/datasources/proverb_data_source.dart';
import 'package:feng_shui_calendar/data/repositories/proverb_repository.dart';
import 'package:feng_shui_calendar/domain/proverb.dart';

class ProverbRepositoryImpl implements ProverbRepository {
  final ProverbDataSource _dataSource;

  /// Cached lookup: "2026-03-15" → Proverb
  Map<String, Proverb>? _dateIndex;
  List<Proverb>? _allProverbs;

  ProverbRepositoryImpl(this._dataSource);

  @override
  Future<List<Proverb>> getAllProverbs() async {
    _allProverbs ??= await _dataSource.loadProverbs();
    return _allProverbs!;
  }

  @override
  Future<Proverb> getProverbForDate(DateTime date) async {
    final index = await _getDateIndex();
    final key = _dateKey(date);

    final proverb = index[key];
    if (proverb != null) {
      return proverb;
    }

    // Fallback: if date has no assigned proverb, use modulo on day-of-year
    final proverbs = await getAllProverbs();
    final dayOfYear = date.difference(DateTime(date.year, 1, 1)).inDays;
    return proverbs[dayOfYear % proverbs.length];
  }

  Future<Map<String, Proverb>> _getDateIndex() async {
    if (_dateIndex != null) {
      return _dateIndex!;
    }

    final proverbs = await getAllProverbs();
    _dateIndex = {};
    for (final p in proverbs) {
      if (p.assignedDate.isNotEmpty) {
        _dateIndex![p.assignedDate] = p;
      }
    }
    return _dateIndex!;
  }

  /// Formats date as "2026-03-15" to match assignedDate in JSON.
  String _dateKey(DateTime date) {
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '${date.year}-$m-$d';
  }
}

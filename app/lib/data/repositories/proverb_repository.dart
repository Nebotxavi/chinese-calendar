import 'package:feng_shui_calendar/domain/proverb.dart';

abstract class ProverbRepository {
  Future<Proverb> getProverbForDate(DateTime date);
  Future<List<Proverb>> getAllProverbs();
}

import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_zindan_ustasi/oyun_zindan_ustasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(zindanUstasiConfig.title.length, 33);
    expect(zindanUstasiConfig.tagline.length, 33);
    for (final s in zindanUstasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(zindanUstasiConfig.gameId, zindanUstasiId);
    expect(zindanUstasiRules.gameId, zindanUstasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(zindanUstasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: zindanUstasiId, optionalMechanics: zindanUstasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(zindanUstasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}

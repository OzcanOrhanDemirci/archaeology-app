import 'package:flutter_test/flutter_test.dart';

import 'package:archaeology_app/core/utils.dart';

void main() {
  group('selectTimelineIndex', () {
    test('selects the last block above the viewport center', () {
      final tops = [100.0, 300.0, 500.0, 700.0];
      expect(selectTimelineIndex(tops, 350), 1);
      expect(selectTimelineIndex(tops, 100), 0);
      expect(selectTimelineIndex(tops, 50), 0);
      expect(selectTimelineIndex(tops, 900), 3);
    });

    test('skips entries without a block (infinite tops)', () {
      final tops = [100.0, double.infinity, 500.0];
      expect(selectTimelineIndex(tops, 300), 0);
      expect(selectTimelineIndex(tops, 600), 2);
    });

    test('falls back to the first entry for empty input', () {
      expect(selectTimelineIndex([], 300), 0);
    });
  });
}

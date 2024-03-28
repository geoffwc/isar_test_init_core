@TestOn('vm')
import 'dart:io';

import 'package:isar/isar.dart';
import 'package:test/test.dart';

import 'test_entity.dart';

void main() {
  late Isar isar;
  group('Initialize Core', () {
    setUp(() async {
      final dir = await Directory.systemTemp.createTemp('test_isar');
      await Isar.initializeIsarCore(download: true);
      isar = await Isar.open([TestEntitySchema], directory: dir.path);
    });

    tearDown(() => isar.close(deleteFromDisk: true));

    test('download enabled works', () async {
      final count = await isar.testEntitys.count();

      expect(isar, isNotNull);
      expect(count, 0);
    });
  });
}

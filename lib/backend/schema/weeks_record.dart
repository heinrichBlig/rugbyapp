import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'weeks_record.g.dart';

abstract class WeeksRecord implements Built<WeeksRecord, WeeksRecordBuilder> {
  static Serializer<WeeksRecord> get serializer => _$weeksRecordSerializer;

  @nullable
  String get backgroundimg;

  @nullable
  String get description;

  @nullable
  String get difficulty;

  @nullable
  String get headinga;

  @nullable
  bool get locked;

  @nullable
  String get weekname;

  @nullable
  DocumentReference get program;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(WeeksRecordBuilder builder) => builder
    ..backgroundimg = ''
    ..description = ''
    ..difficulty = ''
    ..headinga = ''
    ..locked = false
    ..weekname = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('weeks');

  static Stream<WeeksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  WeeksRecord._();
  factory WeeksRecord([void Function(WeeksRecordBuilder) updates]) =
      _$WeeksRecord;
}

Map<String, dynamic> createWeeksRecordData({
  String backgroundimg,
  String description,
  String difficulty,
  String headinga,
  bool locked,
  String weekname,
  DocumentReference program,
}) =>
    serializers.serializeWith(
        WeeksRecord.serializer,
        WeeksRecord((w) => w
          ..backgroundimg = backgroundimg
          ..description = description
          ..difficulty = difficulty
          ..headinga = headinga
          ..locked = locked
          ..weekname = weekname
          ..program = program));

WeeksRecord get dummyWeeksRecord {
  final builder = WeeksRecordBuilder()
    ..backgroundimg = dummyImagePath
    ..description = dummyString
    ..difficulty = dummyString
    ..headinga = dummyString
    ..locked = dummyBoolean
    ..weekname = dummyString;
  return builder.build();
}

List<WeeksRecord> createDummyWeeksRecord({int count}) =>
    List.generate(count, (_) => dummyWeeksRecord);

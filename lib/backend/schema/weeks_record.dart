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
  bool get locked;

  @nullable
  @BuiltValueField(wireName: 'program_name')
  DocumentReference get programName;

  @nullable
  @BuiltValueField(wireName: 'week_name')
  String get weekName;

  @nullable
  @BuiltValueField(wireName: 'heading_top')
  String get headingTop;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(WeeksRecordBuilder builder) => builder
    ..backgroundimg = ''
    ..description = ''
    ..difficulty = ''
    ..locked = false
    ..weekName = ''
    ..headingTop = '';

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
  bool locked,
  DocumentReference programName,
  String weekName,
  String headingTop,
}) =>
    serializers.serializeWith(
        WeeksRecord.serializer,
        WeeksRecord((w) => w
          ..backgroundimg = backgroundimg
          ..description = description
          ..difficulty = difficulty
          ..locked = locked
          ..programName = programName
          ..weekName = weekName
          ..headingTop = headingTop));

WeeksRecord get dummyWeeksRecord {
  final builder = WeeksRecordBuilder()
    ..backgroundimg = dummyImagePath
    ..description = dummyString
    ..difficulty = dummyString
    ..locked = dummyBoolean
    ..weekName = dummyString
    ..headingTop = dummyString;
  return builder.build();
}

List<WeeksRecord> createDummyWeeksRecord({int count}) =>
    List.generate(count, (_) => dummyWeeksRecord);

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'program_record.g.dart';

abstract class ProgramRecord
    implements Built<ProgramRecord, ProgramRecordBuilder> {
  static Serializer<ProgramRecord> get serializer => _$programRecordSerializer;

  @nullable
  String get programname;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProgramRecordBuilder builder) =>
      builder..programname = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('program');

  static Stream<ProgramRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProgramRecord._();
  factory ProgramRecord([void Function(ProgramRecordBuilder) updates]) =
      _$ProgramRecord;
}

Map<String, dynamic> createProgramRecordData({
  String programname,
}) =>
    serializers.serializeWith(ProgramRecord.serializer,
        ProgramRecord((p) => p..programname = programname));

ProgramRecord get dummyProgramRecord {
  final builder = ProgramRecordBuilder()..programname = dummyString;
  return builder.build();
}

List<ProgramRecord> createDummyProgramRecord({int count}) =>
    List.generate(count, (_) => dummyProgramRecord);

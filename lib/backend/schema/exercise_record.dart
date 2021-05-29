import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'exercise_record.g.dart';

abstract class ExerciseRecord
    implements Built<ExerciseRecord, ExerciseRecordBuilder> {
  static Serializer<ExerciseRecord> get serializer =>
      _$exerciseRecordSerializer;

  @nullable
  int get reps;

  @nullable
  int get rest;

  @nullable
  int get set;

  @nullable
  @BuiltValueField(wireName: 'video_path')
  String get videoPath;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ExerciseRecordBuilder builder) => builder
    ..reps = 0
    ..rest = 0
    ..set = 0
    ..videoPath = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exercise');

  static Stream<ExerciseRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ExerciseRecord._();
  factory ExerciseRecord([void Function(ExerciseRecordBuilder) updates]) =
      _$ExerciseRecord;
}

Map<String, dynamic> createExerciseRecordData({
  int reps,
  int rest,
  int set,
  String videoPath,
}) =>
    serializers.serializeWith(
        ExerciseRecord.serializer,
        ExerciseRecord((e) => e
          ..reps = reps
          ..rest = rest
          ..set = set
          ..videoPath = videoPath));

ExerciseRecord get dummyExerciseRecord {
  final builder = ExerciseRecordBuilder()
    ..reps = dummyInteger
    ..rest = dummyInteger
    ..set = dummyInteger
    ..videoPath = dummyVideoPath;
  return builder.build();
}

List<ExerciseRecord> createDummyExerciseRecord({int count}) =>
    List.generate(count, (_) => dummyExerciseRecord);

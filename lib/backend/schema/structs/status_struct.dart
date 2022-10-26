import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'status_struct.g.dart';

abstract class StatusStruct
    implements Built<StatusStruct, StatusStructBuilder> {
  static Serializer<StatusStruct> get serializer => _$statusStructSerializer;

  int? get submitted;

  int? get pending;

  int? get completed;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(StatusStructBuilder builder) => builder
    ..submitted = 0
    ..pending = 0
    ..completed = 0
    ..firestoreUtilData = FirestoreUtilData();

  StatusStruct._();
  factory StatusStruct([void Function(StatusStructBuilder) updates]) =
      _$StatusStruct;
}

StatusStruct createStatusStruct({
  int? submitted,
  int? pending,
  int? completed,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatusStruct(
      (s) => s
        ..submitted = submitted
        ..pending = pending
        ..completed = completed
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

StatusStruct? updateStatusStruct(
  StatusStruct? status, {
  bool clearUnsetFields = true,
}) =>
    status != null
        ? (status.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addStatusStructData(
  Map<String, dynamic> firestoreData,
  StatusStruct? status,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (status == null) {
    return;
  }
  if (status.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && status.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statusData = getStatusFirestoreData(status, forFieldValue);
  final nestedData = statusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = status.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getStatusFirestoreData(
  StatusStruct? status, [
  bool forFieldValue = false,
]) {
  if (status == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(StatusStruct.serializer, status);

  // Add any Firestore field values
  status.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatusListFirestoreData(
  List<StatusStruct>? statuss,
) =>
    statuss?.map((s) => getStatusFirestoreData(s, true)).toList() ?? [];

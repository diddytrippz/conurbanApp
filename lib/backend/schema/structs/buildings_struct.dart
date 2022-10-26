import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'buildings_struct.g.dart';

abstract class BuildingsStruct
    implements Built<BuildingsStruct, BuildingsStructBuilder> {
  static Serializer<BuildingsStruct> get serializer =>
      _$buildingsStructSerializer;

  int? get jorissen49;

  int? get ymca;

  int? get rennieHouse;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(BuildingsStructBuilder builder) => builder
    ..jorissen49 = 0
    ..ymca = 0
    ..rennieHouse = 0
    ..firestoreUtilData = FirestoreUtilData();

  BuildingsStruct._();
  factory BuildingsStruct([void Function(BuildingsStructBuilder) updates]) =
      _$BuildingsStruct;
}

BuildingsStruct createBuildingsStruct({
  int? jorissen49,
  int? ymca,
  int? rennieHouse,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BuildingsStruct(
      (b) => b
        ..jorissen49 = jorissen49
        ..ymca = ymca
        ..rennieHouse = rennieHouse
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

BuildingsStruct? updateBuildingsStruct(
  BuildingsStruct? buildings, {
  bool clearUnsetFields = true,
}) =>
    buildings != null
        ? (buildings.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addBuildingsStructData(
  Map<String, dynamic> firestoreData,
  BuildingsStruct? buildings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (buildings == null) {
    return;
  }
  if (buildings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && buildings.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final buildingsData = getBuildingsFirestoreData(buildings, forFieldValue);
  final nestedData = buildingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = buildings.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getBuildingsFirestoreData(
  BuildingsStruct? buildings, [
  bool forFieldValue = false,
]) {
  if (buildings == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(BuildingsStruct.serializer, buildings);

  // Add any Firestore field values
  buildings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBuildingsListFirestoreData(
  List<BuildingsStruct>? buildingss,
) =>
    buildingss?.map((b) => getBuildingsFirestoreData(b, true)).toList() ?? [];

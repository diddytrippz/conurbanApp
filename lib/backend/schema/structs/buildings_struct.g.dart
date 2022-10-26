// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buildings_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuildingsStruct> _$buildingsStructSerializer =
    new _$BuildingsStructSerializer();

class _$BuildingsStructSerializer
    implements StructuredSerializer<BuildingsStruct> {
  @override
  final Iterable<Type> types = const [BuildingsStruct, _$BuildingsStruct];
  @override
  final String wireName = 'BuildingsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuildingsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.jorissen49;
    if (value != null) {
      result
        ..add('jorissen49')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ymca;
    if (value != null) {
      result
        ..add('ymca')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rennieHouse;
    if (value != null) {
      result
        ..add('rennieHouse')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  BuildingsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuildingsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'jorissen49':
          result.jorissen49 = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ymca':
          result.ymca = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'rennieHouse':
          result.rennieHouse = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$BuildingsStruct extends BuildingsStruct {
  @override
  final int? jorissen49;
  @override
  final int? ymca;
  @override
  final int? rennieHouse;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$BuildingsStruct([void Function(BuildingsStructBuilder)? updates]) =>
      (new BuildingsStructBuilder()..update(updates))._build();

  _$BuildingsStruct._(
      {this.jorissen49,
      this.ymca,
      this.rennieHouse,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'BuildingsStruct', 'firestoreUtilData');
  }

  @override
  BuildingsStruct rebuild(void Function(BuildingsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuildingsStructBuilder toBuilder() =>
      new BuildingsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuildingsStruct &&
        jorissen49 == other.jorissen49 &&
        ymca == other.ymca &&
        rennieHouse == other.rennieHouse &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, jorissen49.hashCode), ymca.hashCode),
            rennieHouse.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BuildingsStruct')
          ..add('jorissen49', jorissen49)
          ..add('ymca', ymca)
          ..add('rennieHouse', rennieHouse)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class BuildingsStructBuilder
    implements Builder<BuildingsStruct, BuildingsStructBuilder> {
  _$BuildingsStruct? _$v;

  int? _jorissen49;
  int? get jorissen49 => _$this._jorissen49;
  set jorissen49(int? jorissen49) => _$this._jorissen49 = jorissen49;

  int? _ymca;
  int? get ymca => _$this._ymca;
  set ymca(int? ymca) => _$this._ymca = ymca;

  int? _rennieHouse;
  int? get rennieHouse => _$this._rennieHouse;
  set rennieHouse(int? rennieHouse) => _$this._rennieHouse = rennieHouse;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  BuildingsStructBuilder() {
    BuildingsStruct._initializeBuilder(this);
  }

  BuildingsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jorissen49 = $v.jorissen49;
      _ymca = $v.ymca;
      _rennieHouse = $v.rennieHouse;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuildingsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BuildingsStruct;
  }

  @override
  void update(void Function(BuildingsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BuildingsStruct build() => _build();

  _$BuildingsStruct _build() {
    final _$result = _$v ??
        new _$BuildingsStruct._(
            jorissen49: jorissen49,
            ymca: ymca,
            rennieHouse: rennieHouse,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'BuildingsStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

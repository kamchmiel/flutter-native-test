// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cat _$CatFromJson(Map<String, dynamic> json) {
  return _Cat.fromJson(json);
}

/// @nodoc
class _$CatTearOff {
  const _$CatTearOff();

  _Cat call({required String name, required int age, required String color}) {
    return _Cat(
      name: name,
      age: age,
      color: color,
    );
  }

  Cat fromJson(Map<String, Object?> json) {
    return Cat.fromJson(json);
  }
}

/// @nodoc
const $Cat = _$CatTearOff();

/// @nodoc
mixin _$Cat {
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatCopyWith<Cat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatCopyWith<$Res> {
  factory $CatCopyWith(Cat value, $Res Function(Cat) then) =
      _$CatCopyWithImpl<$Res>;
  $Res call({String name, int age, String color});
}

/// @nodoc
class _$CatCopyWithImpl<$Res> implements $CatCopyWith<$Res> {
  _$CatCopyWithImpl(this._value, this._then);

  final Cat _value;
  // ignore: unused_field
  final $Res Function(Cat) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? age = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CatCopyWith<$Res> implements $CatCopyWith<$Res> {
  factory _$CatCopyWith(_Cat value, $Res Function(_Cat) then) =
      __$CatCopyWithImpl<$Res>;
  @override
  $Res call({String name, int age, String color});
}

/// @nodoc
class __$CatCopyWithImpl<$Res> extends _$CatCopyWithImpl<$Res>
    implements _$CatCopyWith<$Res> {
  __$CatCopyWithImpl(_Cat _value, $Res Function(_Cat) _then)
      : super(_value, (v) => _then(v as _Cat));

  @override
  _Cat get _value => super._value as _Cat;

  @override
  $Res call({
    Object? name = freezed,
    Object? age = freezed,
    Object? color = freezed,
  }) {
    return _then(_Cat(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cat implements _Cat {
  const _$_Cat({required this.name, required this.age, required this.color});

  factory _$_Cat.fromJson(Map<String, dynamic> json) => _$$_CatFromJson(json);

  @override
  final String name;
  @override
  final int age;
  @override
  final String color;

  @override
  String toString() {
    return 'Cat(name: $name, age: $age, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Cat &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$CatCopyWith<_Cat> get copyWith =>
      __$CatCopyWithImpl<_Cat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CatToJson(this);
  }
}

abstract class _Cat implements Cat {
  const factory _Cat(
      {required String name, required int age, required String color}) = _$_Cat;

  factory _Cat.fromJson(Map<String, dynamic> json) = _$_Cat.fromJson;

  @override
  String get name;
  @override
  int get age;
  @override
  String get color;
  @override
  @JsonKey(ignore: true)
  _$CatCopyWith<_Cat> get copyWith => throw _privateConstructorUsedError;
}

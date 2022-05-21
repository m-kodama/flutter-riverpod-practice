// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'friend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Friend _$FriendFromJson(Map<String, dynamic> json) {
  return _Friend.fromJson(json);
}

/// @nodoc
mixin _$Friend {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  bool get hasChild => throw _privateConstructorUsedError;
  List<Friend> get friends => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendCopyWith<Friend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res>;
  $Res call(
      {String id, String name, int? age, bool hasChild, List<Friend> friends});
}

/// @nodoc
class _$FriendCopyWithImpl<$Res> implements $FriendCopyWith<$Res> {
  _$FriendCopyWithImpl(this._value, this._then);

  final Friend _value;
  // ignore: unused_field
  final $Res Function(Friend) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? hasChild = freezed,
    Object? friends = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      hasChild: hasChild == freezed
          ? _value.hasChild
          : hasChild // ignore: cast_nullable_to_non_nullable
              as bool,
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Friend>,
    ));
  }
}

/// @nodoc
abstract class _$$_FriendCopyWith<$Res> implements $FriendCopyWith<$Res> {
  factory _$$_FriendCopyWith(_$_Friend value, $Res Function(_$_Friend) then) =
      __$$_FriendCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String name, int? age, bool hasChild, List<Friend> friends});
}

/// @nodoc
class __$$_FriendCopyWithImpl<$Res> extends _$FriendCopyWithImpl<$Res>
    implements _$$_FriendCopyWith<$Res> {
  __$$_FriendCopyWithImpl(_$_Friend _value, $Res Function(_$_Friend) _then)
      : super(_value, (v) => _then(v as _$_Friend));

  @override
  _$_Friend get _value => super._value as _$_Friend;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? hasChild = freezed,
    Object? friends = freezed,
  }) {
    return _then(_$_Friend(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      hasChild: hasChild == freezed
          ? _value.hasChild
          : hasChild // ignore: cast_nullable_to_non_nullable
              as bool,
      friends: friends == freezed
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Friend>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Friend extends _Friend with DiagnosticableTreeMixin {
  const _$_Friend(this.id,
      {required this.name,
      this.age,
      this.hasChild = false,
      final List<Friend> friends = const <Friend>[]})
      : _friends = friends,
        super._();

  factory _$_Friend.fromJson(Map<String, dynamic> json) =>
      _$$_FriendFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int? age;
  @override
  @JsonKey()
  final bool hasChild;
  final List<Friend> _friends;
  @override
  @JsonKey()
  List<Friend> get friends {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Friend(id: $id, name: $name, age: $age, hasChild: $hasChild, friends: $friends)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Friend'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('hasChild', hasChild))
      ..add(DiagnosticsProperty('friends', friends));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Friend &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.hasChild, hasChild) &&
            const DeepCollectionEquality().equals(other._friends, _friends));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(hasChild),
      const DeepCollectionEquality().hash(_friends));

  @JsonKey(ignore: true)
  @override
  _$$_FriendCopyWith<_$_Friend> get copyWith =>
      __$$_FriendCopyWithImpl<_$_Friend>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FriendToJson(this);
  }
}

abstract class _Friend extends Friend {
  const factory _Friend(final String id,
      {required final String name,
      final int? age,
      final bool hasChild,
      final List<Friend> friends}) = _$_Friend;
  const _Friend._() : super._();

  factory _Friend.fromJson(Map<String, dynamic> json) = _$_Friend.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int? get age => throw _privateConstructorUsedError;
  @override
  bool get hasChild => throw _privateConstructorUsedError;
  @override
  List<Friend> get friends => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FriendCopyWith<_$_Friend> get copyWith =>
      throw _privateConstructorUsedError;
}

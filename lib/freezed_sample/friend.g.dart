// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Friend _$$_FriendFromJson(Map<String, dynamic> json) => _$_Friend(
      json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int?,
      hasChild: json['hasChild'] as bool? ?? false,
      friends: (json['friends'] as List<dynamic>?)
              ?.map((e) => Friend.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Friend>[],
    );

Map<String, dynamic> _$$_FriendToJson(_$_Friend instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'hasChild': instance.hasChild,
      'friends': instance.friends,
    };

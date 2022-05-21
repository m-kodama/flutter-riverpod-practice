import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'friend.freezed.dart';

/// JSONと相互変換する場合追加する
part 'friend.g.dart';

@freezed
class Friend with _$Friend {
  /// メソッド、カスタムゲッター、カスタムフィールドを使いたい場合は
  /// 以下のようにプライベートコンストラクタを追加する必要がある
  /// ※late を使う場合は const をつけられない
  Friend._();

  /// フィールド定義
  const factory Friend(
    String id, {
    required String name,
    int? age,
    @Default(false) bool hasChild,
    @Default(<Friend>[]) List<Friend> friends,
  }) = _Friend;

  /// JSONと相互変換する場合
  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);

  /// メソッド
  void greetWithName() {
    debugPrint('Hello, My name is $name');
  }

  /// lateフィールド
  late final friendsHasChild = friends.where((f) => f.hasChild).toList();

  /// getter
  bool get hasFriends => friends.isNotEmpty;
}

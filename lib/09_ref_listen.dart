import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ref.listen
///
/// Providerの監視とハンドリングが可能

final counterProvider = StateProvider((_) => 0);

class RefListenPage extends ConsumerWidget {
  const RefListenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Providerを購読する
    ref.listen<int>(
      counterProvider,
      (previous, next) {
        // 値を監視して処理を仕込める
        if (next.isEven) {
          return;
        }
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('カウントが奇数です'),
            );
          },
        );
      },
      // `onError` で何らかのエラーハンドリングが可能（任意）
      onError: (error, stackTrace) => debugPrint('$error'),
    );

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('${ref.watch(counterProvider)}'),
          onPressed: () {
            ref.read(counterProvider.notifier).update((state) => state + 1);
          },
        ),
      ),
    );
  }
}

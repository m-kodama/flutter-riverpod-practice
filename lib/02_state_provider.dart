import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StateProvider
///
/// 外部から変更可能な値を公開できるProvider
final counterProvider = StateProvider((_) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// watchでProviderを読み取る
    /// .notifier をつけると StateController が取得できる
    /// 何もつけなければ state(=値) が取得できる
    final counter = ref.watch(counterProvider.notifier);
    final count = ref.watch(counterProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('StateProvider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(count.toString()),
              ElevatedButton(
                child: const Text('+1'),
                onPressed: () {
                  counter.update((state) => state + 1);
                },
              ),
            ],
          ),
        ));
  }
}

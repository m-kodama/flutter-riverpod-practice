import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

/// Select
///
/// 特定の条件または
/// 特定のプロパティに変更があったときだけリビルドすることが可能

final counterProvider = StateProvider((_) => 0);

class SelectPage extends ConsumerWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('リビルドConsumerPage');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Consumer'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer(builder: (context, ref, child) {
                final isCount10Over =
                    ref.watch(counterProvider.select((s) => s > 10));
                debugPrint('リビルドConsumer: $isCount10Over');
                return Text(isCount10Over ? '10超えた' : '10以下');
              }),
              ElevatedButton(
                child: const Text('+1'),
                onPressed: () {
                  final counter = ref.read(counterProvider.notifier);
                  counter.update((state) => state + 1);
                },
              ),
            ],
          ),
        ));
  }
}

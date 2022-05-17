import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

/// Consumer
///
/// Consumerで囲んだ範囲のみリビルドされるようになる

final counterProvider = StateProvider((_) => 0);

class ConsumerPage extends ConsumerWidget {
  const ConsumerPage({Key? key}) : super(key: key);

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
                final count = ref.watch(counterProvider);
                debugPrint('リビルドConsumer: $count');
                return Text(count.toString());
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ChangeNotifierProvider
///
/// ChangeNotifier（Flutter SDKにあるやつ) のProvider
final counterProvider = ChangeNotifierProvider((_) => Counter());

class Counter extends ChangeNotifier {
  int count = 0;

  void increase() {
    count++;
    notifyListeners();
  }
}

class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      body: Center(
        child: OutlinedButton(
          child: Text('${counter.count}'),
          onPressed: () {
            counter.increase();
          },
        ),
      ),
    );
  }
}

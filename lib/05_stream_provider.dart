import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/04_future_privider.dart';

/// StreamProvider
///
/// StreamProvider = Provider + StreamBuilder
/// 単一のStreamな値を公開できるProvider
///
/// FirestoreやWebソケット、リソースを消費するものをListen（購読）する時は
/// StreamProvider.autoDisposeを使用することでリソースの自動解放が可能
final dummyValueStreamProvider = StreamProvider<int>((ref) {
  final stream = generateStream();
  return stream;
});

Stream<int> generateStream() {
  return Stream.fromFutures([
    dummyAsyncFunc(5),
    dummyAsyncFunc(4),
    dummyAsyncFunc(3),
    dummyAsyncFunc(2),
    dummyAsyncFunc(1),
  ]);
}

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// AsyncValue<T>型で受け取る
    final value = ref.watch(dummyValueStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider'),
      ),
      body: Center(
        child: value.when(
          data: (v) => Text('値: $v'),
          error: (error, stack) => Text('エラー: $error'),
          loading: () => const Text('loading...'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/13/home_screen_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeScreenState = ref.watch(homeScreenNotifierProvider);
    final homeScreenNotifier = ref.watch(homeScreenNotifierProvider.notifier);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: homeScreenNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
      appBar: AppBar(
        title: const Text('カウンター'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Mainカウント: ${homeScreenState.mainCount}'),
            onTap: homeScreenNotifier.increaseMainCount,
          ),
          ListTile(
            title: Text('Subカウント: ${homeScreenState.subCount}'),
            onTap: homeScreenNotifier.increaseSubCount,
          ),
        ],
      ),
    );
  }
}

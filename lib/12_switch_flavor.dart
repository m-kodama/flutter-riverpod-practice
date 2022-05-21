import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providerとoverridesを使ってflavorをアプリ内で使用する

enum Flavor {
  development,
  staging,
  production,
}

extension FlavorX on Flavor {
  String get name => describeEnum(this);

  static Flavor from(String name) =>
      Flavor.values.firstWhere((flavor) => name == flavor.name);
}

final flavorProvider = Provider<Flavor>((ref) => throw UnimplementedError());

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const flavorString = String.fromEnvironment('FLAVOR');
  final flavor = FlavorX.from(flavorString);
  debugPrint(flavor.name);

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final flavor = ref.watch(flavorProvider);
              return Text(flavor.name);
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/10_shared_preferences_with_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// StateNotifierを使ってThemeを保存・変更するサンプル

/// そのままアクセスすると例外を投げるProviderを作成する
final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      overrides: [
        /// ここで上書きする
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

const _themePrefsKey = 'selectedThemeKey';

class ThemeSelector extends StateNotifier<ThemeMode> {
  ThemeSelector(this._read) : super(ThemeMode.system) {
    final themeIndex = _prefs.getInt(_themePrefsKey);
    if (themeIndex == null) {
      return;
    }
    final themeMode = ThemeMode.values.firstWhere(
      (element) => element.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
  }

  final Reader _read;

  late final _prefs = _read(sharedPreferencesProvider);

  Future<void> changeAndSave(ThemeMode theme) async {
    await _prefs.setInt(_themePrefsKey, theme.index);
    state = theme;
  }
}

final themeSelectorProvider = StateNotifierProvider<ThemeSelector, ThemeMode>(
  (ref) => ThemeSelector(ref.read),
);

final myLightThemeData = ThemeData.from(
  colorScheme: const ColorScheme.light().copyWith(
    primary: const Color(0xFFF0BC1B),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
  ),
  textTheme: const TextTheme(
    button: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
  ),
).copyWith(
  scaffoldBackgroundColor: const Color(0xFFF6F3F0),
  appBarTheme: const AppBarTheme(color: Color(0xFFEEEAE1)),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 2,
  ),
);

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'MY APP',
      theme: myLightThemeData,
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(themeSelectorProvider),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Theme Sample'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final themeSelector = ref.watch(themeSelectorProvider.notifier);
          final currentThemeMode = ref.watch(themeSelectorProvider);

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: ThemeMode.values.length,
            itemBuilder: (context, index) {
              final themeMode = ThemeMode.values[index];
              return RadioListTile<ThemeMode>(
                value: themeMode,
                groupValue: currentThemeMode,
                onChanged: (newValue) {
                  themeSelector.changeAndSave(newValue!);
                },
                title: Text(describeEnum(themeMode)),
              );
            },
          );
        },
      ),
    );
  }
}

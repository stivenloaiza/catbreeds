import 'package:catbreeds/providers/home_provider.dart';
import 'package:catbreeds/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config.dart' as cg;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CatBreeds',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        colorScheme: ColorScheme.fromSeed(seedColor: cg.cBackgrounds),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

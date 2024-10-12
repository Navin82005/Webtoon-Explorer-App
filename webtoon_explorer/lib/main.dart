import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:webtoon_explorer/model/manga.dart';
import 'package:webtoon_explorer/view/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // await Hive.deleteFromDisk();
  Hive.registerAdapter(MangaAdapter());
  Hive.registerAdapter(MangaCharacterAdapter());

  await Hive.openBox<Manga>("favorites");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Layout(),
    );
  }
}

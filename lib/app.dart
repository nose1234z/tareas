// lib/app.dart

import 'package:flutter/material.dart';

import 'backdrop.dart';
import 'model/product.dart';
import 'home.dart';
import 'login.dart';
import 'category_menu_page.dart';

// El widget principal
class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  _ShrineAppState createState() => _ShrineAppState();
}

// La clase de estado que pertenece a ShrineApp
class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    if (_currentCategory != category) {
      setState(() {
        _currentCategory = category;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: HomePage(category: _currentCategory),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: const Text('SHRINE'),
        backTitle: const Text('MENU'),
      ),
      onGenerateRoute: _getRoute,
      theme: ThemeData.light(useMaterial3: true),
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LoginPage(),
      fullscreenDialog: true,
    );
  }
}

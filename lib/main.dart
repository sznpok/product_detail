import 'package:flutter/material.dart';
import 'package:product_detail_app/services/notifcation_services.dart';

import 'module/view/product_detail_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationServices.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Product Detail',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductDetailView());
  }
}

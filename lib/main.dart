import 'package:flutter/material.dart';

// Pages
import 'package:queue/pages/splash_page.dart';
import 'package:queue/pages/add_page.dart';
import 'package:queue/pages/queue_page.dart';

// Provider
import 'package:provider/provider.dart';

// Class Provider
import 'package:queue/providers/queue_provider.dart';

void main() {
  runApp(const QueueApp());
}

class QueueApp extends StatelessWidget {
  const QueueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QueueProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/add': (context) => AddPage(),
          '/queue': (context) => QueuePage(),
        },
      ),
    );
  }
}

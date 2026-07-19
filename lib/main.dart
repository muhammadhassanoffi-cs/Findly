
// import 'package:fasthub/providers/post_provider.dart';
// import 'package:fasthub/screen/Confirmnewpassword/confirmpassword.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:fasthub/providers/setting_provider.dart';
// import 'package:fasthub/screen/Mian/MAINSCREEN%20CLASS.dart';
// import 'package:fasthub/screen/login/login.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:app_links/app_links.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Supabase.initialize(
//     url: 'https://qpnpntnsmogctldjnqqz.supabase.co',
//     anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwbnBudG5zbW9nY3RsZGpucXF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQxMTEwMjYsImV4cCI6MjA5OTY4NzAyNn0.S5cRzXF8iQhgqi_y0u9I5MJldOBDKMH12WbXdQzUeW8',
//   );

//   final postprovider = PostProvider();
//   final settingprovider = SettingProvider();
//   await settingprovider.loadSettings();
//   await postprovider.loadPosts();

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider.value(value: settingprovider),
//         ChangeNotifierProvider.value(value: postprovider),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final AppLinks _appLinks = AppLinks();

//   @override
//   void initState() {
//     super.initState();
//     _handleDeepLinks();
//   }

//   void _handleDeepLinks() {
//     _appLinks.uriLinkStream.listen((Uri uri) {
//       print("Deep link received: $uri");

//       if (uri.scheme == 'fasthub' && uri.host == 'reset-password') {
//         navigatorKey.currentState?.push(
//           MaterialPageRoute(
//             builder: (_) => const Confirmpassword(),
//           ),
//         );
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final setting = context.watch<SettingProvider>();

//     return MaterialApp(
//       navigatorKey: navigatorKey,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.blue,
//           brightness: Brightness.light,
//         ),
//       ),
//       darkTheme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.blue,
//           brightness: Brightness.dark,
//         ),
//       ),
//       themeMode: setting.isdarkmode ? ThemeMode.dark : ThemeMode.light,
//       home: setting.islogin ? Mainscreen() : LogInScreen(),
//     );
//   }
// }
import 'dart:async';
import 'package:fasthub/providers/post_provider.dart';
import 'package:fasthub/screen/Confirmnewpassword/confirmpassword.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fasthub/providers/setting_provider.dart';
import 'package:fasthub/screen/Mian/MAINSCREEN%20CLASS.dart';
import 'package:fasthub/screen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_links/app_links.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Supabase.initialize(
      url: 'https://qpnpntnsmogctldjnqqz.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwbnBudG5zbW9nY3RsZGpucXF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODQxMTEwMjYsImV4cCI6MjA5OTY4NzAyNn0.S5cRzXF8iQhgqi_y0u9I5MJldOBDKMH12WbXdQzUeW8',
    );

    final postprovider = PostProvider();
    final settingprovider = SettingProvider();
    await settingprovider.loadSettings();
    await postprovider.loadPosts();

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: settingprovider),
          ChangeNotifierProvider.value(value: postprovider),
        ],
        child: MyApp(),
      ),
    );
  }, (error, stackTrace) {
    // Catches any exception that isn't already caught elsewhere in the app —
    // e.g. Supabase's internal background session/network processes —
    // so it never surfaces as a raw error screen. Just logged, silently.
    print('Uncaught error: $error');
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppLinks _appLinks = AppLinks();

  @override
  void initState() {
    super.initState();
    _handleDeepLinks();
  }
// void _handleDeepLinks() {
//   _appLinks.uriLinkStream.listen((Uri uri) async {
//     print("Deep link received (full): $uri");
//     print("Deep link fragment: ${uri.fragment}");
//     print("Deep link query: ${uri.query}");

//     if (uri.scheme == 'fasthub' && uri.host == 'reset-password') {
//       try {
//         final response = await Supabase.instance.client.auth.getSessionFromUrl(uri);
//         print("Recovery session established: ${response.session}");
//       } catch (e) {
//         print("Session error: $e");
//       }

//       navigatorKey.currentState?.pushAndRemoveUntil(
//         MaterialPageRoute(
//           builder: (_) => const Confirmpassword(),
//         ),
//         (route) => false,
//       );
//     }

//     if (uri.scheme == 'fasthub' && uri.host == 'email-confirmed') {
//       print("Email confirmed via deep link");
//       navigatorKey.currentState?.pushAndRemoveUntil(
//         MaterialPageRoute(builder: (_) => const LogInScreen()),
//         (route) => false,
//       );
//     }
//   });
// }
void _handleDeepLinks() {
  _appLinks.uriLinkStream.listen((Uri uri) async {
    print("Deep link received: $uri");

    if (uri.scheme == 'fasthub' && uri.host == 'reset-password') {
      try {
        await Supabase.instance.client.auth.getSessionFromUrl(uri);
        print("Session established successfully");
        
        // only navigate if session succeeded
        navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const Confirmpassword(),
          ),
          (route) => false,
        );
      } catch (e) {
  print("Session error — not navigating: $e");
  navigatorKey.currentState?.overlay?.context != null
      ? ScaffoldMessenger.of(navigatorKey.currentState!.overlay!.context)
          .showSnackBar(const SnackBar(content: Text("This reset link has expired. Please request a new one.")))
      : null;
}
    }

    if (uri.scheme == 'fasthub' && uri.host == 'email-confirmed') {
      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LogInScreen()),
        (route) => false,
      );
    }
  });
}
  @override
  Widget build(BuildContext context) {
    final setting = context.watch<SettingProvider>();

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: setting.isdarkmode ? ThemeMode.dark : ThemeMode.light,
      home: setting.islogin ? Mainscreen() : LogInScreen(),
    );
  }
}

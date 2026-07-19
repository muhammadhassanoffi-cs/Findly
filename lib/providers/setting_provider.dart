
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// class SettingProvider extends ChangeNotifier {

//   final _supabase = Supabase.instance.client;
//   bool _isDarkMode = false;
//   bool _isLogin = false;

//   String _userName = '';
//   String _userEmail = '';
//   String _userRollno = '';
//   String _department = '';

//   String? _profileImagePath;
//   bool get isdarkmode => _isDarkMode;
//   bool get islogin => _isLogin;

//   String get userName => _userName;
//   String get userEmail => _userEmail;
//   String get department => _department;
//   String get rollNo => _userRollno;

//   String? get profileImagePath => _profileImagePath;
//   // Load saved data
//   Future<void> loadSettings() async {
//     final prefs = await SharedPreferences.getInstance();
//     _department = prefs.getString('department') ?? '';
//     _userEmail = prefs.getString('useremail') ?? '';
//     _userName = prefs.getString('username') ?? '';
//     _userRollno = prefs.getString('userrollno') ?? '';

//     _isDarkMode = prefs.getBool('isdarkmode') ?? false;
//     final session = _supabase.auth.currentSession;
// _isLogin = session != null;
//     if(_userEmail.isNotEmpty){
//       _profileImagePath =
//           prefs.getString('profileImagePath_$_userEmail');
//     }
//     notifyListeners();

//   }
//   // Dark mode
//   Future<void> toggleMood() async {

//     _isDarkMode = !_isDarkMode;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(
//       'isdarkmode',
//       _isDarkMode,
//     );
//     notifyListeners();

//   }
//   // Update profile
//   Future<void> updateProfile({
//     required String name,
//     required String email,
//     String? imagePath,

//   }) async {
//     _userName = name;
//     _userEmail = email;
//     if(imagePath != null){
//       _profileImagePath = imagePath;
//     }
//     final prefs =await SharedPreferences.getInstance();
//     await prefs.setString(
//       'username',
//       name,
//     );
//     await prefs.setString(
//       'useremail',
//       email,
//     );
//     if(imagePath != null){

//       await prefs.setString(
//         'profileImagePath_$email',
//         imagePath,
//       );

//     }
//     notifyListeners();

//   }
//   // LOGIN FUNCTION
//   Future<String?> login(
//     String email,
//     String password,

//   ) async {
//     try{


//       await _supabase.auth.signInWithPassword(

//         email: email,
//         password: password,

//       );
//       final user =_supabase.auth.currentUser;
//       if(user == null){

//         return "Login failed";

//       }

// _userEmail = user.email!;
// _userName = user.userMetadata?['name'] ?? '';
// _isLogin = true;

//       final prefs =
//           await SharedPreferences.getInstance();
//       await prefs.setString(
//         'useremail',
//         _userEmail,
//       );
// await prefs.setString('username', _userName);

//       await prefs.setBool(
//         'islogin',
//         true,
//       );
//       notifyListeners();
//       return null;


//     }
//     on AuthException catch(e){

//       return e.message;

//     }
//     catch(e){

//       return "Something went wrong";

//     }
//   }
//   // SIGNUP FUNCTION
//   Future<String?> signup(

//     String email,
//     String name,
//     String password,

//   ) async {
//     try{
//       final response =await _supabase.auth.signUp(
//         email: email,
//         password: password,
//         data: {

//           'name': name,

//         },

//       );
//       if(response.user == null){

//         return "Signup failed";

//       }
//       return null;


//     }
//     on AuthException catch(e){

//       return e.message;

//     }
//     catch(e){

//       return "Something went wrong";

//     }


//   }
//   // LOGOUT FUNCTION
//   Future<void> logout() async {
//     await _supabase.auth.signOut();
//     _isLogin = false;

//     _profileImagePath = null;

//     _userName = '';

//     _userEmail = '';

//     _userRollno = '';
//     final prefs = await SharedPreferences.getInstance();
//  await prefs.setBool(
//       'islogin',
//       false,
//     );
//     notifyListeners();

//   }



// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class SettingProvider extends ChangeNotifier {

  final _supabase = Supabase.instance.client;
  bool _isDarkMode = false;
  bool _isLogin = false;

  String _userName = '';
  String _userEmail = '';
  String _userRollno = '';
  String _department = '';

  String? _profileImagePath;
  bool get isdarkmode => _isDarkMode;
  bool get islogin => _isLogin;

  String get userName => _userName;
  String get userEmail => _userEmail;
  String get department => _department;
  String get rollNo => _userRollno;

  String? get profileImagePath => _profileImagePath;
  // Load saved data
  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _department = prefs.getString('department') ?? '';
    _userEmail = prefs.getString('useremail') ?? '';
    _userName = prefs.getString('username') ?? '';
    _userRollno = prefs.getString('userrollno') ?? '';

    _isDarkMode = prefs.getBool('isdarkmode') ?? false;
final session = _supabase.auth.currentSession;
if (session != null) {
  try {
    // Try an actual server call — this fails if the account was deleted
    await _supabase.from('users').select().eq('id', session.user.id).maybeSingle();
    _isLogin = true;
  } catch (e) {
    // Account no longer valid on the server — force logout locally
    await _supabase.auth.signOut();
    _isLogin = false;
  }
} else {
  _isLogin = false;
}
    if(_userEmail.isNotEmpty){
      _profileImagePath =
          prefs.getString('profileImagePath_$_userEmail');
    }
    notifyListeners();

    // If there's a real session, refresh with the latest data from Supabase
    // (covers the case where the profile was edited on a different device).
    if (_isLogin) {
      await _loadProfileFromSupabase();
    }
  }

  // Fetch this user's row from the `users` table and populate local fields.
  // If no row exists yet (first login after signup), create a basic one.
  Future<void> _loadProfileFromSupabase() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) return;

      final data = await _supabase
          .from('users')
          .select()
          .eq('id', user.id)
          .maybeSingle();

      if (data == null) {
        // First time — create a starter row so future updates have something to update.
        await _supabase.from('users').insert({
          'id': user.id,
          'email': user.email,
          'name': _userName,
          'roll_no': _userRollno,
          'department': _department,
        });
      } else {
        _userName = data['name'] ?? _userName;
        _userRollno = data['roll_no'] ?? _userRollno;
        _department = data['department'] ?? _department;
        _profileImagePath = data['profile_image_url'] ?? _profileImagePath;

        // Keep the local cache in sync too, so offline/first-load is instant next time.
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', _userName);
        await prefs.setString('userrollno', _userRollno);
        await prefs.setString('department', _department);
        if (_profileImagePath != null) {
          await prefs.setString('profileImagePath_$_userEmail', _profileImagePath!);
        }
      }

      notifyListeners();
    } catch (e) {
      print('Error loading profile from Supabase: $e');
      // Local SharedPreferences values (already loaded) remain as a safe fallback.
    }
  }

  // Dark mode
  Future<void> toggleMood() async {

    _isDarkMode = !_isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
      'isdarkmode',
      _isDarkMode,
    );
    notifyListeners();

  }
  // Update profile
  // imagePath here should already be a Supabase Storage URL (uploaded by the caller),
  // not a local file path — same pattern as CampusPost images.
  Future<void> updateProfile({
    required String name,
    required String email,
    String? imagePath,

  }) async {
    _userName = name;
    _userEmail = email;
    if(imagePath != null){
      _profileImagePath = imagePath;
    }
    final prefs =await SharedPreferences.getInstance();
    await prefs.setString(
      'username',
      name,
    );
    await prefs.setString(
      'useremail',
      email,
    );
    if(imagePath != null){

      await prefs.setString(
        'profileImagePath_$email',
        imagePath,
      );

    }
    notifyListeners();

    // Sync the same data to Supabase so it's visible from any device.
    try {
      final user = _supabase.auth.currentUser;
      if (user != null) {
        await _supabase.from('users').upsert({
          'id': user.id,
          'email': email,
          'name': name,
          'roll_no': _userRollno,
          'department': _department,
          'profile_image_url': imagePath,
        });
      }
    } catch (e) {
      print('Error saving profile to Supabase: $e');
    }

  }
  // LOGIN FUNCTION
  Future<String?> login(
    String email,
    String password,

  ) async {
    try{


      await _supabase.auth.signInWithPassword(

        email: email,
        password: password,

      );
      final user =_supabase.auth.currentUser;
      if(user == null){

        return "Login failed";

      }

_userEmail = user.email!;
_userName = user.userMetadata?['name'] ?? '';
_userRollno = email.length >= 7 ? email.substring(0, 7) : email;
_isLogin = true;

      final prefs =
          await SharedPreferences.getInstance();
      await prefs.setString(
        'useremail',
        _userEmail,
      );
await prefs.setString('username', _userName);
await prefs.setString('userrollno', _userRollno);

      await prefs.setBool(
        'islogin',
        true,
      );
      notifyListeners();

      // Pull the full profile (department, saved roll no, profile picture URL) from Supabase.
      await _loadProfileFromSupabase();

      return null;


    }
    on AuthException catch(e){

      return e.message;

    }
    catch(e){

      final message = e.toString().toLowerCase();
      if (message.contains('socketexception') ||
          message.contains('failed host lookup') ||
          message.contains('clientexception') ||
          message.contains('network')) {
        return "No internet connection. Please check your network and try again.";
      }
      return "Something went wrong";

    }
  }
  // SIGNUP FUNCTION
  Future<String?> signup(

    String email,
    String name,
    String password,

  ) async {
    try{
     final response = await _supabase.auth.signUp(
  email: email,
  password: password,
  data: {
    'name': name,
  },
  emailRedirectTo: 'fasthub://email-confirmed',
);
      if(response.user == null){

        return "Signup failed";

      }
      return null;


    }
    on AuthException catch(e){

      return e.message;

    }
   catch(e){

      final message = e.toString().toLowerCase();
      if (message.contains('socketexception') ||
          message.contains('failed host lookup') ||
          message.contains('clientexception') ||
          message.contains('network')) {
        return "No internet connection. Please check your network and try again.";
      }
      return "Something went wrong";

    }


  }
  // LOGOUT FUNCTION
  Future<void> logout() async {
    await _supabase.auth.signOut();
    _isLogin = false;

    _profileImagePath = null;

    _userName = '';

    _userEmail = '';

    _userRollno = '';
    final prefs = await SharedPreferences.getInstance();
 await prefs.setBool(
      'islogin',
      false,
    );
    notifyListeners();

  }



}
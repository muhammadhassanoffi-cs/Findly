import 'package:fasthub/screen/Createpost/createpost.dart';
import 'package:fasthub/providers/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:fasthub/screen/Myprofile/My_profile.dart';
import 'package:fasthub/screen/feed/feedscreen.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _currentindex=0;

  final List<Widget> _pages=[Feedscreen(),Createpost(),MyProfile()];
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingProvider>();
   final isDark = settings.isdarkmode;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFFAFAFA),
    
      body: _pages[_currentindex],
  

   bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (index){
          setState(() {
            
          _currentindex=index;
          });
        },
         backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
selectedItemColor: isDark ? const Color(0xFF64B5F6) : const Color(0xFF0D1B4C),
unselectedItemColor: isDark ? Colors.white54 : Colors.grey,
        items: [
         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
         BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ]),
    );
  }
}

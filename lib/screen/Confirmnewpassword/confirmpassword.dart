import 'package:fasthub/providers/setting_provider.dart';
import 'package:fasthub/screen/login/login.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class Confirmpassword extends StatefulWidget {
  const Confirmpassword({super.key});

  @override
  State<Confirmpassword> createState() => _ConfirmpasswordState();
}

class _ConfirmpasswordState extends State<Confirmpassword> {
  @override
void initState() {
  super.initState();
  _setupAuthListener();
}

void _setupAuthListener() {
  Supabase.instance.client.auth.onAuthStateChange.listen((data) {
    final event = data.event;
    if (event == AuthChangeEvent.passwordRecovery) {
      // session is now established, user can reset password
      print('Password recovery session established');
    }
  });
}
 bool isPasswordVisible = false;
 bool isConfirmVisible = false;
 bool isLoading = false;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  TextEditingController confirmController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
   @override
  void dispose() {
    confirmController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     
    final settings = context.watch<SettingProvider>();
final isDark = settings.isdarkmode;
    return Scaffold(
       backgroundColor: isDark
      ? const Color(0xFF121212)
      : const Color(0xFFF5F7FA),
      // backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(child:

      SingleChildScrollView(
        child: 
      Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height:35),
          Row(
            children: [
            
              CircleAvatar(
                radius: 26,
                
                backgroundImage: AssetImage('assets/images/logo.png'),

              ),
              SizedBox(width: 12),
              Text('FINDLY', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 28,
              letterSpacing: 1.0,  color: isDark
    ? const Color(0xFF64B5F6)
    : const Color(0xFF0D1B4C),),
              ),
            ],
          ),
          SizedBox(height: 17),
Text(
  "Welcome to FINDLY",
  style: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
color: isDark
    ? Colors.white
    : const Color(0xFF0D1B4C),
  ),
),
Text(
  "Find, lost, sell — all in one place",
  style: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
color: isDark
    ? Colors.white
    : const Color(0xFF0D1B4C),
  ),
),
          SizedBox(height: MediaQuery.of(context).size.height*0.08),
         Card(
           color: isDark
      ? const Color(0xFF1E293B)
      : Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: 
          Padding(padding: EdgeInsets.all(12),
          child: 
          Column(
         crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                 Text(
          "Reset Password",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
        color: isDark
    ? const Color(0xFF64B5F6)
    : const Color(0xFF0D1B4C),  // navy, matches your theme
          ),),
          SizedBox(height: 4),
          Text( "Create a new Password for your account",
           style: GoogleFonts.poppins(fontSize: 13,color: isDark
    ? Colors.white70
    : Colors.grey[600], ),),
         
          Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
            children: [
             
              SizedBox(height: 10),
               TextFormField(
  controller: passwordController,
  obscureText: !isPasswordVisible,
  style: TextStyle(
    color: isDark ? Colors.white : Colors.black,
  ),
  decoration: InputDecoration(
    filled: true,
    fillColor: isDark
        ? const Color(0xFF334155)
        : Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    labelStyle: TextStyle(
      color: isDark
          ? Colors.white70
          : Colors.black87,
    ),
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.lock_outline,
          size: 18,
          color: isDark ? Colors.white70 : Colors.grey,
        ),
        const SizedBox(width: 6),
        const Text("Password"),
      ],
    ),
    suffixIcon: IconButton(
      icon: Icon(
        isPasswordVisible
            ? Icons.visibility
            : Icons.visibility_off,
      ),
      onPressed: () {
        setState(() {
          isPasswordVisible = !isPasswordVisible;
        });
      },
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  },
),
 SizedBox(height: 4),
 Align(
  alignment: Alignment.centerLeft,
  child: 
          Text( "Confirm Password",
           style: GoogleFonts.poppins(fontSize: 13,color: isDark
    ? Colors.white70
    : Colors.grey[600], ),),
            ),
          SizedBox(height: 8),
TextFormField(
  controller: confirmController,
 obscureText: !isConfirmVisible,
  style: TextStyle(
    color: isDark ? Colors.white : Colors.black,
  ),
  decoration: InputDecoration(
    filled: true,
    fillColor: isDark
        ? const Color(0xFF334155)
        : Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    labelStyle: TextStyle(
      color: isDark
          ? Colors.white70
          : Colors.black87,
    ),
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.lock_outline,
          size: 18,
          color: isDark ? Colors.white70 : Colors.grey,
        ),
        const SizedBox(width: 6),
        const Text("Password"),
      ],
    ),
    suffixIcon: IconButton(
      icon: Icon(
    isConfirmVisible
            ? Icons.visibility
            : Icons.visibility_off,
      ),
      onPressed: () {
        setState(() {
      isConfirmVisible=!isConfirmVisible;
        });
      },
    ),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
   if(value != passwordController.text)
  {
    return 'Passwords do not match';
  }
    return null;
  },
),
            ],
          )),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: 
    ElevatedButton(
  onPressed: isLoading
      ? null
      : () async {
          if (_formkey.currentState!.validate()) {
            setState(() {
              isLoading = true;
            });

            try {
              await Supabase.instance.client.auth.updateUser(
                UserAttributes(
                  password: passwordController.text.trim(),
                ),
              );

              if (!mounted) return;

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password reset successfully!'),
                  backgroundColor: Colors.green,
                ),
              );

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const LogInScreen(),
                ),
                (route) => false,
              );
            } catch (e) {
              if (!mounted) return;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: $e'),
                  backgroundColor: Colors.red,
                ),
              );
            } finally {
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            }
          }
        },
  style: ElevatedButton.styleFrom(
    backgroundColor: isDark
        ? const Color(0xFF2563EB)
        : const Color(0xFF0D1B4C),
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  child: isLoading
      ? const CircularProgressIndicator(
          color: Colors.white,
        )
      : Text(
          "Reset",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
)
          ),
       
  
        ],
      ),
          )
         ),
        ],
      ),
      ),
      ),
      ),
    );
  }
}

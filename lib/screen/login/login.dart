import 'package:fasthub/providers/setting_provider.dart';
import 'package:fasthub/screen/Mian/MAINSCREEN%20CLASS.dart';
import 'package:fasthub/screen/signup/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
 bool isPasswordVisible = false;
 bool isLoading = false;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
   @override
  void dispose() {
    emailController.dispose();
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
              SizedBox(width: 11),
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
          "Login",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
        color: isDark
    ? const Color(0xFF64B5F6)
    : const Color(0xFF0D1B4C),  // navy, matches your theme
          ),),
          SizedBox(height: 4),
          Text( "Login with your NUCES email",
           style: GoogleFonts.poppins(fontSize: 13,color: isDark
    ? Colors.white70
    : Colors.grey[600], ),),
          SizedBox(height: 6),
          Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
            children: [
              TextFormField(
               controller:emailController ,
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
  Icons.email,
  size: 18,
  color: isDark ? Colors.white70 : Colors.grey,
),
                SizedBox(width: 6),
                Text("Email"),
                
                  ],
                 ), 
               ),
               validator: (value){
                if(value==null|| value.isEmpty)
                {
                  return 'Email Required';
                }
                   if(!value.contains('@'))
                {
                  return 'Enter valid Email';
                }
                if(!value.endsWith('.nu.edu.pk'))
                {
                  return 'NUCES Email Required';
                }
             
                return null;
               },
              ),
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

            final setting = context.read<SettingProvider>();

            final error = await setting.login(
              emailController.text.trim(),
              passwordController.text.trim(),
            );


            setState(() {
              isLoading = false;
            });


            if (error != null) {

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error),
                ),
              );

            } else {

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => Mainscreen(),
                ),
                (route) => false,
              );

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
      ? const SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2.5,
          ),
        )
      : Text(
          "Login",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
),
          ),
          Align(
  alignment: Alignment.centerRight,
  child: TextButton(
    onPressed: () async {


      final email = emailController.text.trim();

      if(email.isEmpty)
      {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please enter your email first"),
          ),
        );
        return;
      }

      if(!email.endsWith('.nu.edu.pk'))
      {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Enter your NUCES email"),
          ),
        );
        return;
      }


      try {

     await Supabase.instance.client.auth.resetPasswordForEmail(
  email,
  redirectTo: 'fasthub://reset-password',
);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Password reset email sent. Check your inbox."
            ),
          ),
        );


      } catch(e){

        final message = e.toString().toLowerCase();
  String friendlyMessage;

  if (message.contains('socketexception') ||
      message.contains('failed host lookup') ||
      message.contains('clientexception') ||
      message.contains('network')) {
    friendlyMessage = "No internet connection. Please check your network and try again.";
  } else if (message.contains('rate limit')) {
    friendlyMessage = "Too many requests. Please wait a few minutes before trying again.";
  } else if (e is AuthException) {
    friendlyMessage = e.message;
  } else {
    friendlyMessage = "Something went wrong. Please try again.";
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(friendlyMessage),
    ),
  );

      }

    },
    child: Text(
      "Forgot Password?",
      style: GoogleFonts.poppins(
        color: isDark
            ? Colors.blue[300]
            : const Color(0xFF0D1B4C),
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
),
          SizedBox(height: 10),
          TextButton(
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (_)=> Signupscreen()),);
  },
  child: Row(
            children: [
        Text(" Dont have an account ",
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color:  isDark
      ? Colors.white70
      : Colors.black87,
      ),),
          Icon(Icons.login, color:  isDark
      ? Colors.white70
      : Colors.black87,),
          
            ],
          ),
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

import 'package:fasthub/providers/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
     bool isPasswordVisible = false;
       bool isLoading = false;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
    TextEditingController nameController=TextEditingController();
       TextEditingController passwordController=TextEditingController();

   @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
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
          "Signup",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
        color: isDark
    ? const Color(0xFF64B5F6)
    : const Color(0xFF0D1B4C),  // navy, matches your theme
          ),),
          SizedBox(height: 4),
          Text( "Signup with your NUCES email",
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
               controller:nameController ,
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
                  children: [
                   Icon(
  Icons.person,
  size: 18,
  color: isDark ? Colors.white70 : Colors.grey,
),
                SizedBox(width: 6),
                Text("Name"),
                  ],
                )
               ),
               validator: (value) {
                 if(value==null|| value.isEmpty)
                 {
                  return 'Name Required';
                 }
                 if(value.length<3)
                 {
                  return 'Atleast 3 Characters required';
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
          SizedBox(height: 10),
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


              final error = await setting.signup(
                emailController.text.trim(),
                nameController.text.trim(),
                passwordController.text.trim(),
              );


              setState(() {
                isLoading = false;
              });


              if (error != null) {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error),
                    backgroundColor: Colors.red,
                  ),
                );

              } 
              else {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                   "Account created! Please check your email and confirm before logging in."
                    ),
                    backgroundColor: Colors.green,
                  ),
                );


                Navigator.pop(context);

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
            "Register",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
  ),
          ),
          SizedBox(height: 10),
          TextButton(
  onPressed: () {
    Navigator.pop(context);
  },
  child: Text(
    "Already have an account? Login",
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
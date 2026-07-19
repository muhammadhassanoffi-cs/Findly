// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:fasthub/providers/setting_provider.dart';
// import 'package:provider/provider.dart';
// class Editprofilescreen extends StatefulWidget {
//   const Editprofilescreen({super.key});

//   @override
//   State<Editprofilescreen> createState() => _EditprofilescreenState();
// }

// class _EditprofilescreenState extends State<Editprofilescreen> {
//   TextEditingController nameController=TextEditingController();
//     TextEditingController emailController=TextEditingController();
//     final GlobalKey<FormState> _formkey =GlobalKey<FormState>();
    
    
//     final ImagePicker _picker=ImagePicker();
// String? _imagepath;
// Future<void> pickProfileImage()async{
//   final XFile? image=await _picker.pickImage(source: ImageSource.gallery);
//   if(image!=null)
//   {
//     setState(() {
//       _imagepath=image.path;
//     });
//   }
// }
// @override
// void initState() {
   
//     super.initState();
//      final settingsProvider = context.read<SettingProvider>();

//     nameController.text=settingsProvider.userName;
//     emailController.text=settingsProvider.userEmail;
//     _imagepath=settingsProvider.profileImagePath;
//   }
//   @override
//   void dispose()
//   {
//     nameController.dispose();
//     emailController.dispose();
//     super.dispose();

//   }
//   @override
//   Widget build(BuildContext context) {
//      final settingsprovider=context.read<SettingProvider>();
//      final isDark = context.watch<SettingProvider>().isdarkmode;
//     return   Scaffold(
// appBar: AppBar(
//   iconTheme: const IconThemeData(color: Colors.white),
//   backgroundColor: isDark
//   ? const Color(0xFF0D1B4C)
//   : const Color(0xFF0D1B4C),  // navy, matches Feed/Login
//   title: Text(
//     'Edit Profile',
//     style: GoogleFonts.poppins(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 18,
//     ),
//   ),),
//   body: ListView(
  
//   padding:EdgeInsets.all(16),
  
//   children: [
//     SizedBox(height: 50),
// Center(
//   child: GestureDetector(
//     onTap: pickProfileImage,
//     child: ClipOval(
//       child: Container(
//         height: 150,
//         width: 150,
//        color: isDark
//     ? const Color(0xFF334155)
//     : Colors.grey[200],
//         child: (_imagepath == null || _imagepath!.isEmpty)
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                  Icon(
//   Icons.add_a_photo_outlined,
//   size: 32,
//   color: isDark
//       ? Colors.white70
//       : Colors.grey[500],
// ),
//                   const SizedBox(height: 6),
//                   Text(
//                     "Tap to add",
//                     style: GoogleFonts.poppins(color: isDark
//     ? Colors.white70
//     : Colors.grey[600], fontSize: 11, fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               )
//             : Image.file(
//                 File(_imagepath!),
//                 fit: BoxFit.cover,
//                 width: 150,
//                 height: 150,
//               ),
//       ),
//     ),
//   ),
// ),
// SizedBox(height: 4),
// Center(
//   child: 
// Text(
//         "(tap to update)",
//         style: TextStyle(fontSize: 11, color: isDark
//     ? Colors.white70
//     : Colors.grey[600], fontStyle: FontStyle.italic),
//       ),
//   ),
// SizedBox(height: 7),

//     Form(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       key:_formkey ,
//       child: 
//     Column(
// crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//          SizedBox(height: 11),
//       Text(
//   'Name',
//   style: GoogleFonts.poppins(
// color: isDark
//     ? const Color(0xFF64B5F6)
//     : const Color(0xFF0D1B4C),
//     fontWeight: FontWeight.w700,
//     fontSize: 15,
//     letterSpacing: 0.2,
//   ),
// ),
//         SizedBox(height: 6),
// TextFormField(
//   controller: nameController,
//   style: TextStyle(
//   color: isDark
//       ? Colors.white
//       : Colors.black87,
// ),
//  decoration: InputDecoration(
//   filled: true,
// fillColor: isDark
//     ? const Color(0xFF1E293B)
//     : Colors.white,
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.circular(12),
// borderSide: BorderSide(
//     color: isDark
//         ? Colors.white54
//         : Colors.grey,
//   ),
//   ),
//   label: Text('👤 Name'),
//  ),


  
//   validator: (value) {
//     if(value==null|| value.isEmpty)
//     {
//       return 'Name required';
//     }
//       if(value.length<3)
//     {
//       return 'Atleast 3 characters Required';
//     }
//     return null;
//   },
// ),
//  SizedBox(height: 11),
//   Text(
//   'Email',
//   style: GoogleFonts.poppins(
// color: isDark
//     ? const Color(0xFF64B5F6)
//     : const Color(0xFF0D1B4C),
//     fontWeight: FontWeight.w700,
//     fontSize: 15,
//     letterSpacing: 0.2,
//   ),
// ),
// SizedBox(height: 10),
// TextFormField(
//                controller:emailController ,
//                style: TextStyle(
//   color: isDark
//       ? Colors.white
//       : Colors.black87,
// ),
//                decoration: InputDecoration(
//                 filled: true,
// fillColor: isDark
//     ? const Color(0xFF1E293B)
//     : Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(
//     color: isDark
//         ? Colors.white54
//         : Colors.grey,
//   ),
//                 ),
//                  label: Row(
//                  mainAxisSize: MainAxisSize.min,
//                 children: [
//                    Icon(Icons.email, size: 18),
//                 SizedBox(width: 6),
//                 Text("Email"),
//                   ],
//                  ), 
//                ),
//                validator: (value){
//                 if(value==null|| value.isEmpty)
//                 {
//                   return 'Email Required';
//                 }

//                    if(!value.contains('@'))
//                 {
//                   return 'Enter valid Email';
//                 }
//                 if(!value.endsWith('.nu.edu.pk'))
//                 {
//                   return 'NUCES Email Required';
//                 }
             
//                 return null;
//                },
//               ),
    
 
//       ],
//     )
    
//     ),
//     SizedBox(height: 35),
//     ElevatedButton(onPressed: ()
//     {
//       if(_formkey.currentState!.validate())
//     {
//       settingsprovider.updateProfile(name: nameController.text,imagePath: _imagepath, email: emailController.text);
//   Navigator.pop(context);
//     }
    
//     }
    
//     ,
//      style: ElevatedButton.styleFrom(
//     backgroundColor: isDark
//     ? const Color(0xFF2563EB)
//     : const Color(0xFF0D1B4C),
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     ),
//      child: Text(
//       'Update Profile',
//       style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
//     ),),
    
//   ],
  
//   )
  
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fasthub/providers/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
class Editprofilescreen extends StatefulWidget {
  const Editprofilescreen({super.key});

  @override
  State<Editprofilescreen> createState() => _EditprofilescreenState();
}

class _EditprofilescreenState extends State<Editprofilescreen> {
  TextEditingController nameController=TextEditingController();
    TextEditingController emailController=TextEditingController();
    final GlobalKey<FormState> _formkey =GlobalKey<FormState>();
    
    
    final ImagePicker _picker=ImagePicker();

// _localImagePath: freshly picked photo, just for on-screen preview.
// _uploadedImageUrl: the real Supabase Storage URL — this is what actually gets saved.
String? _localImagePath;
String? _uploadedImageUrl;
bool _isUploading = false;

Future<void> pickProfileImage()async{
  final XFile? image=await _picker.pickImage(source: ImageSource.gallery);
  if(image!=null)
  {
    setState(() {
      _localImagePath=image.path;
    });
  }
}

Future<String?> uploadProfileImage(String localPath) async {
  try {
    final supabase = Supabase.instance.client;
    final file = File(localPath);
    final fileExt = localPath.split('.').last;
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.$fileExt';

    await supabase.storage.from('profile-images').upload(fileName, file);
    return supabase.storage.from('profile-images').getPublicUrl(fileName);
  } catch (e) {
    print('Error uploading profile image: $e');
    return null;
  }
}

@override
void initState() {
   
    super.initState();
     final settingsProvider = context.read<SettingProvider>();

    nameController.text=settingsProvider.userName;
    emailController.text=settingsProvider.userEmail;
    _uploadedImageUrl=settingsProvider.profileImagePath;
  }
  @override
  void dispose()
  {
    nameController.dispose();
    emailController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
     final settingsprovider=context.read<SettingProvider>();
     final isDark = context.watch<SettingProvider>().isdarkmode;
    return   Scaffold(
appBar: AppBar(
  iconTheme: const IconThemeData(color: Colors.white),
  backgroundColor: isDark
  ? const Color(0xFF0D1B4C)
  : const Color(0xFF0D1B4C),  // navy, matches Feed/Login
  title: Text(
    'Edit Profile',
    style: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),),
  body: ListView(
  
  padding:EdgeInsets.all(16),
  
  children: [
    SizedBox(height: 50),
Center(
  child: GestureDetector(
    onTap: pickProfileImage,
    child: ClipOval(
      child: Container(
        height: 150,
        width: 150,
       color: isDark
    ? const Color(0xFF334155)
    : Colors.grey[200],
        child: (_localImagePath == null && (_uploadedImageUrl == null || _uploadedImageUrl!.isEmpty))
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Icon(
  Icons.add_a_photo_outlined,
  size: 32,
  color: isDark
      ? Colors.white70
      : Colors.grey[500],
),
                  const SizedBox(height: 6),
                  Text(
                    "Tap to add",
                    style: GoogleFonts.poppins(color: isDark
    ? Colors.white70
    : Colors.grey[600], fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            : (_localImagePath != null
                ? Image.file(
                    File(_localImagePath!),
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  )
                : Image.network(
                    _uploadedImageUrl!,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.person,
                      size: 60,
                      color: isDark ? Colors.white54 : Colors.grey,
                    ),
                  )),
      ),
    ),
  ),
),
SizedBox(height: 4),
Center(
  child: 
Text(
        "(tap to update)",
        style: TextStyle(fontSize: 11, color: isDark
    ? Colors.white70
    : Colors.grey[600], fontStyle: FontStyle.italic),
      ),
  ),
SizedBox(height: 7),

    Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key:_formkey ,
      child: 
    Column(
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(height: 11),
      Text(
  'Name',
  style: GoogleFonts.poppins(
color: isDark
    ? const Color(0xFF64B5F6)
    : const Color(0xFF0D1B4C),
    fontWeight: FontWeight.w700,
    fontSize: 15,
    letterSpacing: 0.2,
  ),
),
        SizedBox(height: 6),
TextFormField(
  controller: nameController,
  style: TextStyle(
  color: isDark
      ? Colors.white
      : Colors.black87,
),
 decoration: InputDecoration(
  filled: true,
fillColor: isDark
    ? const Color(0xFF1E293B)
    : Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
borderSide: BorderSide(
    color: isDark
        ? Colors.white54
        : Colors.grey,
  ),
  ),
  label: Text('👤 Name'),
 ),


  
  validator: (value) {
    if(value==null|| value.isEmpty)
    {
      return 'Name required';
    }
      if(value.length<3)
    {
      return 'Atleast 3 characters Required';
    }
    return null;
  },
),
 SizedBox(height: 11),
  Text(
  'Email',
  style: GoogleFonts.poppins(
color: isDark
    ? const Color(0xFF64B5F6)
    : const Color(0xFF0D1B4C),
    fontWeight: FontWeight.w700,
    fontSize: 15,
    letterSpacing: 0.2,
  ),
),
SizedBox(height: 10),
// TextFormField(
//                controller:emailController ,
//                style: TextStyle(
//   color: isDark
//       ? Colors.white
//       : Colors.black87,
// ),
//                decoration: InputDecoration(
//                 filled: true,
// fillColor: isDark
//     ? const Color(0xFF1E293B)
//     : Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(
//     color: isDark
//         ? Colors.white54
//         : Colors.grey,
//   ),
//                 ),
//                  label: Row(
//                  mainAxisSize: MainAxisSize.min,
//                 children: [
//                    Icon(Icons.email, size: 18),
//                 SizedBox(width: 6),
//                 Text("Email"),
//                   ],
//                  ), 
//                ),
//                validator: (value){
//                 if(value==null|| value.isEmpty)
//                 {
//                   return 'Email Required';
//                 }

//                    if(!value.contains('@'))
//                 {
//                   return 'Enter valid Email';
//                 }
//                 if(!value.endsWith('.nu.edu.pk'))
//                 {
//                   return 'NUCES Email Required';
//                 }
             
//                 return null;
//                },
//               ),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF1E293B)
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          const Icon(Icons.email),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              emailController.text,
              style: GoogleFonts.poppins(fontSize: 15),
            ),
          ),
        ],
      ),
    ),

    const SizedBox(height: 6),

    Text(
      "Email cannot be changed.",
      style: GoogleFonts.poppins(
        fontSize: 12,
        color: Colors.grey,
        fontStyle: FontStyle.italic,
      ),
    ),
  ],
)
 
      ],
    )
    
    ),
    SizedBox(height: 35),
    ElevatedButton(onPressed: _isUploading ? null : () async
    {
      if(_formkey.currentState!.validate())
    {
      setState(() { _isUploading = true; });

      // If the user picked a new photo, upload it now before saving.
      if (_localImagePath != null) {
        final url = await uploadProfileImage(_localImagePath!);
        if (url == null) {
          setState(() { _isUploading = false; });
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Image upload failed, try again'), backgroundColor: Colors.red),
          );
          return;
        }
        _uploadedImageUrl = url;
      }

      setState(() { _isUploading = false; });

      settingsprovider.updateProfile(name: nameController.text,imagePath: _uploadedImageUrl, email: emailController.text);
  if (!mounted) return;
  Navigator.pop(context);
    }
    
    }
    
    ,
     style: ElevatedButton.styleFrom(
    backgroundColor: isDark
    ? const Color(0xFF2563EB)
    : const Color(0xFF0D1B4C),
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
     child: _isUploading
         ? SizedBox(
             height: 20,
             width: 20,
             child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
           )
         : Text(
      'Update Profile',
      style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    ),),
    
  ],
  
  )
  
    );
  }
}
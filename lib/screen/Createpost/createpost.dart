
// import 'package:fasthub/models/campus_post.dart';
// import 'package:fasthub/providers/setting_provider.dart';
// import 'package:fasthub/screen/Mian/MAINSCREEN%20CLASS.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:fasthub/providers/post_provider.dart';

// import 'package:provider/provider.dart';  // needed for File, to actually display the picked image

// class Createpost extends StatefulWidget {
//   CampusPost? currentpost;
//    Createpost({super.key, this.currentpost });

//   @override
//   State<Createpost> createState() => _CreatepostState();
// }

// class _CreatepostState extends State<Createpost> {
//   static const Color navy = Color(0xFF0D1B4C);
//   final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
//     final GlobalKey<FormState> _secondformkey=GlobalKey<FormState>();
  
//   final ImagePicker _picker=ImagePicker();
// String? _imagepath;
// Future<void> pickImage()async{
//   final XFile? image=await _picker.pickImage(source: ImageSource.gallery);
//   if(image!=null)
//   {
//     setState(() {
//       _imagepath=image.path;
//     });
//   }
// }
// Widget sectionLabel(String text, bool isDark) {
//   return Text(
//     text,
//     style: GoogleFonts.poppins(
//       fontSize: 14,
//       fontWeight: FontWeight.bold,
//       color: isDark
//           ? const Color(0xFF64B5F6)
//           : navy,
//     ),
//   );
// }
// TextEditingController titleController=TextEditingController();
// TextEditingController descController=TextEditingController();
// TextEditingController priceController=TextEditingController();
// InputDecoration fieldDecoration(
// String label,
// bool isDark,
// {
// String? hint
// }
// ) {
//   return InputDecoration(
//     hintText: hint,
//     filled: true,
//     fillColor: isDark
//     ? const Color(0xFF1E293B)
//     : Colors.grey[50],
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(color: Colors.grey[300]!),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: navy, width: 2),
//     ),
//     errorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: Colors.red, width: 1.5),
//     ),
//     contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//   );
// }
// String? cate='Lost';
// @override 
// void initState() {
// super.initState();
// if(widget.currentpost != null)
// {
// final post=widget.currentpost!;

// titleController.text=post.title;
// descController.text=post.description;
// priceController.text = post.price?.toString() ?? '';
// cate=post.category;
// _imagepath=post.imagePath;
// }

// }

// @override
// void dispose() {
//   titleController.dispose();
//   descController.dispose();
//   priceController.dispose();
//   super.dispose();
// }

//   @override
//   Widget build(BuildContext context) {
    
//         final user=context.watch<SettingProvider>();
//         final isDark = user.isdarkmode;
//     return Scaffold(
//       backgroundColor: const Color(0xFFFAFAFA),
// appBar: AppBar(
// backgroundColor: isDark
//     ? const Color(0xFF081426)
//     : const Color(0xFF0D1B4C),  // navy, matches Feed/Login
//   title: Text( widget.currentpost!=null ? 'Edit Post':
//     'Create Post',
//     style: GoogleFonts.poppins(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 18,
    
// ),
//   ),
//   iconTheme: const IconThemeData(color: Colors.white),  // makes the back arrow white too
// ),
// body: ListView(
  
//   padding:EdgeInsets.all(16),
  
//   children: [
//     GestureDetector(
//       onTap: pickImage,
//       child: Container(
//         height: 180,
//         width: double.infinity,

//         decoration: BoxDecoration(
//         color: isDark
//     ? const Color(0xFF334155)
//     : Colors.grey[200],
//           borderRadius: BorderRadius.circular(12),
//         ),
// child: _imagepath==null? Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//   children: [
    
//                         Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.add_a_photo_outlined, size: 40,color: isDark
//     ? Colors.white70
//     : Colors.grey[500] ),
//           const SizedBox(height: 8),
//           Text(
//             "Tap to add a photo",
//             style: GoogleFonts.poppins(color: isDark
//     ? Colors.white70
//     : Colors.grey[600], fontSize: 13, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 2),
//           Text(
//             "PNG or JPG, max 5MB",
//             style: GoogleFonts.poppins(color: isDark
//     ? Colors.white70
//     : Colors.grey[600], fontSize: 11),
//           ),
//         ],
//       )

//   ],
// )
// : ClipRRect(
//   borderRadius: BorderRadius.circular(12),
//   child: Image.file(File(_imagepath!), fit: BoxFit.cover
//   ,   width: double.infinity,height: 180,),
// )
//       ),
  
//     ),
//     Form(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       key:_formkey ,
//       child: 
//     Column(
// crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//          SizedBox(height: 10),
//       sectionLabel('Item Title *', isDark),
//         SizedBox(height: 6),
// TextFormField(
//   controller: titleController,
//   style: TextStyle(
//   color: isDark
//       ? Colors.white
//       : Colors.black87,
// ),
//   decoration:fieldDecoration(
// 'Title',
// isDark,
// hint:'e.g., Lost Wallet'
// ),


  
//   validator: (value) {
//     if(value==null|| value.isEmpty)
//     {
//       return 'Title required';
//     }
//     return null;
//   },
// ),
//     SizedBox(height: 10),
//   sectionLabel('Description *',isDark),
// SizedBox(height: 6),
// TextFormField(
//   maxLines: 5,
//   style: TextStyle(
//   color: isDark
//       ? Colors.white
//       : Colors.black87,
// ),
//   controller: descController,
//   decoration: fieldDecoration(
// 'Description',
// isDark,
// hint:'Enter post description...'
// ),

  
//   validator: (value) {
//     if(value==null|| value.isEmpty)
//     {
//       return 'Description required';
//     }
//     return null;
//   },
// ),
 
//       ],
//     )
//     ),
//     SizedBox(height: 10),
//   sectionLabel('Select Category *',isDark),
//          SizedBox(height: 7),
//          Container(
//   decoration: BoxDecoration(
// color: isDark
//     ? const Color(0xFF1E293B)
//     : Colors.grey[50],
//     borderRadius: BorderRadius.circular(12),
//     border:Border.all(
// color: isDark
//     ? Colors.white24
//     : Colors.grey[300]!,
// ),
//   ),
//   padding: const EdgeInsets.symmetric(horizontal: 4),
//   child: DropdownButtonHideUnderline(
//     child: DropdownButtonFormField(
//       initialValue: cate,
// icon: Icon(
// Icons.arrow_drop_down_circle_outlined,
// color: isDark
//     ? const Color(0xFF64B5F6)
//     : navy,
// ),
//       decoration: const InputDecoration(
//         border: InputBorder.none,
//         contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//       ),
//       items: [
//        DropdownMenuItem(
//           value: 'Lost',
//           child: Text('🔍 Lost')),
//            DropdownMenuItem(
//           value: 'Found',
//           child: Text('📍Found')),
//            DropdownMenuItem(
//           value: 'Sale',
//           child: Text('🏷️ Sale')),

//       ],
//       onChanged: (value) {
//         setState(() {
//           cate = value.toString();
//         });
//       },
//     ),
//   ),
// ),
    
//       SizedBox(height: 10),
//       if(cate=='Sale')
//     Form(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       key: _secondformkey,
//       child: Column(
//       children: [
//       TextFormField(
//   controller: priceController,
//   style: TextStyle(
//   color: isDark
//       ? Colors.white
//       : Colors.black87,
// ),
//     keyboardType: TextInputType.number, 
//   decoration:fieldDecoration(
// 'Price',
// isDark,
// hint:'e.g., RS. 1500'
// ),

//   validator: (value) {
//     if(value==null|| value.isEmpty)
//     {
//       return 'Price required';
//     }

//     final pri=int.tryParse(value);

//   if (pri == null)
//    {

//     return 'Enter a valid number';
//   }
//      if(pri<0)
//     {
//       return 'Enter Valid Price';
//     }
//     return null;
//   },
// ),
//   ],
// ),
//     ),
//     SizedBox(height: 10),
   
//      SizedBox(
//   width: double.infinity,
//   child: ElevatedButton(
//     onPressed: () {
//       bool ispricevalid=cate=='Sale'? _secondformkey.currentState!.validate():true;
//       if(_formkey.currentState!.validate() && ispricevalid)

//       {
//         final now = DateTime.now();
//         String email = user.userEmail;

// String first7 = email.substring(0, 7);

// double? price = cate == 'Sale' ? double.tryParse(priceController.text) : null;
//         final post=CampusPost(title: titleController.text, id:widget.currentpost?.id ?? now.millisecondsSinceEpoch.toString(),
//          description: descController.text, category: cate!, postedByName:user.userName ,
//           postedByEmail:user.userEmail , createdAt: widget.currentpost?.createdAt ?? now, imagePath:_imagepath ?? widget.currentpost?.imagePath,rollno:first7,price: price);
//         final postprovider=context.read<PostProvider>();
//        if (widget.currentpost == null) {
//   postprovider.addPost(post);
// } else {
//   postprovider.updatePost(post);
// }
    
//       Navigator.pushReplacement(
//   context,
//   MaterialPageRoute(builder: (_) => Mainscreen()),
// );

//       }
//       else{
//         ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text('Fix All Errors'), backgroundColor: Colors.red,),
//         );
//       }
//     },
//     style: ElevatedButton.styleFrom(
//       backgroundColor: navy,
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     ),
//     child: Text(
//       'Save Post',
//       style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
//     ),
//   ),
// ),
      

//   ],
// ),
//     );
//   }
// }
import 'package:fasthub/models/campus_post.dart';
import 'package:fasthub/providers/setting_provider.dart';
import 'package:fasthub/screen/Mian/MAINSCREEN%20CLASS.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fasthub/providers/post_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:provider/provider.dart';  // needed for File, to actually display the picked image

class Createpost extends StatefulWidget {
  CampusPost? currentpost;
   Createpost({super.key, this.currentpost });

  @override
  State<Createpost> createState() => _CreatepostState();
}

class _CreatepostState extends State<Createpost> {
  static const Color navy = Color(0xFF0D1B4C);
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
    final GlobalKey<FormState> _secondformkey=GlobalKey<FormState>();
  
  final ImagePicker _picker=ImagePicker();

// _localImagePath: the freshly picked photo on THIS device, used only for instant preview.
// _uploadedImageUrl: the real Supabase Storage URL, used for saving/display everywhere else.
String? _localImagePath;
String? _uploadedImageUrl;
bool _isUploading = false;

Future<void> pickImage()async{
  final XFile? image=await _picker.pickImage(source: ImageSource.gallery);
  if(image!=null)
  {
    setState(() {
      _localImagePath=image.path;
    });
  }
}

Future<String?> uploadImage(String localPath) async {
  try {
    final supabase = Supabase.instance.client;
    final file = File(localPath);
    final fileExt = localPath.split('.').last;
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.$fileExt';

    await supabase.storage.from('post-images').upload(fileName, file);
    return supabase.storage.from('post-images').getPublicUrl(fileName);
  } catch (e) {
    print('Error uploading image: $e');
    return null;
  }
}

Widget sectionLabel(String text, bool isDark) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: isDark
          ? const Color(0xFF64B5F6)
          : navy,
    ),
  );
}
TextEditingController titleController=TextEditingController();
TextEditingController descController=TextEditingController();
TextEditingController priceController=TextEditingController();
InputDecoration fieldDecoration(
String label,
bool isDark,
{
String? hint
}
) {
  return InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: isDark
    ? const Color(0xFF1E293B)
    : Colors.grey[50],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey[300]!),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: navy, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
  );
}
String? cate='Lost';
@override 
void initState() {
super.initState();
if(widget.currentpost != null)
{
final post=widget.currentpost!;

titleController.text=post.title;
descController.text=post.description;
priceController.text = post.price?.toString() ?? '';
cate=post.category;
_uploadedImageUrl=post.imagePath;
}

}

@override
void dispose() {
  titleController.dispose();
  descController.dispose();
  priceController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    
        final user=context.watch<SettingProvider>();
        final isDark = user.isdarkmode;
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
appBar: AppBar(
backgroundColor: isDark
    ? const Color(0xFF081426)
    : const Color(0xFF0D1B4C),  // navy, matches Feed/Login
  title: Text( widget.currentpost!=null ? 'Edit Post':
    'Create Post',
    style: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    
),
  ),
  iconTheme: const IconThemeData(color: Colors.white),  // makes the back arrow white too
),
body: ListView(
  
  padding:EdgeInsets.all(16),
  
  children: [
    GestureDetector(
      onTap: pickImage,
      child: Container(
        height: 180,
        width: double.infinity,

        decoration: BoxDecoration(
        color: isDark
    ? const Color(0xFF334155)
    : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
child: (_localImagePath==null && _uploadedImageUrl==null)? Column(
    mainAxisAlignment: MainAxisAlignment.center,
  children: [
    
                        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_a_photo_outlined, size: 40,color: isDark
    ? Colors.white70
    : Colors.grey[500] ),
          const SizedBox(height: 8),
          Text(
            "Tap to add a photo",
            style: GoogleFonts.poppins(color: isDark
    ? Colors.white70
    : Colors.grey[600], fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),
          Text(
            "PNG or JPG, max 5MB",
            style: GoogleFonts.poppins(color: isDark
    ? Colors.white70
    : Colors.grey[600], fontSize: 11),
          ),
        ],
      )

  ],
)
: ClipRRect(
  borderRadius: BorderRadius.circular(12),
  child: _localImagePath != null
      ? Image.file(File(_localImagePath!), fit: BoxFit.cover, width: double.infinity, height: 180)
      : Image.network(_uploadedImageUrl!, fit: BoxFit.cover, width: double.infinity, height: 180),
)
      ),
  
    ),
    Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key:_formkey ,
      child: 
    Column(
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(height: 10),
      sectionLabel('Item Title *', isDark),
        SizedBox(height: 6),
TextFormField(
  controller: titleController,
  style: TextStyle(
  color: isDark
      ? Colors.white
      : Colors.black87,
),
  decoration:fieldDecoration(
'Title',
isDark,
hint:'e.g., Lost Wallet'
),


  
  validator: (value) {
    if(value==null|| value.isEmpty)
    {
      return 'Title required';
    }
    return null;
  },
),
    SizedBox(height: 10),
  sectionLabel('Description *',isDark),
SizedBox(height: 6),
TextFormField(
  maxLines: 5,
  style: TextStyle(
  color: isDark
      ? Colors.white
      : Colors.black87,
),
  controller: descController,
  decoration: fieldDecoration(
'Description',
isDark,
hint:'Enter post description...'
),

  
  validator: (value) {
    if(value==null|| value.isEmpty)
    {
      return 'Description required';
    }
    return null;
  },
),
 
      ],
    )
    ),
    SizedBox(height: 10),
  sectionLabel('Select Category *',isDark),
         SizedBox(height: 7),
         Container(
  decoration: BoxDecoration(
color: isDark
    ? const Color(0xFF1E293B)
    : Colors.grey[50],
    borderRadius: BorderRadius.circular(12),
    border:Border.all(
color: isDark
    ? Colors.white24
    : Colors.grey[300]!,
),
  ),
  padding: const EdgeInsets.symmetric(horizontal: 4),
  child: DropdownButtonHideUnderline(
    child: DropdownButtonFormField(
      initialValue: cate,
icon: Icon(
Icons.arrow_drop_down_circle_outlined,
color: isDark
    ? const Color(0xFF64B5F6)
    : navy,
),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      items: [
       DropdownMenuItem(
          value: 'Lost',
          child: Text('🔍 Lost')),
           DropdownMenuItem(
          value: 'Found',
          child: Text('📍Found')),
           DropdownMenuItem(
          value: 'Sale',
          child: Text('🏷️ Sale')),

      ],
      onChanged: (value) {
        setState(() {
          cate = value.toString();
        });
      },
    ),
  ),
),
    
      SizedBox(height: 10),
      if(cate=='Sale')
    Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _secondformkey,
      child: Column(
      children: [
      TextFormField(
  controller: priceController,
  style: TextStyle(
  color: isDark
      ? Colors.white
      : Colors.black87,
),
    keyboardType: TextInputType.number, 
  decoration:fieldDecoration(
'Price',
isDark,
hint:'e.g., RS. 1500'
),

  validator: (value) {
    if(value==null|| value.isEmpty)
    {
      return 'Price required';
    }

    final pri=int.tryParse(value);

  if (pri == null)
   {

    return 'Enter a valid number';
  }
     if(pri<0)
    {
      return 'Enter Valid Price';
    }
    return null;
  },
),
  ],
),
    ),
    SizedBox(height: 10),
   
     SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: _isUploading ? null : () async {
      bool ispricevalid=cate=='Sale'? _secondformkey.currentState!.validate():true;
      if(_formkey.currentState!.validate() && ispricevalid)

      {
        setState(() { _isUploading = true; });

        // If the user picked a new photo on this screen, upload it now
        // and get back a public URL before we save the post.
        if (_localImagePath != null) {
          final url = await uploadImage(_localImagePath!);
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

        final now = DateTime.now();
        String email = user.userEmail;

String first7 = email.substring(0, 7);

double? price = cate == 'Sale' ? double.tryParse(priceController.text) : null;
        final post=CampusPost(title: titleController.text, id:widget.currentpost?.id ?? now.millisecondsSinceEpoch.toString(),
         description: descController.text, category: cate!, postedByName:user.userName ,
          postedByEmail:user.userEmail , createdAt: widget.currentpost?.createdAt ?? now, imagePath:_uploadedImageUrl,rollno:first7,price: price);
        final postprovider=context.read<PostProvider>();
       if (widget.currentpost == null) {
  postprovider.addPost(post);
} else {
  postprovider.updatePost(post);
}
    
      Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (_) => Mainscreen()),
);

      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Fix All Errors'), backgroundColor: Colors.red,),
        );
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: navy,
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
      'Save Post',
      style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    ),
  ),
),
      

  ],
),
    );
  }
}
// import 'dart:io';

// import 'package:fasthub/providers/post_provider.dart';
// import 'package:fasthub/providers/setting_provider.dart';
// import 'package:fasthub/screen/Detailscreen/detailscreen.dart';
// import 'package:fasthub/screen/Editprofile%20screen/editprofilescreen.dart';
// import 'package:fasthub/screen/login/login.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class MyProfile extends StatefulWidget {
//   const MyProfile({super.key});

//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }

// class _MyProfileState extends State<MyProfile> {
//   Color getCategoryColor(String category) {
//   switch (category) {
//     case "Lost":
//       return Colors.red;
//     case "Found":
//       return Colors.green;
//     case "Sale":
//       return Colors.orange;
//     default:
//       return Colors.grey;
//   }
//   }
  
//   @override
//   Widget build(BuildContext context) {
//       final settingsprovider=context.watch<SettingProvider>();
//       final postprovider=context.watch<PostProvider>();
//       final isDark = settingsprovider.isdarkmode;
//        final posts=postprovider.GetMyPost(settingsprovider.userEmail);
//          String? email=settingsprovider.userEmail;
//        String rollno = email.length >= 7 ? email.substring(0, 7) : email;
//     return Scaffold(
// appBar: AppBar(
//   backgroundColor: isDark
//     ? const Color(0xFF081426)
//     : const Color(0xFF0D1B4C),
//      toolbarHeight: 60,
//   title:Center(
//     child: 
//    Text(
//     'Profile',
//     style: GoogleFonts.poppins(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 23,
//     ),
    
// ),
// ),
// ),
// body: Center(
//   child: ConstrainedBox(
//     constraints: const BoxConstraints(maxWidth: 600),
//     child: ListView(
//       padding: EdgeInsets.all(10),
//       children: [
//     SizedBox(height: 40),
//     Stack(
//       clipBehavior: Clip.none,
//       alignment: Alignment.topCenter,
//       children: [
//         Container(
//           margin: EdgeInsets.only(top: 55),
//           padding: EdgeInsets.fromLTRB(20, 70, 20, 25),
//           decoration: BoxDecoration(
//          color: isDark
//     ? const Color(0xFF172554)
//     : const Color(0xFF1B2559),
//             borderRadius: BorderRadius.circular(20),
//            boxShadow: [
//   BoxShadow(
//     color: isDark
//         ? Colors.black54
//         : Colors.black26,
//     blurRadius: 12,
//     offset: const Offset(0, 5),
//   ),
// ]
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: 5),
//            Text(
//   settingsprovider.userName,
//   style: GoogleFonts.poppins(
//   color: isDark
//     ? const Color(0xFF93C5FD)
//     : Colors.white,
//     fontWeight: FontWeight.w700,
//     fontSize: 21,
//     letterSpacing: 0.3,
//   ),
// ),
//        SizedBox(height: 8),
//     Row(
//       children: [
//         Text('Roll no:', style: GoogleFonts.poppins(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
// const SizedBox(width: 4),
// Text(
//   rollno,
//   style: GoogleFonts.poppins(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
// ),
//        SizedBox(width: 4),
       
//             ],
//           ),
       
//        Row(
//   children: [
// Icon(
//   Icons.email,
//   color: isDark
//       ? const Color(0xFF93C5FD)
//       : Colors.white,
// ),
//     const SizedBox(width: 4),
//     Text('Email:', style: GoogleFonts.poppins(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
// const SizedBox(width: 4),
// Expanded(
//   child: Text(
//     settingsprovider.userEmail,
//     style: GoogleFonts.poppins(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
//     overflow: TextOverflow.ellipsis,
//     maxLines: 1,
//   ),
// ),
//   ],
// ),      
//             ],


//           ),
//         ),
      

// Positioned(
//   top: 0,
//   child: CircleAvatar(
//     radius: 55,
//     backgroundColor: Colors.white,
//     child: CircleAvatar(
//       radius: 51,
//     backgroundColor: isDark
//     ? const Color(0xFF334155)
//     : Colors.grey[300],
//       // 1. If we have a valid path, show it on top
//       foregroundImage: (settingsprovider.profileImagePath?.isNotEmpty == true)
//           ? FileImage(File(settingsprovider.profileImagePath!))
//           : null,
//       // 2. Otherwise, this icon shows up automatically underneath
//       child: const Icon(Icons.person, size: 50, color: Colors.grey),
//     ),
//   ),
// ),
//           Positioned(
//             top: 78,
//             right: 8,
            
//             child: IconButton(onPressed: (){
//    Navigator.push(context, MaterialPageRoute(builder: (_)=> Editprofilescreen()
//    ),);

//             }, icon: Icon(Icons.edit, size: 18,
//                     color: Colors.white),style: IconButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 44, 76, 90)
//                     ),)
          
//           ),
        


//       ],
//     ),
//    SizedBox(height: 10),
    
// Text(
//   'My Posts',
//   style: GoogleFonts.poppins(
//     color: isDark
//     ? const Color(0xFF64B5F6)
//     : const Color(0xFF0D1B4C),
//     fontWeight: FontWeight.w800,
//     fontSize: 22,
//     letterSpacing: 0.2,
//   ),
// ),
//        SizedBox(height: 10),
   
//   posts.isEmpty
//     ? Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Center(
//           child: Text(
//             "You haven't posted anything yet",
//             style: GoogleFonts.poppins(color: isDark
//     ? Colors.white54
//     : Colors.grey[500], fontSize: 13),
//           ),
//         ),
//       )
//     :
//   ListView.builder(
//   shrinkWrap: true,
//   physics: const NeverScrollableScrollPhysics(),  // prevents nested scroll conflict inside outer ListView
//   padding: const EdgeInsets.all(5),
//   itemCount: posts.length,
//   itemBuilder: (context, index) {
//     final post = posts[index];

//     return Card(
//        color: isDark
//       ? const Color(0xFF1E293B)
//       : Colors.white,
//       margin: const EdgeInsets.only(bottom: 10),
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       clipBehavior: Clip.antiAlias,
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             // ---- IMAGE ON LEFT ----
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: SizedBox(
//                 width: 70,
//                 height: 70,
//                 child: post.imagePath == null
//                     ? Container(
//                         color: isDark
//     ? const Color(0xFF334155)
//     : Colors.grey[200],
//                         child: Icon(Icons.image, color: Colors.grey[400]),
//                       )
//                     : Image.file(File(post.imagePath!), fit: BoxFit.cover),
//               ),
//             ),

//             const SizedBox(width: 12),

//             // ---- CONTENT ON RIGHT ----
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [

//                   // Category badge
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                     decoration: BoxDecoration(
//                       color: getCategoryColor(post.category).withValues(alpha: 0.15),
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: Text(
//                       post.category,
//                       style: TextStyle(
//                         color: getCategoryColor(post.category),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 10,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 4),

//                   // Title
//                   Text(
//                     post.title,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: GoogleFonts.poppins(
//   color: isDark
//       ? Colors.white
//       : Colors.black87,
//   fontWeight: FontWeight.bold,
//   fontSize: 14,
// ),
//                   ),
//                   const SizedBox(height: 2),

//                   // Date
//                   Text(
//                     "${post.createdAt.day}/${post.createdAt.month}/${post.createdAt.year}",
//                   style: TextStyle(
//   fontSize: 11,
//   color: isDark
//       ? Colors.white54
//       : Colors.grey[500],
// ),
//                   ),
//                   const SizedBox(height: 6),

//                   // Buttons row — View Details + Delete
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (_) => Detailscreen(post: post)),
//                           );
//                         },
//                         child: Row(
//                           children: [
//                             Icon(Icons.info_outline, size: 16, color: isDark
//     ? const Color(0xFF64B5F6)
//     : const Color(0xFF0D1B4C)),
//                             const SizedBox(width: 4),
//                             Text(
//                               "View Details",
//                               style: GoogleFonts.poppins(fontSize: 12,color: isDark
//     ? const Color(0xFF64B5F6)
//     : const Color(0xFF0D1B4C), fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
                     
                      
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   },
// ),
    
// Divider(
//   thickness: 3,
//   color: isDark
//       ? Colors.white24
//       : Colors.black12,
// ),
//      Text(
//   'Settings',
//   style: GoogleFonts.poppins(
//    color: isDark
//     ? const Color(0xFF64B5F6)
//     : const Color(0xFF0D1B4C),
//     fontWeight: FontWeight.w800,
//     fontSize: 22,
//     letterSpacing: 0.2,
//   ),
// ),
//     SizedBox(height: 5),
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//        Text(
//   'Dark Mode',
//   style: GoogleFonts.poppins(
//   color: isDark
//     ? Colors.white
//     : const Color(0xFF0D1B4C),
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//     letterSpacing: 0.2,
//   ),
// ),
//         Switch(
//   value:settingsprovider.isdarkmode,
//   activeThumbColor: const Color(0xFF64B5F6),
//   onChanged: (value) {
//   settingsprovider.toggleMood();
//   },
// ),

//       ],
//     ),
// SizedBox(height: 50),
// Center( // <-- Forces the button to shrink to its content size
//   child: OutlinedButton.icon(
//     onPressed: () {
//       settingsprovider.logout();
//       Navigator.pushAndRemoveUntil(
//     context,
//     MaterialPageRoute(builder: (_) => LogInScreen()),
//     (route) => false,
//   );
//     },
//     icon: const Icon(Icons.logout_outlined, color: Colors.red,),
// label: Text(
//   "Sign Out",
//   style: GoogleFonts.poppins(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 14),
// ),
//     style: OutlinedButton.styleFrom(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 90, // Increased slightly so the button has nice inner padding
//         vertical: 10,
//       ),
//       side: const BorderSide(color: Colors.red),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//     ),
//   ),
// )
//   ],
// ),
//     ),
//     ),
    
//     );
    
//   }
// }
import 'package:fasthub/providers/post_provider.dart';
import 'package:fasthub/providers/setting_provider.dart';
import 'package:fasthub/screen/Detailscreen/detailscreen.dart';
import 'package:fasthub/screen/Editprofile%20screen/editprofilescreen.dart';
import 'package:fasthub/screen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Color getCategoryColor(String category) {
  switch (category) {
    case "Lost":
      return Colors.red;
    case "Found":
      return Colors.green;
    case "Sale":
      return Colors.orange;
    default:
      return Colors.grey;
  }
  }
  
  @override
  Widget build(BuildContext context) {
      final settingsprovider=context.watch<SettingProvider>();
      final postprovider=context.watch<PostProvider>();
      final isDark = settingsprovider.isdarkmode;
       final posts=postprovider.GetMyPost(settingsprovider.userEmail);
         String? email=settingsprovider.userEmail;
       String rollno = email.length >= 7 ? email.substring(0, 7) : email;
    return Scaffold(
appBar: AppBar(
  backgroundColor: isDark
    ? const Color(0xFF081426)
    : const Color(0xFF0D1B4C),
     toolbarHeight: 60,
  title:Center(
    child: 
   Text(
    'Profile',
    style: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 23,
    ),
    
),
),
),
body: Center(
  child: ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 600),
    child: ListView(
      padding: EdgeInsets.all(10),
      children: [
    SizedBox(height: 40),
    Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 55),
          padding: EdgeInsets.fromLTRB(20, 70, 20, 25),
          decoration: BoxDecoration(
         color: isDark
    ? const Color(0xFF172554)
    : const Color(0xFF1B2559),
            borderRadius: BorderRadius.circular(20),
           boxShadow: [
  BoxShadow(
    color: isDark
        ? Colors.black54
        : Colors.black26,
    blurRadius: 12,
    offset: const Offset(0, 5),
  ),
]
          ),
          child: Column(
            children: [
              SizedBox(height: 5),
           Text(
  settingsprovider.userName,
  style: GoogleFonts.poppins(
  color: isDark
    ? const Color(0xFF93C5FD)
    : Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 21,
    letterSpacing: 0.3,
  ),
),
       SizedBox(height: 8),
    Row(
      children: [
        Text('Roll no:', style: GoogleFonts.poppins(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
const SizedBox(width: 4),
Text(
  rollno,
  style: GoogleFonts.poppins(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
),
       SizedBox(width: 4),
       
            ],
          ),
       
       Row(
  children: [
Icon(
  Icons.email,
  color: isDark
      ? const Color(0xFF93C5FD)
      : Colors.white,
),
    const SizedBox(width: 4),
    Text('Email:', style: GoogleFonts.poppins(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500)),
const SizedBox(width: 4),
Expanded(
  child: Text(
    settingsprovider.userEmail,
    style: GoogleFonts.poppins(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
  ),
),
  ],
),      
            ],


          ),
        ),
      

Positioned(
  top: 0,
  child: CircleAvatar(
    radius: 55,
    backgroundColor: Colors.white,
    child: CircleAvatar(
      radius: 51,
    backgroundColor: isDark
    ? const Color(0xFF334155)
    : Colors.grey[300],
      // 1. If we have a valid URL, show it on top
      foregroundImage: (settingsprovider.profileImagePath?.isNotEmpty == true)
          ? NetworkImage(settingsprovider.profileImagePath!)
          : null,
      // 2. Otherwise, this icon shows up automatically underneath
      child: const Icon(Icons.person, size: 50, color: Colors.grey),
    ),
  ),
),
          Positioned(
            top: 78,
            right: 8,
            
            child: IconButton(onPressed: (){
   Navigator.push(context, MaterialPageRoute(builder: (_)=> Editprofilescreen()
   ),);

            }, icon: Icon(Icons.edit, size: 18,
                    color: Colors.white),style: IconButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 44, 76, 90)
                    ),)
          
          ),
        


      ],
    ),
   SizedBox(height: 10),
    
Text(
  'My Posts',
  style: GoogleFonts.poppins(
    color: isDark
    ? const Color(0xFF64B5F6)
    : const Color(0xFF0D1B4C),
    fontWeight: FontWeight.w800,
    fontSize: 20,
    letterSpacing: 0.2,
  ),
),
       SizedBox(height: 10),
   
  posts.isEmpty
    ? Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            "You haven't posted anything yet",
            style: GoogleFonts.poppins(color: isDark
    ? Colors.white54
    : Colors.grey[500], fontSize: 13),
          ),
        ),
      )
    :
  ListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),  // prevents nested scroll conflict inside outer ListView
  padding: const EdgeInsets.all(5),
  itemCount: posts.length,
  itemBuilder: (context, index) {
    final post = posts[index];

    return Card(
       color: isDark
      ? const Color(0xFF1E293B)
      : Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ---- IMAGE ON LEFT ----
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 70,
                height: 70,
                child: post.imagePath == null
                    ? Container(
                        color: isDark
    ? const Color(0xFF334155)
    : Colors.grey[200],
                        child: Icon(Icons.image, color: Colors.grey[400]),
                      )
                    : Image.network(
                        post.imagePath!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return Center(
                            child: SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: isDark
                              ? const Color(0xFF334155)
                              : Colors.grey[200],
                          child: Icon(Icons.image_not_supported, color: Colors.grey[400]),
                        ),
                      ),
              ),
            ),

            const SizedBox(width: 12),

            // ---- CONTENT ON RIGHT ----
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Category badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: getCategoryColor(post.category).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      post.category,
                      style: TextStyle(
                        color: getCategoryColor(post.category),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Title
                  Text(
                    post.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
  color: isDark
      ? Colors.white
      : Colors.black87,
  fontWeight: FontWeight.bold,
  fontSize: 14,
),
                  ),
                  const SizedBox(height: 2),

                  // Date
                  Text(
                    "${post.createdAt.day}/${post.createdAt.month}/${post.createdAt.year}",
                  style: TextStyle(
  fontSize: 11,
  color: isDark
      ? Colors.white54
      : Colors.grey[500],
),
                  ),
                  const SizedBox(height: 6),

                  // Buttons row — View Details + Delete
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Detailscreen(post: post)),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.info_outline, size: 16, color: isDark
    ? const Color(0xFF64B5F6)
    : const Color(0xFF0D1B4C)),
                            const SizedBox(width: 4),
                            Text(
                              "View Details",
                              style: GoogleFonts.poppins(fontSize: 12,color: isDark
    ? const Color(0xFF64B5F6)
    : const Color(0xFF0D1B4C), fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                     
                      
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  },
),
    
Divider(
  thickness: 3,
  color: isDark
      ? Colors.white24
      : Colors.black12,
),
     Text(
  'Settings',
  style: GoogleFonts.poppins(
   color: isDark
    ? const Color(0xFF64B5F6)
    : const Color(0xFF0D1B4C),
    fontWeight: FontWeight.w800,
    fontSize: 20,
    letterSpacing: 0.2,
  ),
),
    SizedBox(height: 5),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Text(
  'Dark Mode',
  style: GoogleFonts.poppins(
  color: isDark
    ? Colors.white
    : const Color(0xFF0D1B4C),
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  ),
),
        Switch(
  value:settingsprovider.isdarkmode,
  activeThumbColor: const Color(0xFF64B5F6),
  onChanged: (value) {
  settingsprovider.toggleMood();
  },
),

      ],
    ),
SizedBox(height: 50),
Center( // <-- Forces the button to shrink to its content size
  child: OutlinedButton.icon(
    onPressed: () {
      settingsprovider.logout();
      Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => LogInScreen()),
    (route) => false,
  );
    },
    icon: const Icon(Icons.logout_outlined, color: Colors.red,),
label: Text(
  "Sign Out",
  style: GoogleFonts.poppins(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 14),
),
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 90, // Increased slightly so the button has nice inner padding
        vertical: 10,
      ),
      side: const BorderSide(color: Colors.red),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
)
  ],
),
    ),
    ),
    
    );
    
  }
}
// import 'dart:io';

// import 'package:fasthub/models/campus_post.dart';
// import 'package:fasthub/providers/post_provider.dart';
// import 'package:fasthub/providers/setting_provider.dart';
// import 'package:fasthub/screen/Createpost/createpost.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

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
// }

// class Detailscreen extends StatefulWidget {
//   final CampusPost post ;
  
//   const Detailscreen({super.key, required this.post});

//   @override
//   State<Detailscreen> createState() => _DetailscreenState();
// }

                                                   
// class _DetailscreenState extends State<Detailscreen> { 

//   @override
//   Widget build(BuildContext context) {
//        final CampusPost currentpost=widget.post;
// final postprovider = context.watch<PostProvider>();
// final user = context.watch<SettingProvider>();
// final isDark = user.isdarkmode;
    
//     return Scaffold(
//       backgroundColor: isDark
//       ? const Color(0xFF121212)
//       : const Color(0xFFF5F7FA),
//       appBar: AppBar(
// backgroundColor: isDark
//     ? const Color(0xFF081426)
//     : const Color(0xFF0D1B4C),  // navy, matches Feed/Login
//   title: Text(
//     'Post Details',
//     style: GoogleFonts.poppins(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 18,
//     ),
//   ),
//   iconTheme: const IconThemeData(color: Colors.white),  // makes the back arrow white too
// ),
// body:

// Column(
//   children: [
//     SizedBox(height: 10),
//     Opacity(
//   opacity: widget.post.isresolved ? 0.3 : 1.0,
//   child: 
//     Stack(
//       children: [
//     Card(
//       color: isDark
//       ? const Color(0xFF1E293B)
//       : Colors.white,
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),

//       ),
//       clipBehavior: Clip.antiAlias,
//       child: SizedBox(
//          width: double.infinity,
//     height: 250,
//     child: 
//       widget.post.imagePath!=null? Image.file(
//                       File(widget.post.imagePath!),
//                       fit: BoxFit.cover,
//                     )
//                   : Container(
//                     color: isDark
//     ? const Color(0xFF334155)
//     : Colors.grey[200],
//                       child: Icon(
//   Icons.image_not_supported,
//   size: 60,
//   color: isDark
//       ? Colors.white54
//       : Colors.grey,
// ),
//                     ),
//       ),
//     ),

//     Positioned(
//       left: 10,
//       bottom: 10,
      
//       child: 
//      Container(
//               padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
//               decoration: BoxDecoration(
//                 color: getCategoryColor(widget.post.category).withValues(alpha: 0.15),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child:  Text(
//                 widget.post.category,
//                 style: TextStyle(
//                   color: getCategoryColor(widget.post.category),
//                   fontWeight: FontWeight.w600,
//                   fontSize: 11,
//                 ),
//               ),
//             ),
//     ),
//   ],
// ),
// ),
// Expanded(child: SingleChildScrollView(
//   padding: EdgeInsets.all(16),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.stretch,
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//      Text(
//   widget.post.title,
//   style: GoogleFonts.poppins(
//     fontSize: 22,
//     fontWeight: FontWeight.bold,
//     color: isDark
//         ? Colors.white
//         : const Color(0xFF0D1B4C),
//   ),
// ),
//               if (widget.post.isresolved)
//   const Padding(
//     padding: EdgeInsets.only(top: 4),
//     child: Text(
//       "RESOLVED",
//       style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 11),
//     ),
//   ),
//         const SizedBox(height: 4),

//         // Price — only if it's a Sale post
//         if (widget.post.price != null)
//           Text(
//             "Rs. ${widget.post.price!.toStringAsFixed(0)}",
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),

//         const SizedBox(height: 10),

//         // Description
//         Text(
//           widget.post.description,
//           style: GoogleFonts.poppins(
//             fontSize: 14,
//         color: isDark
//     ? Colors.white70
//     : Colors.grey[800],
//             height: 1.4,
//           ),
//         ),
//         Text(
//   "Posted on ${widget.post.createdAt.day}/${widget.post.createdAt.month}/${widget.post.createdAt.year}",
//   style: TextStyle(fontSize: 12,color: isDark
//     ? Colors.white54
//     : Colors.grey[500], ),
// ),

//         const SizedBox(height: 10),
//      Divider(
//   thickness: 2,
//   color: isDark
//       ? Colors.white24
//       : Colors.black12,
// ),
//         const SizedBox(height: 8),

//         // Contact Section header
//         Text(
//           "Contact Section",
//           style: GoogleFonts.poppins(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//       color: isDark
//     ? const Color(0xFF64B5F6)
//     : const Color(0xFF0D1B4C),
//           ),
//         ),
//         const SizedBox(height: 8),

//         // Posted by name
//         Row(
//           children: [
//             Icon(Icons.person_outline, size: 18, color: isDark
//     ? Colors.white70
//     : Colors.grey[600],),
//             const SizedBox(width: 8),
//             Text(
//               widget.post.postedByName,
//              style: TextStyle(
//   fontSize: 14,
//   fontWeight: FontWeight.w600,
//   color: isDark
//       ? Colors.white
//       : Colors.black87,
// ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 6),

//         // Email
//        GestureDetector(
//   onTap: () async {
//     final Uri emailUri = Uri(
//       scheme: 'mailto',
//       path: widget.post.postedByEmail,
//       query: 'subject=Regarding your ${widget.post.category} post: ${widget.post.title}',
//     );

//     if (await canLaunchUrl(emailUri)) {
//       await launchUrl(emailUri);
//     }
//   },
  
//   child: Row(
//     children: [
//       Icon(Icons.email_outlined, size: 18, color: isDark
//     ? Colors.white70
//     : Colors.grey[600],),
//       const SizedBox(width: 8),
//       Text(
//         widget.post.postedByEmail,
//        style: TextStyle(
//   fontSize: 14,
//   decoration: TextDecoration.underline,
//   color: isDark
//       ? const Color(0xFF64B5F6)
//       : Colors.black87,
// ),
//       ),
//       const SizedBox(width: 6),
//       Text(
//         "(tap to contact)",
//         style: TextStyle(fontSize: 11, color: isDark
//     ? Colors.white54
//     : Colors.grey[500], fontStyle: FontStyle.italic),
//       ),
//     ],
//   ),
// ),
//         const SizedBox(height: 6),

//         // Roll number
//         Row(
//           children: [
//             Icon(Icons.badge_outlined, size: 18, color: isDark
//     ? Colors.white70
//     : Colors.grey[600],),
//             const SizedBox(width: 8),
//             Text(
//               widget.post.rollno,
//               style: TextStyle(
//   fontSize: 14,
//   color: isDark
//       ? Colors.white
//       : Colors.black87,
// ),
//             ),
//           ],
//         ),
//         SizedBox(height: 20),
//         if(user.userEmail==widget.post.postedByEmail)
//         ElevatedButton.icon(
//   onPressed: () {  
//      Navigator.push(context, MaterialPageRoute(builder: (_)=> Createpost(currentpost: widget.post),));
  
//   },
//   style: ElevatedButton.styleFrom(backgroundColor: isDark
//     ? const Color(0xFF2563EB)
//     : const Color(0xFF0D1B4C),),
//   icon: const Icon(Icons.check_circle_outline, color: Colors.white),
//   label: const Text("Edit Post", style: TextStyle(color: Colors.white)),
// ),
//     SizedBox(height: 20),
// if(user.userEmail==widget.post.postedByEmail)
// // Primary action — filled, solid, stands out

// ElevatedButton.icon(
//   onPressed: () {  
//     postprovider.togglePost(widget.post.id);
  
//   },
//   style: ElevatedButton.styleFrom(backgroundColor: isDark
//     ? const Color(0xFF2563EB)
//     : const Color(0xFF0D1B4C),),
//   icon: const Icon(Icons.check_circle_outline, color: Colors.white),
//   label: const Text("Mark as Resolved", style: TextStyle(color: Colors.white)),
// ),
// SizedBox(height: 10),
// if(user.userEmail==widget.post.postedByEmail)
//   OutlinedButton.icon(
//     onPressed: () {
//       postprovider.deletePost(widget.post.id);
//       Navigator.pop(context);
//     },
//   style: OutlinedButton.styleFrom(
//   foregroundColor: Colors.red,
//   side: const BorderSide(color: Colors.red),
// ),
//     icon: const Icon(Icons.delete_outline),
//     label: const Text("Delete Post"),
//   ),

// // Secondary/destructive action — outlined, red, less visually dominant

//     ],
//   ),
// )
// ),
//   ],
// )
//     );
    
//   }
// }
import 'package:fasthub/models/campus_post.dart';
import 'package:fasthub/providers/post_provider.dart';
import 'package:fasthub/providers/setting_provider.dart';
import 'package:fasthub/screen/Createpost/createpost.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

class Detailscreen extends StatefulWidget {
  final CampusPost post ;
  
  const Detailscreen({super.key, required this.post});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

                                                   
class _DetailscreenState extends State<Detailscreen> { 
@override
void initState() {
  super.initState();
  final settings = context.read<SettingProvider>();
  if (widget.post.postedByEmail != settings.userEmail) {
    context.read<PostProvider>().incrementViews(widget.post.id);
  }
}
  @override
  Widget build(BuildContext context) {
       final CampusPost currentpost=widget.post;
final postprovider = context.watch<PostProvider>();
final user = context.watch<SettingProvider>();
final isDark = user.isdarkmode;
    
    return Scaffold(
      backgroundColor: isDark
      ? const Color(0xFF121212)
      : const Color(0xFFF5F7FA),
      appBar: AppBar(
backgroundColor: isDark
    ? const Color(0xFF081426)
    : const Color(0xFF0D1B4C),  // navy, matches Feed/Login
  title: Text(
    'Post Details',
    style: GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),  // makes the back arrow white too
),
body:

Column(
  children: [
    SizedBox(height: 10),
    Opacity(
  opacity: widget.post.isresolved ? 0.3 : 1.0,
  child: 
    Stack(
      children: [
    Card(
      color: isDark
      ? const Color(0xFF1E293B)
      : Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),

      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
         width: double.infinity,
    height: 250,
    child: 
      widget.post.imagePath!=null? Image.network(
                      widget.post.imagePath!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: progress.expectedTotalBytes != null
                                ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: isDark
                            ? const Color(0xFF334155)
                            : Colors.grey[200],
                        child: Icon(
                          Icons.image_not_supported,
                          size: 60,
                          color: isDark ? Colors.white54 : Colors.grey,
                        ),
                      ),
                    )
                  : Container(
                    color: isDark
    ? const Color(0xFF334155)
    : Colors.grey[200],
                      child: Icon(
  Icons.image_not_supported,
  size: 60,
  color: isDark
      ? Colors.white54
      : Colors.grey,
),
                    ),
      ),
    ),

    Positioned(
      left: 10,
      bottom: 10,
      
      child: 
     Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
              decoration: BoxDecoration(
                color: getCategoryColor(widget.post.category).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Text(
                widget.post.category,
                style: TextStyle(
                  color: getCategoryColor(widget.post.category),
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ),
    ),
  ],
),
),
Expanded(child: SingleChildScrollView(
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
//      Text(
//   widget.post.title,
//   style: GoogleFonts.poppins(
//     fontSize: 22,
//     fontWeight: FontWeight.bold,
//     color: isDark
//         ? Colors.white
//         : const Color(0xFF0D1B4C),
//   ),
// ),
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Text(
        widget.post.title,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : const Color(0xFF0D1B4C),
        ),
      ),
    ),
    Row(
      children: [
        Icon(
          Icons.visibility_outlined,
          size: 16,
          color: isDark ? Colors.white54 : Colors.grey[500],
        ),
        const SizedBox(width: 4),
        Text(
          "${widget.post.views}",
          style: TextStyle(
            fontSize: 13,
            color: isDark ? Colors.white54 : Colors.grey[500],
          ),
        ),
      ],
    ),
  ],
),
             if (widget.post.isresolved)
  Padding(
    padding: const EdgeInsets.only(top: 4),
    child: Text(
      widget.post.category == "Sale" ? "SOLD" : "RESOLVED",
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 11,
      ),
    ),
  ),
        const SizedBox(height: 4),

        // Price — only if it's a Sale post
        if (widget.post.price != null)
          Text(
            "Rs. ${widget.post.price!.toStringAsFixed(0)}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),

        const SizedBox(height: 10),

        // Description
        Text(
          widget.post.description,
          style: GoogleFonts.poppins(
            fontSize: 14,
        color: isDark
    ? Colors.white70
    : Colors.grey[800],
            height: 1.4,
          ),
        ),
        Text(
  "Posted on ${widget.post.createdAt.day}/${widget.post.createdAt.month}/${widget.post.createdAt.year}",
  style: TextStyle(fontSize: 12,color: isDark
    ? Colors.white54
    : Colors.grey[500], ),
),

        const SizedBox(height: 10),
     Divider(
  thickness: 2,
  color: isDark
      ? Colors.white24
      : Colors.black12,
),
        const SizedBox(height: 8),

        // Contact Section header
        Text(
          "Contact Section",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
      color: isDark
    ? const Color(0xFF64B5F6)
    : const Color(0xFF0D1B4C),
          ),
        ),
        const SizedBox(height: 8),

        // Posted by name
        Row(
          children: [
            Icon(Icons.person_outline, size: 18, color: isDark
    ? Colors.white70
    : Colors.grey[600],),
            const SizedBox(width: 8),
            Text(
              widget.post.postedByName,
             style: TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: isDark
      ? Colors.white
      : Colors.black87,
),
            ),
          ],
        ),
        const SizedBox(height: 6),

        // Email
       GestureDetector(
  onTap: () async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: widget.post.postedByEmail,
      query: 'subject=Regarding your ${widget.post.category} post: ${widget.post.title}',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  },
  
  child: Row(
    children: [
      Icon(Icons.email_outlined, size: 18, color: isDark
    ? Colors.white70
    : Colors.grey[600],),
      const SizedBox(width: 8),
      Text(
        widget.post.postedByEmail,
       style: TextStyle(
  fontSize: 14,
  decoration: TextDecoration.underline,
  color: isDark
      ? const Color(0xFF64B5F6)
      : Colors.black87,
),
      ),
      const SizedBox(width: 6),
      Text(
        "(tap to contact)",
        style: TextStyle(fontSize: 11, color: isDark
    ? Colors.white54
    : Colors.grey[500], fontStyle: FontStyle.italic),
      ),
    ],
  ),
),
        const SizedBox(height: 6),

        // Roll number
        Row(
          children: [
            Icon(Icons.badge_outlined, size: 18, color: isDark
    ? Colors.white70
    : Colors.grey[600],),
            const SizedBox(width: 8),
            Text(
              widget.post.rollno,
              style: TextStyle(
  fontSize: 14,
  color: isDark
      ? Colors.white
      : Colors.black87,
),
            ),
          ],
        ),
        SizedBox(height: 20),
        if(user.userEmail==widget.post.postedByEmail)
        ElevatedButton.icon(
  onPressed: () {  
     Navigator.push(context, MaterialPageRoute(builder: (_)=> Createpost(currentpost: widget.post),));
  
  },
  style: ElevatedButton.styleFrom(backgroundColor: isDark
    ? const Color(0xFF2563EB)
    : const Color(0xFF0D1B4C),),
  icon: const Icon(Icons.check_circle_outline, color: Colors.white),
  label: const Text("Edit Post", style: TextStyle(color: Colors.white)),
),
    SizedBox(height: 16),
if(user.userEmail==widget.post.postedByEmail)
// Primary action — filled, solid, stands out

ElevatedButton.icon(
  onPressed: () {  
    postprovider.togglePost(widget.post.id);
  
  },
  style: ElevatedButton.styleFrom(backgroundColor: isDark
    ? const Color(0xFF2563EB)
    : const Color(0xFF0D1B4C),),
  icon: const Icon(Icons.check_circle_outline, color: Colors.white),
  label: Text(
  widget.post.category == "Sale"
      ? "Mark as Sold"
      : "Mark as Resolved",
  style: const TextStyle(color: Colors.white),
),
),
SizedBox(height: 15),
if(user.userEmail==widget.post.postedByEmail)
  OutlinedButton.icon(
    onPressed: () {
      postprovider.deletePost(widget.post.id);
      Navigator.pop(context);
    },
  style: OutlinedButton.styleFrom(
  foregroundColor: Colors.red,
  side: const BorderSide(color: Colors.red),
),
    icon: const Icon(Icons.delete_outline),
    label: const Text("Delete Post"),
  ),

// Secondary/destructive action — outlined, red, less visually dominant

    ],
  ),
)
),
  ],
)
    );
    
  }
}
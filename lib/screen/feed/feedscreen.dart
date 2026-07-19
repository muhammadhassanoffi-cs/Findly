
// // import 'package:fasthub/providers/post_provider.dart';
// // import 'package:fasthub/screen/Detailscreen/detailscreen.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:provider/provider.dart';
// // import 'dart:io';
// // import 'package:fasthub/providers/setting_provider.dart';
// // class Feedscreen extends StatefulWidget {
// //   const Feedscreen({super.key});

// //   @override
// //   State<Feedscreen> createState() => _FeedscreenState();
// // }

// // class _FeedscreenState extends State<Feedscreen> {
// //   Color getCategoryColor(String category) {
// //   switch (category) {
// //     case "Lost":
// //       return Colors.red;
// //     case "Found":
// //       return Colors.green;
// //     case "Sale":
// //       return Colors.orange;
// //     default:
// //       return Colors.grey;
// //   }
// // }
// // int _getColumnCount(BuildContext context)
// // {
// //   double width=MediaQuery.of(context).size.width;
// //   if(width>=1200) return 5;
// //   if(width>=900) return 4;
// //   if(width>=600) return 3;
// //   return 2;
// // }

// //   @override
// //   Widget build(BuildContext context) {
// //    final postprovider = context.watch<PostProvider>();
// // final settings = context.watch<SettingProvider>();
// // final isDark = settings.isdarkmode;

// // final post = postprovider.filteredItems;

// //     return Scaffold(
// //        backgroundColor: isDark
// //       ? const Color(0xFF121212)
// //       : const Color(0xFFF5F7FA),
// //          appBar: AppBar(
// //            toolbarHeight: 60,
// //      backgroundColor: isDark
// //     ? const Color(0xFF081426)
// //     : const Color(0xFF0D1B4C),  // navy
// //         title:
        
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
              
// //                       Text(
// //       'FAST Hub',
// //       style: GoogleFonts.poppins(
// //         color: Colors.white,
// //         fontWeight: FontWeight.bold,
// //         fontSize: 20,
// //         letterSpacing: 0.5,
// //       ),
// //     ),
// //               CircleAvatar(
// //                 radius: 20,
// //                 backgroundImage: AssetImage('assets/images/logo.png'),

// //               ),
// //             ]
// //         ),

// //       centerTitle: false,   // or true, depending on preference
// //     elevation: 2, 
// //       ),
// //       body: Column(
// //         children: [
// //           SizedBox(height: 10),
// //        SingleChildScrollView(
// //         scrollDirection: Axis.horizontal,
// //         child: 
// //              Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //               children: ["All","Lost", "Found", "Sale"].map((category) {
// //                 final selected = postprovider.selestedtype == category;
// //                 return Padding(
// //                   padding: const EdgeInsets.only(right: 8),
// //                   child: ChoiceChip(
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(24),
// //                     ),
// //                     label: Text(category, style: TextStyle(
// //       color: selected
// //           ? Colors.white
// //           : (isDark ? Colors.white70 : Colors.black87),
// //     ),),
// //                     selected: selected,
// //                     selectedColor: isDark
// //       ? const Color(0xFF2563EB)
// //       : const Color(0xFF0D1B4C),
// //   backgroundColor: isDark
// //       ? const Color(0xFF1E293B)
// //       : Colors.grey.shade200,
// //                     onSelected: (_) {
// //                       postprovider.setCategory(category);
// //                     },
// //                   ),
// //                 );
// //               }).toList(),
// //             ),
// //       ),
// //             SizedBox(height: 20),
// //         Expanded(child:   postprovider.isloading
// //       ? const Center(
// //           child: CircularProgressIndicator(),
// //         ):
// //       post.isEmpty
// //     ? Center(
// //         child: Text(
// //           'No posts yet',
// //           style: GoogleFonts.poppins(
// //             fontSize: 16,
// //          color: isDark
// //     ? Colors.white60
// //     : Colors.grey[500],
// //             fontWeight: FontWeight.w500,
// //           ),
// //         ),
// //       ):
// //         GridView.builder(
// //           padding: const EdgeInsets.all(12),
// //           itemCount: postprovider.filteredItems.length,
// //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _getColumnCount(context),
// //           crossAxisSpacing: 12,
// //             mainAxisSpacing: 12,
// //                       childAspectRatio: 0.50,
// //                       mainAxisExtent: 280,
// //           ),
          
// //            itemBuilder:(context,index)
// //            {
// //             final post=postprovider.filteredItems[index];

// //             return InkWell(
// //               onTap: ()
// //               {
// //                 Navigator.push(context, MaterialPageRoute(builder: (_)=> Detailscreen(post: post)),);
// //               },

            
            
// //             child:
// //             Opacity(
// //   opacity: post.isresolved ? 0.3 : 1.0,
// //   child: 
// //              Card(
// //                color: isDark
// //       ? const Color(0xFF1E293B)
// //       : Colors.white,
// //   elevation: 2,
// //   shape: RoundedRectangleBorder(
// //     borderRadius: BorderRadius.circular(16),
// //   ),
// //   clipBehavior: Clip.antiAlias, // keeps image corners rounded too
// //   child: Column(
// //     crossAxisAlignment: CrossAxisAlignment.start,  // ← fixes centering issue
// //     mainAxisSize: MainAxisSize.min,
// //     children: [

// //       SizedBox(
// //         width: double.infinity,
// //         height: 120,
// //         child: post.imagePath == null
// //             ? Icon(
// //   Icons.image,
// //   size: 50,
// //   color: isDark
// //       ? Colors.white54
// //       : Colors.grey[400],
// // )
// //             : Image.file(
// //                 File(post.imagePath!),
// //                 fit: BoxFit.cover,
// //               ),
// //       ),

// //       Padding(  // ← wraps all text content with proper spacing
// //         padding: const EdgeInsets.all(8),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           mainAxisSize: MainAxisSize.min,
// //           children: [

// //             Container(
// //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
// //               decoration: BoxDecoration(
// //                 color: getCategoryColor(post.category).withValues(alpha: 0.15),
// //                 borderRadius: BorderRadius.circular(20),
// //               ),
// //               child: Text(
// //                 post.category,
// //                 style: TextStyle(
// //                   color: getCategoryColor(post.category),
// //                   fontWeight: FontWeight.w600,
// //                   fontSize: 11,
// //                 ),
// //               ),
// //             ),
// //             if (post.isresolved)
// //   const Padding(
// //     padding: EdgeInsets.only(top: 4),
// //     child: Text(
// //       "RESOLVED",
// //       style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 11),
// //     ),
// //   ),
// //             const SizedBox(height: 6),  // gap after badge

// //             Text(
// //               post.title,
// //               maxLines: 1,
// //               overflow: TextOverflow.ellipsis,
// //               style: TextStyle(
// //   color: isDark
// //       ? Colors.white
// //       : Colors.black87,
// //   fontWeight: FontWeight.bold,
// //   fontSize: 13,
// // ),
// //             ),
// //             const SizedBox(height: 2),

// //             Text(
// //               post.postedByName,
// //               maxLines: 1,
// //               overflow: TextOverflow.ellipsis,
// //               style: TextStyle(fontSize: 11,color: isDark
// //     ? Colors.white70
// //     : Colors.grey[600]),
// //             ),
            
// //             Text(
// //               post.rollno,
// //               maxLines: 1,
// //               overflow: TextOverflow.ellipsis,
// //               style: TextStyle(fontSize: 11,color: isDark
// //     ? Colors.white70
// //     : Colors.grey[600] ),
// //             ),

// //             if (post.price != null)
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 4),
// //                 child: Text(
// //                   "Rs. ${post.price!.toStringAsFixed(0)}",
// //                   style: const TextStyle(
// //                     color: Colors.green,
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 12,
// //                   ),
// //                 ),
                
// //               ),
// //             Divider(
// //   color: isDark
// //       ? Colors.white24
// //       : Colors.black12,
// // ),
// //           Row(
// //   children: [
// //     Icon(
// //       Icons.calendar_today,
// //       size: 12,
// //     color: isDark
// //     ? Colors.white60
// //     : Colors.grey,
// //     ),
// //     const SizedBox(width: 4),
// //     Expanded(child: 
// //     Text(
// //       "${post.createdAt.day}/${post.createdAt.month}/${post.createdAt.year}",
// //      style: TextStyle(
// //   color: isDark
// //       ? Colors.white70
// //       : Colors.black87,
// //   fontSize: 10,
// //   fontWeight: FontWeight.bold,
// // ),
// //     ),
// //           ),
// //   ],
// // )
// //           ],
// //         ),
// //       ),
// //     ],
// //   ),
// // ),
// //             ),
// //         );
// //             // return PostCard(
// //             //   post:post,
// //             // );
// //            })
// //         ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:fasthub/providers/post_provider.dart';
// import 'package:fasthub/screen/Detailscreen/detailscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:fasthub/providers/setting_provider.dart';
// class Feedscreen extends StatefulWidget {
//   const Feedscreen({super.key});

//   @override
//   State<Feedscreen> createState() => _FeedscreenState();
// }

// class _FeedscreenState extends State<Feedscreen> {
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
// int _getColumnCount(BuildContext context)
// {
//   double width=MediaQuery.of(context).size.width;
//   if(width>=1200) return 5;
//   if(width>=900) return 4;
//   if(width>=600) return 3;
//   return 2;
// }

//   @override
//   Widget build(BuildContext context) {
//    final postprovider = context.watch<PostProvider>();
// final settings = context.watch<SettingProvider>();
// final isDark = settings.isdarkmode;

// final post = postprovider.filteredItems;

//     return Scaffold(
//        backgroundColor: isDark
//       ? const Color(0xFF121212)
//       : const Color(0xFFF5F7FA),
//          appBar: AppBar(
//            toolbarHeight: 60,
//      backgroundColor: isDark
//     ? const Color(0xFF081426)
//     : const Color(0xFF0D1B4C),  // navy
//         title:
        
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
              
//                       Text(
//       'FAST Hub',
//       style: GoogleFonts.poppins(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 20,
//         letterSpacing: 0.5,
//       ),
//     ),
//               CircleAvatar(
//                 radius: 20,
//                 backgroundImage: AssetImage('assets/images/logo.png'),

//               ),
//             ]
//         ),

//       centerTitle: false,   // or true, depending on preference
//     elevation: 2, 
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10),
//        SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: 
//              Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//               children: ["All","Lost", "Found", "Sale"].map((category) {
//                 final selected = postprovider.selestedtype == category;
//                 return Padding(
//                   padding: const EdgeInsets.only(right: 8),
//                   child: ChoiceChip(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//                     label: Text(category, style: TextStyle(
//       color: selected
//           ? Colors.white
//           : (isDark ? Colors.white70 : Colors.black87),
//     ),),
//                     selected: selected,
//                     selectedColor: isDark
//       ? const Color(0xFF2563EB)
//       : const Color(0xFF0D1B4C),
//   backgroundColor: isDark
//       ? const Color(0xFF1E293B)
//       : Colors.grey.shade200,
//                     onSelected: (_) {
//                       postprovider.setCategory(category);
//                     },
//                   ),
//                 );
//               }).toList(),
//             ),
//       ),
//             SizedBox(height: 20),
//         Expanded(
          
//           child:   postprovider.isloading
//       ? const Center(
//           child: CircularProgressIndicator(),
//         ):
        
//       post.isEmpty
//     ? Center(
//         child: Text(
//           'No posts yet',
//           style: GoogleFonts.poppins(
//             fontSize: 16,
//          color: isDark
//     ? Colors.white60
//     : Colors.grey[500],
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ):
//         GridView.builder(
//           padding: const EdgeInsets.all(12),
//           itemCount: postprovider.filteredItems.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _getColumnCount(context),
//           crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//                       childAspectRatio: 0.50,
//                       mainAxisExtent: 290,
//           ),
          
//            itemBuilder:(context,index)
//            {
//             final post=postprovider.filteredItems[index];

//             return InkWell(
//               onTap: ()
//               {
//                 Navigator.push(context, MaterialPageRoute(builder: (_)=> Detailscreen(post: post)),);
//               },

            
            
//             child:
//             Opacity(
//   opacity: post.isresolved ? 0.3 : 1.0,
//   child: 
//              Card(
//                color: isDark
//       ? const Color(0xFF1E293B)
//       : Colors.white,
//   elevation: 2,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(16),
//   ),
//   clipBehavior: Clip.antiAlias, // keeps image corners rounded too
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,  // ← fixes centering issue
//     mainAxisSize: MainAxisSize.min,
//     children: [

//       SizedBox(
//         width: double.infinity,
//         height: 120,
//         child: post.imagePath == null
//             ? Icon(
//   Icons.image,
//   size: 50,
//   color: isDark
//       ? Colors.white54
//       : Colors.grey[400],
// )
//             : Image.network(
//                 post.imagePath!,
//                 fit: BoxFit.cover,
//                 loadingBuilder: (context, child, progress) {
//                   if (progress == null) return child;
//                   return Center(
//                     child: SizedBox(
//                       width: 20,
//                       height: 20,
//                       child: CircularProgressIndicator(strokeWidth: 2),
//                     ),
//                   );
//                 },
//                 errorBuilder: (context, error, stackTrace) => Icon(
//                   Icons.image_not_supported,
//                   size: 50,
//                   color: isDark ? Colors.white54 : Colors.grey[400],
//                 ),
//               ),
//       ),
// Expanded(child: 
//       Padding(  // ← wraps all text content with proper spacing
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [

//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//               decoration: BoxDecoration(
//                 color: getCategoryColor(post.category).withValues(alpha: 0.15),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 post.category,
//                 style: TextStyle(
//                   color: getCategoryColor(post.category),
//                   fontWeight: FontWeight.w600,
//                   fontSize: 11,
//                 ),
//               ),
//             ),
//             if (post.isresolved)
//   const Padding(
//     padding: EdgeInsets.only(top: 4),
//     child: Text(
//       "RESOLVED",
//       style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 11),
//     ),
//   ),
//             const SizedBox(height: 6),  // gap after badge

//             Text(
//               post.title,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//   color: isDark
//       ? Colors.white
//       : Colors.black87,
//   fontWeight: FontWeight.bold,
//   fontSize: 13,
// ),
//             ),
//             const SizedBox(height: 2),

//     //         Text(
//     //           post.postedByName,
//     //           maxLines: 1,
//     //           overflow: TextOverflow.ellipsis,
//     //           style: TextStyle(fontSize: 11,color: isDark
//     // ? Colors.white70
//     // : Colors.grey[600]),
//     //         ),
            
//     //         Text(
//     //           post.rollno,
//     //           maxLines: 1,
//     //           overflow: TextOverflow.ellipsis,
//     //           style: TextStyle(fontSize: 11,color: isDark
//     // ? Colors.white70
//     // : Colors.grey[600] ),
//     //         ),
//     Text(
//   "${post.postedByName} • ${post.rollno}",
//   maxLines: 1,
//   overflow: TextOverflow.ellipsis,
//   style: TextStyle(fontSize: 11, color: isDark ? Colors.white70 : Colors.grey[600]),
// ),

//             if (post.price != null)
//               Padding(
//                 padding: const EdgeInsets.only(top: 4),
//                 child: Text(
//                   "Rs. ${post.price!.toStringAsFixed(0)}",
//                   style: const TextStyle(
//                     color: Colors.green,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 ),
                
//               ),
//             Divider(
//   color: isDark
//       ? Colors.white24
//       : Colors.black12,
// ),
//           Row(
//   children: [
//     Icon(
//       Icons.calendar_today,
//       size: 12,
//     color: isDark
//     ? Colors.white60
//     : Colors.grey,
//     ),
//     const SizedBox(width: 4),
//     Expanded(child: 
//     Text(
//       "${post.createdAt.day}/${post.createdAt.month}/${post.createdAt.year}",
//      style: TextStyle(
//   color: isDark
//       ? Colors.white70
//       : Colors.black87,
//   fontSize: 10,
//   fontWeight: FontWeight.bold,
// ),
//     ),
//           ),
//   ],
// )
//           ],
//         ),
//       ),
//   ),
//     ],
//   ),
// ),
//             ),
//         );
//             // return PostCard(
//             //   post:post,
//             // );
//            })
//         ),
//         ],
//       ),
//     );
//   }
// }
import 'package:fasthub/providers/post_provider.dart';
import 'package:fasthub/screen/Detailscreen/detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:fasthub/providers/setting_provider.dart';
class Feedscreen extends StatefulWidget {
  const Feedscreen({super.key});

  @override
  State<Feedscreen> createState() => _FeedscreenState();
}

class _FeedscreenState extends State<Feedscreen> {
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
int _getColumnCount(BuildContext context)
{
  double width=MediaQuery.of(context).size.width;
  if(width>=1200) return 5;
  if(width>=900) return 4;
  if(width>=600) return 3;
  return 2;
}

  @override
  Widget build(BuildContext context) {
   final postprovider = context.watch<PostProvider>();
final settings = context.watch<SettingProvider>();
final isDark = settings.isdarkmode;

final post = postprovider.filteredItems;

    return Scaffold(
       backgroundColor: isDark
      ? const Color(0xFF121212)
      : const Color(0xFFF5F7FA),
         appBar: AppBar(
           toolbarHeight: 60,
     backgroundColor: isDark
    ? const Color(0xFF081426)
    : const Color(0xFF0D1B4C),  // navy
        title:
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
                      Text(
      'FINDLY',
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        letterSpacing: 0.5,
      ),
    ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/logo.png'),

              ),
            ]
        ),

      centerTitle: false,   // or true, depending on preference
    elevation: 2, 
      ),
      body: Column(
        children: [
          SizedBox(height: 12),
       SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: 
             Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: ["All","Lost", "Found", "Sale"].map((category) {
                final selected = postprovider.selestedtype == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    label: Text(category, style: TextStyle(
      color: selected
          ? Colors.white
          : (isDark ? Colors.white70 : Colors.black87),
    ),),
                    selected: selected,
                    selectedColor: isDark
      ? const Color(0xFF2563EB)
      : const Color(0xFF0D1B4C),
  backgroundColor: isDark
      ? const Color(0xFF1E293B)
      : Colors.grey.shade200,
                    onSelected: (_) {
                      postprovider.setCategory(category);
                    },
                  ),
                );
              }).toList(),
            ),
      ),
            SizedBox(height: 20),
        Expanded(
          child: postprovider.isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => postprovider.loadPosts(),
                child: post.isEmpty
                  ? ListView(
                      // Wrapping the empty-state text in a scrollable ListView (instead of a
                      // plain centered Text) so pull-to-refresh still works even with no posts.
                      children: [
                        SizedBox(height: 200),
                        Center(
                          child: Text(
                            'No posts yet',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: isDark ? Colors.white60 : Colors.grey[500],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: postprovider.filteredItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _getColumnCount(context),
                      crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                                  childAspectRatio: 0.50,
                                  mainAxisExtent: 290,
                      ),

                       itemBuilder:(context,index)
                       {
                        final post=postprovider.filteredItems[index];

                        return InkWell(
                          onTap: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> Detailscreen(post: post)),);
                          },



                        child:
                        Opacity(
              opacity: post.isresolved ? 0.3 : 1.0,
              child:
                         Card(
                           color: isDark
                  ? const Color(0xFF1E293B)
                  : Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias, // keeps image corners rounded too
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,  // ← fixes centering issue
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: post.imagePath == null
                        ? Icon(
              Icons.image,
              size: 50,
              color: isDark
                  ? Colors.white54
                  : Colors.grey[400],
            )
                        : Image.network(
                            post.imagePath!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return Center(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: isDark ? Colors.white54 : Colors.grey[400],
                            ),
                          ),
                  ),
            Expanded(child:
                  Padding(  // ← wraps all text content with proper spacing
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        // Container(
                        //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        //   decoration: BoxDecoration(
                        //     color: getCategoryColor(post.category).withValues(alpha: 0.15),
                        //     borderRadius: BorderRadius.circular(20),
                        //   ),
                        //   child: Text(
                        //     post.category,
                        //     style: TextStyle(
                        //       color: getCategoryColor(post.category),
                        //       fontWeight: FontWeight.w600,
                        //       fontSize: 11,
                        //     ),
                        //   ),
                        // ),
                        Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: getCategoryColor(post.category).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        post.category,
        style: TextStyle(
          color: getCategoryColor(post.category),
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    ),
    Row(
      children: [
        Icon(
          Icons.visibility_outlined,
          size: 13,
          color: isDark ? Colors.white60 : Colors.grey,
        ),
        const SizedBox(width: 3),
        Text(
          "${post.views}",
          style: TextStyle(
            fontSize: 11,
            color: isDark ? Colors.white70 : Colors.grey[600],
          ),
        ),
      ],
    ),
  ],
),
                       if (post.isresolved)
  Padding(
    padding: const EdgeInsets.only(top: 4),
    child: Text(
      post.category == "Sale" ? "SOLD" : "RESOLVED",
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 11,
      ),
    ),
  ),
                        const SizedBox(height: 6),  // gap after badge

                        Text(
                          post.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
              color: isDark
                  ? Colors.white
                  : Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
                        ),
                        const SizedBox(height: 2),

                Text(
              "${post.postedByName} • ${post.rollno}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 11, color: isDark ? Colors.white70 : Colors.grey[600]),
            ),

                        if (post.price != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              "Rs. ${post.price!.toStringAsFixed(0)}",
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),

                          ),
                        Divider(
              color: isDark
                  ? Colors.white24
                  : Colors.black12,
            ),
                      Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 12,
                color: isDark
                ? Colors.white60
                : Colors.grey,
                ),
                const SizedBox(width: 4),
                Expanded(child:
                Text(
                  "${post.createdAt.day}/${post.createdAt.month}/${post.createdAt.year}",
                 style: TextStyle(
              color: isDark
                  ? Colors.white70
                  : Colors.black87,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
                ),
                      ),
              ],
            )
                      ],
                    ),
                  ),
              ),
                ],
              ),
            ),
                        ),
                        );
                            // return PostCard(
                            //   post:post,
                            // );
                           }),
              ),
        ),
        ],
      ),
    );
  }
}
// import 'dart:convert';

// import 'package:fasthub/models/campus_post.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class PostProvider extends ChangeNotifier {
// final _supabase=Supabase.instance.client;
//   List<CampusPost> _post=[];

//   String _selectedCategory='All';
//   bool _isLoading=false;
//   List<CampusPost> get allItems {
//     return _post;
//   }
//   String get selestedtype=>_selectedCategory;
//   bool get isloading=>_isLoading;
//     List<CampusPost> get filteredItems{
//       if(_selectedCategory=='All')
//       {
//         return _post;
//       }
//       else{
//         return _post.where((item)=> item.category==_selectedCategory).toList();
//       }
//     }
//     Future<void> savePost()async{
//       final prefs=await SharedPreferences.getInstance();
//       final jsonstring=jsonEncode(_post.map((post)=> post.toJson()).toList());
//      await  prefs.setString('posts', jsonstring);

//     }
//   List<CampusPost> GetMyPost(String email){
//     return _post.where((item)=> item.postedByEmail==email ).toList();
//   }

//   void addPost(CampusPost post) async
//   {
//       //  _post.insert(0, post);
//       //  notifyListeners();
//       //  savePost();
//       try{
//         await  _supabase.from('posts').insert(post.toMap());
//         _post.insert(0,post);
//         notifyListeners();
//       }
//       catch(e)
//       {
//         print('Error adding post: $e');
//       }
//   }
//   void deletePost(String id)async
//   {
//     // _post.removeWhere((p)=> p.id==id);
//     // notifyListeners();
//     // savePost();
//     try{
//        await _supabase.from('posts').delete().eq('id', id);
//        _post.removeWhere((p)=>p.id==id);
//        notifyListeners();
//     }
//     catch(e)
//     {
//       print('Error Deleting post: $e');
//     }
//   }
//   void togglePost(String id)async
//   {
//     // final post=_post.firstWhere((p)=>p.id==id);
//     // post.isresolved=!post.isresolved;
//     // notifyListeners();
//     // savePost();
//     try {
//       final post = _post.firstWhere((p) => p.id == id);
//       final newvalue = !post.isresolved;

//       await _supabase
//           .from('posts')
//           .update({'is_resolved': newvalue})
//           .eq('id', id);
//     post.isresolved=newvalue;
//       notifyListeners();
//     } catch (e) {
//       print('Error toggling post: $e');
//     }
//   }
//   void setCategory(String category)
//   {
//     _selectedCategory=category;
//     notifyListeners();
//   }
//   Future<void> loadPosts()async{
//     try{
//       _isLoading=true;
//       notifyListeners();
//       final response= await _supabase.from('posts').select().order('created_at',ascending: false);
//       _post=(response as List).map((item)=> CampusPost.fromMap(item)).toList();

//     }
//     catch(e)
//     {
//       print('Error loading posts:$e');
//       await _loadFromLocal();
//     }finally{
//       _isLoading=false;
//       notifyListeners();
//     }
//     // final prefs= await SharedPreferences.getInstance();
//     // final jsonString=prefs.getString('posts');
//     // if(jsonString!=null)
//     // {
//     //   final List<dynamic> data=jsonDecode(jsonString);
//     //   _post=data.map((json)=> CampusPost.fromJson(json)).toList();
//     //   notifyListeners();
//     // }
//   }
//  Future<void> updatePost(CampusPost post) async {
//   // final index = _post.indexWhere((post) => post.id == updatedPost.id);

//   // if (index != -1) {
//   //   _post[index] = updatedPost;
//   //   await savePost();
//   //   notifyListeners();
//   // }
//   try {
//       await _supabase
//           .from('posts')
//           .update(post.toMap())
//           .eq('id', post.id);

//       final index = _post.indexWhere((p) => p.id == post.id);
//       if (index != -1) {
//         _post[index] = post;
//         notifyListeners();
//       }
//     } catch (e) {
//       print('Error updating post: $e');
//     }
// }
// Future<void> _loadFromLocal() async {
//     final prefs = await SharedPreferences.getInstance();
//     final jsonString = prefs.getString('posts');
//     if (jsonString != null) {
//       final List<dynamic> data = jsonDecode(jsonString);
//       _post = data.map((json) => CampusPost.fromJson(json)).toList();
//       notifyListeners();
//     }
//   }

// }
import 'dart:convert';
import 'dart:io';

import 'package:fasthub/models/campus_post.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostProvider extends ChangeNotifier {
final _supabase=Supabase.instance.client;
  List<CampusPost> _post=[];

  String _selectedCategory='All';
  bool _isLoading=false;
  List<CampusPost> get allItems {
    return _post;
  }
  String get selestedtype=>_selectedCategory;
  bool get isloading=>_isLoading;
    // List<CampusPost> get filteredItems{
    //   if(_selectedCategory=='All')
    //   {
    //     return _post;
    //   }
    //   else{
    //     return _post.where((item)=> item.category==_selectedCategory).toList();
    //   }
    // }
    // Future<void> savePost()async{
    //   final prefs=await SharedPreferences.getInstance();
    //   final jsonstring=jsonEncode(_post.map((post)=> post.toJson()).toList());
    //  await  prefs.setString('posts', jsonstring);

    // }
    List<CampusPost> get filteredItems {
  List<CampusPost> items;

  if (_selectedCategory == 'All') {
    items = List.from(_post);
  } else {
    items = _post
        .where((item) => item.category == _selectedCategory)
        .toList();
  }

  items.sort((a, b) {
    // Unresolved posts first
    if (a.isresolved != b.isresolved) {
      return a.isresolved ? 1 : -1;
    }

    // Within each group, newest posts first
    return b.createdAt.compareTo(a.createdAt);
  });

  return items;
}
  List<CampusPost> GetMyPost(String email){
    return _post.where((item)=> item.postedByEmail==email ).toList();
  }

  // Returns null on success, or a friendly error message on failure.
  Future<String?> addPost(CampusPost post) async
  {
      try{
        await  _supabase.from('posts').insert(post.toMap());
        _post.insert(0,post);
        notifyListeners();
        return null;
      }
      on SocketException {
        return "No internet connection. Please check your network and try again.";
      }
      catch(e)
      {
        print('Error adding post: $e');
        return "Couldn't save your post. Please try again.";
      }
  }

  // Returns null on success, or a friendly error message on failure.
  Future<String?> deletePost(String id)async
  {
    try{
       await _supabase.from('posts').delete().eq('id', id);
       _post.removeWhere((p)=>p.id==id);
       notifyListeners();
       return null;
    }
    on SocketException {
      return "No internet connection. Please check your network and try again.";
    }
    catch(e)
    {
      print('Error Deleting post: $e');
      return "Couldn't delete the post. Please try again.";
    }
  }

  // Returns null on success, or a friendly error message on failure.
  Future<String?> togglePost(String id)async
  {
    try {
      final post = _post.firstWhere((p) => p.id == id);
      final newvalue = !post.isresolved;

      await _supabase
          .from('posts')
          .update({'is_resolved': newvalue})
          .eq('id', id);
    post.isresolved=newvalue;
      notifyListeners();
      return null;
    }
    on SocketException {
      return "No internet connection. Please check your network and try again.";
    }
    catch (e) {
      print('Error toggling post: $e');
      return "Couldn't update the post status. Please try again.";
    }
  }
  Future<void> incrementViews(String postId) async {
  try {
    await _supabase.rpc('record_post_view', params: {'p_post_id': postId});

    final index = _post.indexWhere((p) => p.id == postId);
    if (index != -1) {
      _post[index] = _post[index].copyWith(views: _post[index].views + 1);
      notifyListeners();
    }
  } catch (e) {
    print('Error incrementing views: $e');
  }
}
  void setCategory(String category)
  {
    _selectedCategory=category;
    notifyListeners();
  }

  // Returns null on success, or a friendly error message on failure (falls back to local cache either way).
  Future<String?> loadPosts()async{
    try{
      _isLoading=true;
      notifyListeners();
      final response= await _supabase.from('posts').select().order('created_at',ascending: false);
      _post=(response as List).map((item)=> CampusPost.fromMap(item)).toList();
      return null;
    }
    on SocketException {
      await _loadFromLocal();
      return "No internet connection. Showing posts saved on this device.";
    }
    catch(e)
    {
      print('Error loading posts:$e');
      await _loadFromLocal();
      return "Couldn't refresh posts right now. Please try again.";
    }finally{
      _isLoading=false;
      notifyListeners();
    }
  }

  // Returns null on success, or a friendly error message on failure.
 Future<String?> updatePost(CampusPost post) async {
  try {
      await _supabase
          .from('posts')
          .update(post.toMap())
          .eq('id', post.id);

      final index = _post.indexWhere((p) => p.id == post.id);
      if (index != -1) {
        _post[index] = post;
        notifyListeners();
      }
      return null;
    }
    on SocketException {
      return "No internet connection. Please check your network and try again.";
    }
    catch (e) {
      print('Error updating post: $e');
      return "Couldn't update the post. Please try again.";
    }
}
Future<void> _loadFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('posts');
    if (jsonString != null) {
      final List<dynamic> data = jsonDecode(jsonString);
      _post = data.map((json) => CampusPost.fromJson(json)).toList();
      notifyListeners();
    }
  }

}
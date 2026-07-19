
class CampusPost{
   final String title;
   final  String id;
   final  String description;
   final  String category;  // lost found or sale
   final String postedByName;
   final String postedByEmail;
   final DateTime createdAt;
   final String? imagePath;
   final String rollno;
   final double? price;
   final int views;
   bool isresolved;

   CampusPost({required this.title, required this.id, required this.description, required this.category,
   required this.postedByName, required this.postedByEmail, required this.createdAt, this.imagePath,
   required this.rollno, this.price, this.isresolved=false,this.views = 0,});

   // convert to map because shared prefernces cannot unserstand our class
   Map<String , dynamic> toJson(){
      return {
      'title': title,
        'id': id,
        'description': description,
        'category': category,
        'postedByName': postedByName,
        'postedByEmail': postedByEmail,
        'createdAt': createdAt.toIso8601String(),
        'imagePath': imagePath,
        'rollno': rollno,
        'price': price,
        'isresolved': isresolved,
        'views': views,
      };
   }

   // rebuilt campus postobj when we load from shared preferences
   factory CampusPost.fromJson(Map<String ,dynamic> json){
      return CampusPost(

         title: json['title'],
      id: json['id'],
      description: json['description'],
      category: json['category'],
      postedByName: json['postedByName'],
      postedByEmail: json['postedByEmail'],
      createdAt: DateTime.parse(json['createdAt']),
      imagePath: json['imagePath'],
      rollno: json['rollno'],
      price: json['price'],
      isresolved: json['isresolved'],
      views: json['views'] ?? 0,
      );
   }
  
  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'title':title,
      'description':description,
      'category':category,
      'posted_by_name':postedByName,
      'posted_by_email':postedByEmail,
      'created_at': createdAt.toIso8601String(),
      'image_path': imagePath,
      'roll_no': rollno,
      'price': price,
      'is_resolved': isresolved,
      'views': views,
    };
  }
  factory CampusPost.fromMap(Map<String, dynamic> map)
  {
    return   CampusPost(
           id:map['id'],
           title:map['title'],
           description:map['description'],
        category: map['category'],
postedByName: map['posted_by_name'],
      postedByEmail: map['posted_by_email'],
      createdAt: DateTime.parse(map['created_at']),
      imagePath: map['image_path'],
      rollno: map['roll_no'],
      price: map['price'] != null
          ? (map['price'] as num).toDouble()
          : null,
      isresolved: map['is_resolved'] ?? false,
      views: map['views'] ?? 0,
    );
  }
  CampusPost copyWith({int? views, bool? isresolved}) {
  return CampusPost(
    title: title,
    id: id,
    description: description,
    category: category,
    postedByName: postedByName,
    postedByEmail: postedByEmail,
    createdAt: createdAt,
    imagePath: imagePath,
    rollno: rollno,
    price: price,
    isresolved: isresolved ?? this.isresolved,
    views: views ?? this.views,
  );
}

}

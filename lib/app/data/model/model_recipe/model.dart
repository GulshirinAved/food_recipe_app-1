// ignore_for_file: public_member_api_docs, sort_constructors_first
class Recipe {
  List image;
  String ingredient;
  String instruction;
  String name;
  String orderby;
  String video;
  Recipe({
    required this.image,
    required this.ingredient,
    required this.instruction,
    required this.name,
    required this.orderby,
    required this.video,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'ingredient': ingredient,
      'instruction': instruction,
      'name': name,
      'orderby': orderby,
      'video': video,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      image: List.from(
        map['image'] as List,
      ),
      ingredient: map['ingredient'] as String,
      instruction: map['instruction'] as String,
      name: map['name'] as String,
      orderby: map['orderby'] as String,
      video: map['video'] as String,
    );
  }
}

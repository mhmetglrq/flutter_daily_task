import '../../domain/entities/category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    super.uid,
    super.value,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      uid: json['uid'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'value': value,
    };
  }

  CategoryModel copyWith({
    String? uid,
    String? value,
  }) {
    return CategoryModel(
      uid: uid ?? this.uid,
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'CategoryModel(uid: $uid, value: $value)';

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      uid: entity.uid,
      value: entity.value,
    );
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      uid: map['uid'],
      value: map['value'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'value': value,
    };
  }
}

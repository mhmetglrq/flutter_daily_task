import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? uid;
  final String? value;

  const CategoryEntity({
    this.uid,
    this.value,
  });

  @override
  List<Object?> get props => [
        uid,
        value,
      ];
}

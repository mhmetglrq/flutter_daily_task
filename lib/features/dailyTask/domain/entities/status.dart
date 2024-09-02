import 'package:equatable/equatable.dart';

class StatusEntity extends Equatable {
  final String? uid;
  final String? value;
  final int? color;
  final int? projectCount;
  const StatusEntity({
    this.uid,
    this.value,
    this.projectCount,
    this.color,
  });

  @override
  List<Object?> get props => [
        uid,
        value,
        projectCount,
        color,
      ];
}

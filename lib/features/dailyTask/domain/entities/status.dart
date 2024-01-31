import 'package:equatable/equatable.dart';

class StatusEntity extends Equatable {
  final String? uid;
  final String? value;

  const StatusEntity({
    this.uid,
    this.value,
  });

  @override
  List<Object?> get props => [
        uid,
        value,
      ];
}

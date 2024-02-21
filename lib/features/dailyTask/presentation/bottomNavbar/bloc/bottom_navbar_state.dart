// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BottomNavbarState extends Equatable {
  final String? message;
  final int index;
  const BottomNavbarState({this.message, this.index = 0});

  @override
  List<Object> get props => [message!, index];

  BottomNavbarState copyWith({String? message, int? index}) {
    return BottomNavbarState(
      message: message ?? this.message,
      index: index ?? this.index,
    );
  }
}

class BottomNavbarInitial extends BottomNavbarState {
  const BottomNavbarInitial();
}

class BottomNavbarLoading extends BottomNavbarState {
  const BottomNavbarLoading();
}

class BottomNavbarDone extends BottomNavbarState {
  BottomNavbarDone({int? index, String? message})
      : super(index: index!, message: message!);
}

class BottomNavbarError extends BottomNavbarState {
  @override
  const BottomNavbarError(message) : super(message: message);
}

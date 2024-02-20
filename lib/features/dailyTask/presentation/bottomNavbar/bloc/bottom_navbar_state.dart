// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class BottomNavbarState extends Equatable {
  final String? message;
  const BottomNavbarState({this.message});

  @override
  List<Object> get props => [message!];
}

class BottomNavbarInitial extends BottomNavbarState {
  const BottomNavbarInitial();
}

class BottomNavbarLoading extends BottomNavbarState {
  const BottomNavbarLoading();
}

class BottomNavbarDone extends BottomNavbarState {
  const BottomNavbarDone();
}

class BottomNavbarError extends BottomNavbarState {
  @override
  const BottomNavbarError(message) : super(message: message);
}

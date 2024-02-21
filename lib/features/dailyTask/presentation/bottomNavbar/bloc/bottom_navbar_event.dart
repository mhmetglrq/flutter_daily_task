import 'package:equatable/equatable.dart';

abstract class BottomNavbarEvent extends Equatable {
  const BottomNavbarEvent();
}

class GetUserEvent extends BottomNavbarEvent {
  const GetUserEvent();

  @override
  List<Object?> get props => [];
}

class SetPageIndexEvent extends BottomNavbarEvent {
  final int pageIndex;
  final String message;
  const SetPageIndexEvent({required this.pageIndex,required this.message});

  @override
  List<Object> get props => [pageIndex,message];
}

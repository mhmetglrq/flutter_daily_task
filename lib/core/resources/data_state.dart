abstract class DataState<T> {
  final T? data;
  final String? message;

  DataState({this.data, this.message});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess( {super.data});
}

class DataLoading<T> extends DataState<T> {
  DataLoading() : super(message: 'Loading...');
}

class DataError<T> extends DataState<T> {
  DataError({super.message});
}


class Result<T>{
  Result._();

  factory Result.LoadingState(T value) = LoadingState<T>;
  factory Result.SuccessState(T value) = SuccessState<T>;
  factory Result.ErrorState(T value) = ErrorState<T>;

}

class LoadingState<T> extends Result<T>{
  LoadingState(this.msg) : super._();
  final T msg;
}

class SuccessState<T> extends Result<T>{
  SuccessState(this.value) : super._();
  final T value;
}

class ErrorState<T> extends Result<T>{
  ErrorState(this.msg) : super._();
  final T msg;
}
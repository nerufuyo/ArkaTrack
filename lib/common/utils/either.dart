// Either class definition
abstract class Either<L, R> {
  T fold<T>(T Function(L l) leftFn, T Function(R r) rightFn);
}

// Left class for failure
class Left<L, R> extends Either<L, R> {
  final L value;

  Left(this.value);

  @override
  T fold<T>(T Function(L l) leftFn, T Function(R r) rightFn) {
    return leftFn(value);
  }
}

// Right class for success
class Right<L, R> extends Either<L, R> {
  final R value;

  Right(this.value);

  @override
  T fold<T>(T Function(L l) leftFn, T Function(R r) rightFn) {
    return rightFn(value);
  }
}

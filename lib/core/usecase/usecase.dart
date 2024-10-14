abstract class UseCase<Type, T> {
  Future<Type> call({T params});
}

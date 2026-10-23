// Provides user-safe backend failure categories
// Owns public messages and GraphQL codes.
// Does not include request bodies or transport credentials.
class ApiFailure implements Exception {
  final String code;
  final String message;
  const ApiFailure(this.code, this.message);
  @override
  String toString() => message;
}

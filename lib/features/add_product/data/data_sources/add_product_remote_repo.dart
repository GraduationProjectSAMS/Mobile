abstract class AddProductRemoteRepo {
  Future<void> addProduct(
      {required Map<String, dynamic> data,
      void Function(int, int)? onSendProgress});
}

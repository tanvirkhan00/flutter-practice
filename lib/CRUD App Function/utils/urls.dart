class Urls {
  static const String _baseUrl = 'http://35.73.30.144:2008/api/v1';

  static const String getProduct = '$_baseUrl/ReadProduct';

  static String deleteProductUrl(String id) => '$_baseUrl/DeleteProduct/$id';
}
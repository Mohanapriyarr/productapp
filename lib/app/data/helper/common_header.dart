class CommonHeader {
  Future<Map<String, String>> commonHeader() async {
    final Map<String, String> headers = {'content-type': 'application/json'};
    return headers;
  }
}


import 'package:http/http.dart' as http;

class ApiService {
  final client = http.Client();

  Future<http.Response> create(String url, {required String body}) {
    return client.post(Uri.parse(url), body: body);
  }

  Future<http.Response> read(String url) {
    return client.get(Uri.parse(url));
  }

  Future<http.Response> update(String url, {required String body}) {
    return client.put(Uri.parse(url), body: body);
  }

  Future<http.Response> delete(String url) {
    return client.delete(Uri.parse(url));
  }
}

import 'package:http/http.dart' as http;
import 'package:task_2/models/post.dart';

class RemoteServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://my.api.mockaroo.com/users.json?key=aa22fa40');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }
}

import 'package:alifouadapp/Helpers/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'easyloader.dart';

Future<http.Response> exec_Request(String endPoint, Object Body, String method,
    {Map<String, String>? Headers, bool AddToken = false}) async {
  var response;
  Headers = Map<String, String>();
  if (AddToken) {
    var Token = await const FlutterSecureStorage().read(key: "userToken");
    Map<String, String> AccessToken = {"Accesstoken": Token!};
    Headers.addAll(AccessToken);
  }
  Headers.addAll({"Lang": "en", "Content-Type": "application/json"});

  EasyLoader().ShowLoader();
  try {
    if (method == "POST")
      response = await http.post(Uri.parse(Constants.BaseUrl + endPoint), headers: Headers, body: Body);
    else if (method == "GET")
      response = await http.get(Uri.parse(Constants.BaseUrl + endPoint), headers: Headers);
    else if (method == "HEAD")
      response = await http.head(Uri.parse(Constants.BaseUrl + endPoint), headers: Headers);
    else if (method == "DELETE")
      response = await http.delete(Uri.parse(Constants.BaseUrl + endPoint), headers: Headers, body: Body);
    else if (method == "PATCH")
      response = await http.patch(Uri.parse(Constants.BaseUrl + endPoint), headers: Headers, body: Body);
    else if (method == "PUT")
      response = await http.put(Uri.parse(Constants.BaseUrl + endPoint), headers: Headers, body: Body);
  } catch (e) {
    print(e);
  }

  EasyLoader().HideLoader();
  return response;
}

Future<http.StreamedResponse> exec_Request_Multipart(String endPoint, Map<String, String> Body, String method,
    {Map<String, String>? Headers, Map<String, Object>? array, String? arrayKey, bool AddToken = false}) async {
  var request = http.MultipartRequest(method, Uri.parse(Constants.BaseUrl + endPoint));
  request.fields.addAll(Body);
  request.headers.addAll({"Lang": "en"});
  if (array != null) {
    array.forEach((key, value) {
      if (value is List) {
        (value as List).forEach((element) {
          if (!int.parse(key).isNaN) {
            // How to Add List of Arrays in Multipart POST Request.
            // Duplicate Keys by Adding Keys by Index.
            request.fields.addAll({"$arrayKey[${int.parse(key)}][${value.indexOf(element)}]": element.toString()});
          }
        });
      } else {
        request.fields.addAll({key: value.toString()});
      }
    });
  }
  if (AddToken) {
    var Token = await const FlutterSecureStorage().read(key: "userToken");
    Map<String, String> AccessToken = {"Accesstoken": Token!};
    request.headers.addAll(AccessToken);
  }
  EasyLoader().ShowLoader();
  var response = await request.send();
  EasyLoader().HideLoader();
  return response;
}

//void addValueToMap<K, V>(Map<K, List<V>> map, K key, V value) => map.update(key, (list) => list..add(value), ifAbsent: () => [value]);

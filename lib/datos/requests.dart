import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

const String urlServer = 'http://mante.hosting.acm.org/Kfood';

Future<String> executeHttpRequest({@required String urlFile, @required dynamic requestBody}) async {

  final String urlFinal = urlServer + urlFile;
  var client = http.Client();
  try {
    var httpResponse = await client.post(urlFinal, body: requestBody);
    return httpResponse.body;
  } catch (Exception) {
    return null;
  } finally {
    client.close();
  }
}
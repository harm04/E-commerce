import 'dart:convert';

import 'package:e_commerce/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;


void httpErrorHandle(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackbar(jsonDecode(response.body)['msg'], context);
      break;
    case 500:
      showSnackbar(jsonDecode(response.body)['error'], context);
      break;
    default:
      showSnackbar(response.body, context);
  }
}

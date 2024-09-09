import 'dart:convert';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/user/provider/user.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/utils/httpErrorHandle.dart';
import 'package:e_commerce/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductDetailsServices {
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('${Constatnts.uri}/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          "id": product.id!,
          "rating": rating,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      showSnackbar(e.toString(), context);
    }
  }
}

// ignore_for_file: file_names

import 'utils/app_text.dart';
import 'utils/variable_utils.dart';
import 'package:flutter/material.dart';

class NoInternetConnected extends StatelessWidget {
  const NoInternetConnected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child: AppText(VariableUtils.noInternetText)),
    );
  }
}

import 'package:e_book/utils/color_utils.dart';
import 'package:flutter/material.dart';

import '../utils/app_text.dart';
import '../utils/variable_utils.dart';

class ServerError extends StatelessWidget {
  const ServerError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: AppText(VariableUtils.serverError));
  }
}

class NoDataFound extends StatelessWidget {
  const NoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: AppText(VariableUtils.noDataFound));
  }
}

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: ColorUtils.primary,
    ));
  }
}

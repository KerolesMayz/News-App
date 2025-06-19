import 'package:flutter/material.dart';
import 'package:news/core/result.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key, this.serverError, this.exception});

  final ServerError? serverError;
  final GeneralException? exception;

  String extractErrorMessage() {
    return serverError == null
        ? exception!.exception.toString()
        : serverError!.message;
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(extractErrorMessage()));
  }
}

import 'dart:convert';

import '../dependencies/app_dependencies.dart';
import 'error_response_model.dart';

class ResponseResult<T extends BaseResponseModel> {
  final T? data;
  final bool isSuccessful;
  final ErrorResponseModel? error;

  ResponseResult({
    this.data,
    required this.isSuccessful,
    this.error,
  });

  factory ResponseResult.fromJson(dynamic json) {
    if (json['error'] != null) {
      final error = ErrorResponseModel.fromJson(json['error']);
      return ResponseResult(isSuccessful: false, error: error);
    }
    if (json is Map<String, dynamic>) {
      T? responseData = AppDependencies.injector.get<T>();
      responseData = responseData.fromJson(json) as T;
      return ResponseResult(data: responseData, isSuccessful: true);
    }
    if (json is List) {
      final listData = <String, dynamic>{};
      listData['data'] = json;
      T? responseData = AppDependencies.injector.get<T>();
      responseData = responseData.fromJson(listData) as T;
      return ResponseResult(data: responseData, isSuccessful: true);
    }

    throw UnimplementedError();
  }
}

abstract class BaseResponseModel {
  BaseResponseModel fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();

  BaseResponseModel copyWith() {
    return fromJson(jsonDecode(jsonEncode(toJson())));
  }
}

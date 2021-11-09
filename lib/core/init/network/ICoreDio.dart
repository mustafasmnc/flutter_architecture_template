// ignore_for_file: file_names

import 'package:flutter_architecture_template/core/base/model/base_model.dart';
import 'package:flutter_architecture_template/core/constants/enums/http_request_enum.dart';
import 'package:flutter_architecture_template/core/init/network/IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}

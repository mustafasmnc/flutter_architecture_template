import 'package:flutter_architecture_template/core/init/network/IResponseModel.dart';

class BaseError extends IErrorModel {
  final String mesaj;

  BaseError(this.mesaj);
}

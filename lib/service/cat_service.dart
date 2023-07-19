import 'package:dio/dio.dart';
import 'package:novalabtask/core/dio_config.dart';
import 'package:novalabtask/model/cat_model.dart';
import 'package:novalabtask/network/dio_config.dart';
import 'package:novalabtask/network/network_config.dart';
import 'package:novalabtask/network/urls.dart';

class CatService {
  // GET CATS
  Future<NetworkResponses> getCats() async {
    try {
      Response response = await DioConfig.createRequest().get(
        NovalabEndpoints.getFacts,
      );

      if (response.statusCode == 200) {
        return NetworkSuccessResponses(CatModel.fromJson(response.data));
      } else {
        return NetworkExceptionError(response.statusCode.toString()+response.statusMessage.toString());
      }
    } on DioException catch (e) {
      return NetworkExceptionError(DioHandleError.from(e));
    }
  }
}

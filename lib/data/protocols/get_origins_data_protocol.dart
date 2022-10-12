import 'package:map_navigation/data/models/origins_result_model.dart';

abstract class GetOriginsDataProtocol {
  Future<OriginsResultModel> call();
}
import 'package:map_navigation/data/models/origins_result_model.dart';
import 'package:map_navigation/data/protocols/get_origins_data_protocol.dart';

class GetOriginsDataUsecase {
  GetOriginsDataUsecase({required this.protocol});

  GetOriginsDataProtocol protocol;

  Future<OriginsResultModel> call() async {
    return await protocol();
  }
}

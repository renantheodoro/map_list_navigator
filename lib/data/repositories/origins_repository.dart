import 'package:map_navigation/data/datasource/origins_datasource.dart';
import 'package:map_navigation/data/models/origins_result_model.dart';
import 'package:map_navigation/data/protocols/get_origins_data_protocol.dart';

class OriginsRepository implements GetOriginsDataProtocol {
  OriginsRepository({required this.dataSource});

  OriginsDataSource dataSource;

  @override
  Future<OriginsResultModel> call() async {
    return await dataSource.getResult();
  }

}
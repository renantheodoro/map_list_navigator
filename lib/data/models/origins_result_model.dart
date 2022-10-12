
import 'package:map_navigation/data/models/continent.dart';
import 'package:map_navigation/domain/entities/origins_result_entity.dart';

class OriginsResultModel extends OriginsResultEntity {
  OriginsResultModel({required List<Continent> continents}) : super(continents: continents);
}

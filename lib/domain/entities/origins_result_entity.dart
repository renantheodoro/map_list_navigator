import 'continent_entity.dart';

abstract class OriginsResultEntity {
  OriginsResultEntity({required this.continents});

  List<ContinentEntity> continents;
}

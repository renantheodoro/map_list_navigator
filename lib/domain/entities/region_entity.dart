import 'package:map_navigation/domain/entities/bounds_entity.dart';
import 'package:map_navigation/domain/entities/center_entity.dart';
import 'package:map_navigation/domain/entities/population_entity.dart';

abstract class RegionEntity {
  RegionEntity(
      {required this.namePtbr,
      this.uid,
      required this.populations,
      this.center,
      required this.continent,
      required this.urlPrismic,
      required this.image,
      this.proportion,
      required this.name,
      this.zoomDesktop,
      required this.bounds,
      this.zoomMobile});
  String namePtbr;
  String? uid;
  List<PopulationEntity> populations;
  CenterModelEntity? center;
  String continent;
  String urlPrismic;
  String image;
  double? proportion;
  String name;
  double? zoomDesktop;
  BoundsEntity? bounds;
  double? zoomMobile;
}

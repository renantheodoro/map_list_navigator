import 'package:map_navigation/domain/entities/bounds_entity.dart';
import 'package:map_navigation/domain/entities/center_entity.dart';

abstract class PopulationEntity {
  PopulationEntity(
      {required this.namePtbr,
      required this.uid,
      required this.group,
      this.center,
      required this.continent,
      required this.urlPrismic,
      required this.region,
      required this.image,
      this.proportion,
      required this.name,
      this.zoomDesktop,
      required this.bounds,
      this.zoomMobile});
  String namePtbr;
  String uid;
  String group;
  CenterModelEntity? center;
  String continent;
  String urlPrismic;
  String region;
  String image;
  double? proportion;
  String name;
  double? zoomDesktop;
  BoundsEntity? bounds;
  double? zoomMobile;
}

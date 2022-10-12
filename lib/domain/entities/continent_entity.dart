import 'bounds_entity.dart';
import 'center_entity.dart';
import 'region_entity.dart';

abstract class ContinentEntity {
  ContinentEntity(
      {this.zoomDesktop,
      required this.uid,
      required this.bounds,
      required this.regions,
      required this.center,
      this.zoomMobile,
      required this.color,
      this.proportion,
      required this.name,
      required this.namePtbr,
      required this.eContinentRefName,
      required this.image});

  double? zoomDesktop;
  String uid;
  BoundsEntity? bounds;
  List<RegionEntity> regions;
  CenterModelEntity center;
  double? zoomMobile;
  String image;
  String color;
  double? proportion;
  String name;
  String namePtbr;
  EContinent eContinentRefName;
}

enum EContinent {
  africa,
  america,
  atartica,
  asia,
  europe,
  oceania,
}

import 'package:map_navigation/data/models/bounds.dart';
import 'package:map_navigation/data/models/center.dart';
import 'package:map_navigation/data/models/region.dart';
import 'package:map_navigation/domain/entities/continent_entity.dart';

class Continent extends ContinentEntity {
  Continent({
    double? zoomDesktop,
    required String uid,
    BoundsModel? bounds,
    required List<Region> regions,
    required CenterModel center,
    double? zoomMobile,
    required String color,
    double? proportion,
    required String name,
    required String namePtbr,
    required String image,
    required EContinent eContinentRefName,
  }) : super(
          zoomDesktop: zoomDesktop,
          uid: uid,
          bounds: bounds,
          regions: regions,
          center: center,
          zoomMobile: zoomMobile,
          color: color,
          proportion: proportion,
          name: name,
          namePtbr: namePtbr,
          image: image,
          eContinentRefName: eContinentRefName,
        );
}

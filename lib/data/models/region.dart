
import 'package:map_navigation/data/models/bounds.dart';
import 'package:map_navigation/data/models/center.dart';
import 'package:map_navigation/data/models/population.dart';
import 'package:map_navigation/domain/entities/region_entity.dart';

class Region extends RegionEntity {
  Region({
    required String namePtbr,
    String? uid,
    required List<Population> populations,
    CenterModel? center,
    required String continent,
    required String urlPrismic,
    required String image,
    double? proportion,
    required String name,
    double? zoomDesktop,
    BoundsModel? bounds,
    double? zoomMobile,
  }) : super(
            namePtbr: namePtbr,
            uid: uid,
            populations: populations,
            center: center,
            continent: continent,
            urlPrismic: urlPrismic,
            image: image,
            proportion: proportion,
            name: name,
            zoomDesktop: zoomDesktop,
            bounds: bounds,
            zoomMobile: zoomMobile);
}

import 'package:map_navigation/data/models/bounds.dart';
import 'package:map_navigation/data/models/center.dart';
import 'package:map_navigation/domain/entities/population_entity.dart';

class Population extends PopulationEntity {
  Population({
    required String namePtbr,
    required String uid,
    required String group,
    CenterModel? center,
    required String continent,
    required String urlPrismic,
    required String region,
    required String image,
    double? proportion,
    required String name,
    double? zoomDesktop,
    BoundsModel? bounds,
    double? zoomMobile,
  }) : super(
            namePtbr: namePtbr,
            uid: uid,
            group: group,
            center: center,
            continent: continent,
            urlPrismic: urlPrismic,
            region: region,
            image: image,
            proportion: proportion,
            name: name,
            zoomDesktop: zoomDesktop,
            bounds: bounds,
            zoomMobile: zoomMobile);
}

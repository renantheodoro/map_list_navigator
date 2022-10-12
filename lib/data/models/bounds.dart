import 'package:map_navigation/domain/entities/bounds_entity.dart';

import 'center.dart';

class BoundsModel extends BoundsEntity {
  BoundsModel({CenterModel? bound1, CenterModel? bound2})
      : super(bound1: bound1, bound2: bound2);
}

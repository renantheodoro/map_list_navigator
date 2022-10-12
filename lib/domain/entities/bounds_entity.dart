import 'center_entity.dart';

abstract class BoundsEntity {
  BoundsEntity({this.bound2, this.bound1});
  CenterModelEntity? bound2;
  CenterModelEntity? bound1;
}

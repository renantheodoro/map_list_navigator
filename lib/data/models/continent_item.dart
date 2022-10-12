import 'package:map_navigation/domain/entities/continent_entity.dart';

class ContinentItem {
  ContinentItem({
    required this.continent,
    this.isExpanded = false,
  });

  ContinentEntity continent;
  bool isExpanded;
}

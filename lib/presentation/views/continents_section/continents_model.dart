import 'package:map_navigation/data/models/continent_item.dart';
import 'package:map_navigation/domain/entities/origins_result_entity.dart';
import 'package:map_navigation/presentation/base/base_model.dart';

class ContinentsViewModel extends BaseModel {
  ContinentsViewModel(OriginsResultEntity ancestryInfo)
      : _ancestryInfo = ancestryInfo;

  final OriginsResultEntity _ancestryInfo;

  late List<ContinentItem> _continentItems;
  List<ContinentItem> get continentItems => _continentItems;

  @override
  void initialize() {
    setBusy(true);

    _continentItems = generateItems(_ancestryInfo);
    notifyListeners();
    setBusy(false);
  }

  List<ContinentItem> generateItems(OriginsResultEntity items) {
    return List.generate(items.continents.length, (int index) {
      return ContinentItem(continent: items.continents[index]);
    });
  }

  void toggleExpandPanel(int index, bool isExpanded) {
    _continentItems[index].isExpanded = !isExpanded;
    notifyListeners();
  }
}

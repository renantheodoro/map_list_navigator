// helper model for Map View positioning

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapContent {
  MapContent({required this.visibleAssets, this.centerPosition});
  List<MapAssetModel> visibleAssets;
  MapAssetModel? centerPosition;
}

class MapAssetModel {
  MapAssetModel(
      {this.zoom,
      this.bounds,
      required this.center,
      this.assetReference,
      this.isTemp = false});
  final LatLngBounds? bounds;
  final LatLng center;
  final String? assetReference;
  final bool isTemp;
  final double? zoom;
}

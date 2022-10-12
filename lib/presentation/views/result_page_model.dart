import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_navigation/data/models/continent_item.dart';
import 'package:map_navigation/data/models/map_position.dart';
import 'package:map_navigation/domain/entities/origins_result_entity.dart';
import 'package:map_navigation/domain/entities/population_entity.dart';
import 'package:map_navigation/domain/entities/region_entity.dart';
import 'package:map_navigation/domain/usecases/get_origins_data_usecase.dart';
import 'package:map_navigation/presentation/base/base_model.dart';

class ResultPageModel extends BaseModel {
  ResultPageModel({required this.context, required this.usecase});

  final BuildContext context;
  final GetOriginsDataUsecase usecase;

  late MapContent _mapContent;
  MapContent get mapContent => _mapContent;

  late OriginsResultEntity _originsResult;
  OriginsResultEntity get originsResult => _originsResult;

  @override
  Future<void> initialize() async {
    setBusy(true);

    OriginsResultEntity response = await usecase();

    _originsResult = response;
    _mapContent = getMapContent(_originsResult);

    setBusy(false);
  }

  MapContent getMapContent(OriginsResultEntity data) {
    return MapContent(
      centerPosition: MapAssetModel(
          center: LatLng(15, -0.09), zoom: 1, assetReference: '', bounds: null),
      visibleAssets: getRegionAssetsList(data),
    );
  }

  void resetPopulationAssetsList() {
    _mapContent = getMapContent(originsResult);
    notifyListeners();
  }

  void setMapContent(MapContent mapContent) {
    _mapContent = mapContent;
    notifyListeners();
  }

  List<MapAssetModel> getRegionAssetsList(OriginsResultEntity data) {
    final List<MapAssetModel> list = <MapAssetModel>[];
    for (final continent in data.continents) {
      for (final region in continent.regions) {
        list.add(MapAssetModel(
            bounds: LatLngBounds(
              LatLng(region.bounds!.bound1!.lat!, region.bounds!.bound1!.lng!),
              LatLng(region.bounds!.bound2!.lat!, region.bounds!.bound2!.lng!),
            ),
            center: LatLng(region.center!.lat!, region.center!.lng!),
            assetReference: region.image,
            zoom: region.zoomMobile!,
            isTemp: false));
      }
    }

    if (mounted) {
      notifyListeners();
    }

    return list;
  }

  void setPopulationMapContent(
      {required RegionEntity region, required PopulationEntity population}) {
    final List<MapAssetModel> list = <MapAssetModel>[];

    final MapAssetModel populationMapAsset = MapAssetModel(
        bounds: LatLngBounds(
          LatLng(
              population.bounds!.bound1!.lat!, population.bounds!.bound1!.lng!),
          LatLng(
              population.bounds!.bound2!.lat!, population.bounds!.bound2!.lng!),
        ),
        center: LatLng(population.center!.lat!, population.center!.lng!),
        assetReference: population.image,
        zoom: population.zoomMobile!,
        isTemp: false);
    list.add(populationMapAsset);

    _mapContent =
        MapContent(visibleAssets: list, centerPosition: populationMapAsset);

    notifyListeners();
  }

  List<MapAssetModel> setRegionMapContent(RegionEntity regionEntity) {
    final List<MapAssetModel> list = <MapAssetModel>[];

    final MapAssetModel centerRegion = MapAssetModel(
        bounds: LatLngBounds(
          LatLng(regionEntity.bounds!.bound1!.lat!,
              regionEntity.bounds!.bound1!.lng!),
          LatLng(regionEntity.bounds!.bound2!.lat!,
              regionEntity.bounds!.bound2!.lng!),
        ),
        center: LatLng(regionEntity.center!.lat!, regionEntity.center!.lng!),
        assetReference: regionEntity.image,
        zoom: regionEntity.zoomMobile!,
        isTemp: false);

    for (final population in regionEntity.populations) {
      list.add(MapAssetModel(
          bounds: LatLngBounds(
            LatLng(population.bounds!.bound1!.lat!,
                population.bounds!.bound1!.lng!),
            LatLng(population.bounds!.bound2!.lat!,
                population.bounds!.bound2!.lng!),
          ),
          center: LatLng(population.center!.lat!, population.center!.lng!),
          assetReference: population.image,
          zoom: population.zoomMobile!,
          isTemp: false));
    }
    list.add(centerRegion);

    _mapContent = MapContent(visibleAssets: list, centerPosition: centerRegion);

    notifyListeners();
    return list;
  }

  void setContintinentMapContent(
      ContinentItem continentItem, bool? isExpanded) {
    if (isExpanded == null || !isExpanded) {
      resetPopulationAssetsList();
      return;
    }
    final List<MapAssetModel> list = <MapAssetModel>[];
    MapAssetModel center;
    try {
      center = MapAssetModel(
          bounds: LatLngBounds(
            LatLng(continentItem.continent.bounds!.bound1!.lat!,
                continentItem.continent.bounds!.bound1!.lng!),
            LatLng(continentItem.continent.bounds!.bound2!.lat!,
                continentItem.continent.bounds!.bound2!.lng!),
          ),
          center: LatLng(continentItem.continent.center.lat!,
              continentItem.continent.center.lng!),
          assetReference: continentItem.continent.image,
          zoom: continentItem.continent.zoomMobile!,
          isTemp: false);
    } catch (e) {
      center = MapAssetModel(
          center: LatLng(continentItem.continent.center.lat!,
              continentItem.continent.center.lng!),
          assetReference: continentItem.continent.image,
          zoom: continentItem.continent.zoomMobile!,
          isTemp: false);
    }

    for (final region in continentItem.continent.regions) {
      list.addAll(setRegionMapContent(region));
    }

    list.add(center);

    _mapContent = MapContent(visibleAssets: list, centerPosition: center);

    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_navigation/data/models/map_position.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with TickerProviderStateMixin {
  final MapController mapController = MapController();

  void updateMarker() {
    final latTween = Tween<double>(
        begin: mapController.center.latitude,
        end: context.read<MapContent>().centerPosition!.center.latitude);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude,
        end: context.read<MapContent>().centerPosition!.center.longitude);
    final zoomTween = Tween<double>(
        begin: mapController.zoom,
        end: context.read<MapContent>().centerPosition!.zoom);

    final controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
          LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation));
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });

    controller.forward();
  }

  // translate our MapAssetModel to OverlayImage (leaflet)
  OverlayImage _createAsset(MapAssetModel assetModel) {
    final String pngReference = assetModel.assetReference!;

    final Image img = Image.asset('assets/amoebas/png/$pngReference');

    return OverlayImage(bounds: assetModel.bounds!, imageProvider: img.image);
  }

  @override
  void didUpdateWidget(MapView oldWidget) {
    updateMarker();
    super.didUpdateWidget(oldWidget);
  }

  List<OverlayImage> _getAssetsList(List<MapAssetModel> referencePoints) {
    final List<OverlayImage> assets = [];

    for (final assetModel in referencePoints) {
      if (assetModel.assetReference != null &&
          assetModel.assetReference!.isNotEmpty) {
        assets.add(_createAsset(assetModel));
      }
    }

    return assets;
  }

  Widget _mapWidget(BuildContext context) => FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: context.watch<MapContent>().centerPosition?.center,
          zoom: context.watch<MapContent>().centerPosition?.zoom ?? 0,
          minZoom: 0,
          maxZoom: 18.0,
          interactiveFlags: InteractiveFlag.all,
          slideOnBoundaries: true,
          controller: mapController,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/mendelics/ckrgcwvmt0j2817nwv2sq8mo9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWVuZGVsaWNzIiwiYSI6ImNrcTJjeTZzeTA2dmUybnA5YzdzY3N0MmwifQ.ggeq5Sh_Kv8gzFy2Ugmodw',
            additionalOptions: {
              'accessToken': '<PUT_ACCESS_TOKEN_HERE>',
              'id': 'mapbox.streets',
            },
          ),
          OverlayImageLayerOptions(
            overlayImages:
                _getAssetsList(context.watch<MapContent>().visibleAssets),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _mapWidget(context),
    );
  }
}

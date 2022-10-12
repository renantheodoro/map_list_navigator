import 'package:flutter/material.dart';
import 'package:map_navigation/data/models/map_position.dart';
import 'package:map_navigation/designsystem/colors.dart';
import 'package:map_navigation/designsystem/custom_appbar.dart';
import 'package:map_navigation/designsystem/loading.dart';
import 'package:map_navigation/di/data_layer_factory.dart';
import 'package:map_navigation/domain/entities/origins_result_entity.dart';
import 'package:map_navigation/presentation/base/base_sized_widget.dart';
import 'package:map_navigation/presentation/base/base_view_widget.dart';
import 'package:map_navigation/presentation/views/continents_section/continents_section.dart';
import 'package:map_navigation/presentation/views/map_section/map_section.dart';
import 'package:map_navigation/presentation/views/result_page_model.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget with BaseSizedWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final Key mapKey = UniqueKey();

  Widget _mapView(MapContent mapContent) => Provider.value(
        value: mapContent,
        child: MapView(key: mapKey),
      );

  ContinentsSection _getContinentsSection(
      OriginsResultEntity originsResult, ResultPageModel model) {
    return ContinentsSection(
        continentsViewModel: getContinentViewModel(originsResult),
        onPopulationClicked: (region, population) {
          model.setPopulationMapContent(region: region, population: population);
        },
        onRegionClicked: (regionEntity) {
          model.setRegionMapContent(regionEntity);
        },
        onContinentItemClicked: (continentItem, {isExpanded}) {
          model.setContintinentMapContent(continentItem, isExpanded);
        });
  }

  Widget _buildScreen(BuildContext context, ResultPageModel model) =>
      Stack(alignment: Alignment.topCenter, fit: StackFit.loose, children: [
        Column(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: widget.screenHeight(context, dividedBy: 2.5),
                  child: _mapView(model.mapContent),
                ),
              ],
            ),
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.topCenter,
                    constraints: const BoxConstraints.expand(),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        if (model.originsResult.continents.isNotEmpty)
                          _getContinentsSection(model.originsResult, model)
                        else
                          const SizedBox(
                            height: 300,
                          ),
                      ],
                    )))),
          ],
        ),
      ]);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ResultPageModel>(
        onModelReady: (model) => model.initialize(),
        model: getOriginsResultViewModel(context),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Palette.white,
            appBar: DesignSystemAppBar(),
            body: model.busy
                ? const DesignSystemDnaLoader()
                : _buildScreen(context, model),
          );
        });
  }
}

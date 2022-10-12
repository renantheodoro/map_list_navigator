import 'package:flutter/material.dart';
import 'package:map_navigation/core/helpers/continent_helper.dart';
import 'package:map_navigation/core/utils/math_util.dart';
import 'package:map_navigation/data/models/continent_item.dart';
import 'package:map_navigation/domain/entities/continent_entity.dart';
import 'package:map_navigation/domain/entities/population_entity.dart';
import 'package:map_navigation/domain/entities/region_entity.dart';
import 'package:map_navigation/presentation/base/base_view_widget.dart';
import 'package:map_navigation/designsystem/expansion_tile.dart';

import 'continents_model.dart';
import 'regions_list.dart';

class ContinentsSection extends StatefulWidget {
  const ContinentsSection({
    Key? key,
    required this.continentsViewModel,
    required this.onContinentItemClicked,
    required this.onRegionClicked,
    required this.onPopulationClicked,
  }) : super(key: key);

  final OnContinentItemClicked onContinentItemClicked;
  final OnRegionClicked onRegionClicked;
  final OnPopulationClicked onPopulationClicked;
  final ContinentsViewModel continentsViewModel;

  @override
  State<ContinentsSection> createState() => _ContinentListState();
}

class _ContinentListState extends State<ContinentsSection> {
  //controls the colored text
  RegionEntity? _selectedRegion;
  List<PopulationEntity>? _selectedPopulationsList;

  Widget _localRegionItemList(
          BuildContext context, ContinentEntity continent) =>
      ListView.builder(
        padding: const EdgeInsets.only(top: 8.0),
        itemBuilder: (context, index) {
          return RegionsList(
            continent.regions[index],
            onRegionClicked: (regionEntity) {
              setState(() {
                _selectedRegion = regionEntity;
                _selectedPopulationsList = regionEntity.populations;
              });

              widget.onRegionClicked(regionEntity);
            },
            onPopulationClicked: (region, population) {
              setState(() {
                _selectedRegion = region;
                _selectedPopulationsList = [population];
              });

              widget.onPopulationClicked(region, population);
            },
            isSelectedRegion: continent.regions[index] == _selectedRegion,
            selectedPopulations: _selectedPopulationsList ?? [],
            continentColor: getContinentColor(continent.eContinentRefName),
          );
        },
        itemCount: continent.regions.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
      );

  Widget _buildContinentsCustomTiles(
      BuildContext context, List<ContinentItem> data) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: data.map<Widget>((ContinentItem item) {
        return CustomExpansionTile(
          onContinentClicked: (isExpanded) =>
              widget.onContinentItemClicked(item, isExpanded: isExpanded),
          percent: roundDouble(item.continent.proportion! * 100, 1),
          continentName: item.continent.namePtbr,
          selectedColor: getContinentColor(item.continent.eContinentRefName),
          children: <Widget>[
            _localRegionItemList(context, item.continent),
          ],
        );
      }).toList(),
    );
  }

  void onExpansionClicked(List<ContinentItem> data, ContinentItem item) {
    final int index = data.indexOf(item);
    widget.onContinentItemClicked(
      item,
      isExpanded: !data[index].isExpanded,
    );
    setState(() {
      data[index].isExpanded = !data[index].isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ContinentsViewModel>(
      onModelReady: (model) => model.initialize(),
      model: widget.continentsViewModel,
      builder: (context, model, child) =>
          _buildContinentsCustomTiles(context, model.continentItems),
    );
  }
}

typedef OnContinentItemClicked = void Function(ContinentItem continentItem,
    {bool? isExpanded});

typedef OnRegionClicked = void Function(RegionEntity regionEntity);

typedef OnPopulationClicked = void Function(
    RegionEntity regionEntity, PopulationEntity populationEntity);

import 'package:flutter/material.dart';
import 'package:map_navigation/core/utils/math_util.dart';
import 'package:map_navigation/designsystem/colors.dart';
import 'package:map_navigation/designsystem/fonts.dart';
import 'package:map_navigation/domain/entities/population_entity.dart';
import 'package:map_navigation/domain/entities/region_entity.dart';

import 'index.dart';

class RegionsList extends StatefulWidget {
  const RegionsList(this.region,
      {Key? key,
      required this.onRegionClicked,
      required this.continentColor,
      required this.onPopulationClicked,
      required this.isSelectedRegion,
      required this.selectedPopulations})
      : super(key: key);

  final RegionEntity region;
  final bool isSelectedRegion;
  final List<PopulationEntity> selectedPopulations;
  final OnRegionClicked onRegionClicked;
  final OnPopulationClicked onPopulationClicked;
  final Color continentColor;

  @override
  State<RegionsList> createState() => _RegionsListState();
}

class _RegionsListState extends State<RegionsList> {
  @override
  void initState() {
    super.initState();
  }

  Widget _subRegionItem(
    context,
    String percentage,
    PopulationEntity population,
  ) =>
      InkWell(
        key: const Key('subRegionInkWell'),
        onTap: () {
          widget.onPopulationClicked(widget.region, population);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: 50.0,
              child: Text(
                percentage,
                style: DesignSystemFonts.textStylePRegular(
                    size: 14.0,
                    color: (widget.isSelectedRegion &&
                            widget.selectedPopulations.contains(population))
                        ? widget.continentColor
                        : Palette.charcoal100),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                population.namePtbr,
                style: DesignSystemFonts.textStylePRegular(
                    size: 14.0,
                    color: (widget.isSelectedRegion &&
                            widget.selectedPopulations.contains(population))
                        ? widget.continentColor
                        : Palette.charcoal100),
              ),
            )
          ],
        ),
      );

  Widget _regionMarker() => SizedBox(
      width: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 14.0,
          ),
          Icon(
            Icons.circle,
            color: widget.continentColor,
            size: 8.0,
          ),
          Container(
            height: 18.0,
            width: 1,
            color: widget.continentColor,
          )
        ],
      ));

  Widget _subRegionMarker({bool isLastItem = false}) => SizedBox(
      width: 16,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 1,
            height: 8.0,
            color: widget.continentColor,
          ),
          Expanded(
            child: Container(
              width: 1,
              color: isLastItem ? Colors.transparent : widget.continentColor,
            ),
          ),
        ],
      ));

  Widget _regionsList(BuildContext context, RegionEntity region, Color color) =>
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _regionMarker(),
                          const SizedBox(width: 8.0),
                          InkWell(
                            onTap: () {
                              widget.onRegionClicked(region);
                            },
                            child: Text(
                              region.namePtbr,
                              style: DesignSystemFonts.textStylePBold(
                                size: 14.0,
                                color: color,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        semanticChildCount: region.populations.length,
                        itemBuilder: (context, index) {
                          return IntrinsicHeight(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              _subRegionMarker(
                                  isLastItem:
                                      region.populations.length - 1 == index),
                              SizedBox(
                                width: 8.0,
                                height: region.populations.length - 1 == index
                                    ? 0.0
                                    : 28.0,
                              ),
                              Flexible(
                                child: _subRegionItem(
                                    context,
                                    proportionToPercentString(
                                        region.populations[index].proportion!),
                                    region.populations[index]),
                              ),
                            ],
                          ));
                        },
                        itemCount: region.populations.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final Color regionNameColor =
        (widget.isSelectedRegion) ? widget.continentColor : Palette.charcoal100;
    return Container(
        child: _regionsList(
      context,
      widget.region,
      regionNameColor,
    ));
  }
}

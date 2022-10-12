import 'package:map_navigation/core/utils/latlng_util.dart';
import 'package:map_navigation/data/models/bounds.dart';
import 'package:map_navigation/data/models/center.dart';
import 'package:map_navigation/data/models/continent.dart';
import 'package:map_navigation/data/models/origins_result_model.dart';
import 'package:map_navigation/data/models/population.dart';
import 'package:map_navigation/data/models/region.dart';
import 'package:map_navigation/domain/entities/continent_entity.dart';

class OriginsResultModelAdapter {
  static OriginsResultModel fromJson(Map jsonData) =>
      toModel(jsonData as Map<String, dynamic>);

  static Map<String, dynamic> toJson(List<Continent> continents) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (continents.isNotEmpty) {
      data['continents'] =
          continents.map((v) => ContinentsAdapter.toJson(v)).toList();
    }
    return data;
  }

  static OriginsResultModel toModel(Map<String, dynamic> jsonRoot) {
    final List<dynamic> jsonList = jsonRoot['continents'];
    final List<Continent> continents = [];

    if (jsonList.isNotEmpty) {
      for (var v in jsonList) {
        continents.add(ContinentsAdapter.fromJson(v as Map<String, dynamic>));
      }
    }

    return OriginsResultModel(continents: continents);
  }
}

class ContinentsAdapter {
  static Continent fromJson(Map<String, dynamic> json) => Continent(
        zoomDesktop: double.tryParse(json['zoom_desktop'].toString()),
        zoomMobile: double.tryParse(json['zoom_mobile'].toString()),
        uid: json['uid'] as String,
        bounds: _getBounds(json['bounds']),
        regions: _getRegions(json['regions']),
        center: _getCenter(json['center']),
        color: json['color'] as String,
        proportion: double.tryParse(json['proportion'].toString()),
        name: json['name'] as String,
        namePtbr: json['name_ptbr'] as String,
        image: json['image'] ?? '',
        eContinentRefName: _getContinentEnum(json['name'] as String),
      );

  static EContinent _getContinentEnum(String continentString) {
    switch (continentString) {
      case 'africa':
        return EContinent.africa;
      case 'america':
        return EContinent.america;
      case 'asia':
        return EContinent.asia;
      case 'europe':
        return EContinent.europe;
      case 'oceania':
        return EContinent.oceania;
      default:
        return EContinent.europe;
    }
  }

  static Map<String, dynamic> toJson(Continent continent) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zoom_desktop'] = continent.zoomDesktop;
    data['uid'] = continent.uid;
    if (continent.bounds != null) {
      data['bounds'] = BoundsAdapter.toJson(continent.bounds as BoundsModel);
    }
    data['regions'] = continent.regions
        .map((v) => RegionAdapter.toJson(v as Region))
        .toList();
    data['center'] = CenterAdapter.toJson(continent.center as CenterModel);
    data['zoom_mobile'] = continent.zoomMobile;
    data['color'] = continent.color;
    data['proportion'] = continent.proportion;
    data['name'] = continent.name;
    data['name_ptbr'] = continent.namePtbr;
    data['image'] = continent.image;
    return data;
  }

  static List<Region> _getRegions(json) {
    final List<Region> regions = <Region>[];
    if (json != null) {
      json.forEach((v) {
        regions.add(RegionAdapter.fromJson(v as Map<String, dynamic>));
      });
    }
    return regions;
  }
}

class RegionAdapter {
  static Region fromJson(Map<String, dynamic> json) => Region(
        namePtbr: json['name_ptbr'] as String,
        uid: json['uid'] ?? '',
        populations: _getPopulations(json['populations']),
        center: json['center'] != null
            ? CenterAdapter.fromJson(json['center'] as Map<String, dynamic>)
            : null,
        continent: json['continent'] as String,
        urlPrismic: json['url_prismic'] as String,
        image: json['image'] as String,
        proportion: double.tryParse(json['proportion'].toString()),
        name: json['name'] as String,
        zoomDesktop: double.tryParse(json['zoom_desktop'].toString()),
        bounds: json['bounds'] != null
            ? BoundsAdapter.fromJson(json['bounds'] as Map<String, dynamic>)
            : null,
        zoomMobile: double.tryParse(json['zoom_mobile'].toString()),
      );

  static List<Population> _getPopulations(json) {
    final List<Population> populations = <Population>[];
    if (json != null) {
      json.forEach((v) {
        populations.add(PopulationAdapter.fromJson(v as Map<String, dynamic>));
      });
    }
    return populations;
  }

  static Map<String, dynamic> toJson(Region region) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_ptbr'] = region.namePtbr;
    data['uid'] = region.uid;
    if (region.center != null) {
      data['center'] = CenterAdapter.toJson(region.center as CenterModel);
    }
    data['continent'] = region.continent;
    data['url_prismic'] = region.urlPrismic;
    data['image'] = region.image;
    data['proportion'] = region.proportion;
    data['name'] = region.name;
    data['zoom_desktop'] = region.zoomDesktop;
    if (region.bounds != null) {
      data['bounds'] = BoundsAdapter.toJson(region.bounds as BoundsModel);
    }
    data['zoom_mobile'] = region.zoomMobile;
    return data;
  }
}

class PopulationAdapter {
  static Population fromJson(Map<String, dynamic> json) => Population(
        namePtbr: json['name_ptbr'] as String,
        uid: json['uid'] as String,
        group: json['group'] as String,
        center: json['center'] != null
            ? CenterAdapter.fromJson(json['center'] as Map<String, dynamic>)
            : null,
        continent: json['continent'] as String,
        urlPrismic: json['url_prismic'] as String,
        region: json['region'] as String,
        image: json['image'] as String,
        proportion: double.tryParse(json['proportion'].toString()),
        name: json['name'] as String,
        zoomDesktop: double.tryParse(json['zoom_desktop'].toString()),
        bounds: json['bounds'] != null
            ? BoundsAdapter.fromJson(json['bounds'] as Map<String, dynamic>)
            : null,
        zoomMobile: double.tryParse(json['zoom_mobile'].toString()),
      );

  static Map<String, dynamic> toJson(Population population) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_ptbr'] = population.namePtbr;
    data['uid'] = population.uid;
    data['group'] = population.group;
    if (population.center != null) {
      data['center'] = CenterAdapter.toJson(population.center as CenterModel);
    }
    data['continent'] = population.continent;
    data['url_prismic'] = population.urlPrismic;
    data['region'] = population.region;
    data['image'] = population.image;
    data['proportion'] = population.proportion;
    data['name'] = population.name;
    data['zoom_desktop'] = population.zoomDesktop;
    if (population.bounds != null) {
      data['bounds'] = BoundsAdapter.toJson(population.bounds as BoundsModel);
    }
    data['zoom_mobile'] = population.zoomMobile;
    return data;
  }
}

BoundsModel? _getBounds(json) {
  return (json != null)
      ? BoundsAdapter.fromJson(json as Map<String, dynamic>)
      : null;
}

class BoundsAdapter {
  static BoundsModel fromJson(Map<String, dynamic> json) => BoundsModel(
        bound1: json['bound1'] != null
            ? CenterAdapter.fromJson(json['bound1'] as Map<String, dynamic>)
            : null,
        bound2: json['bound2'] != null
            ? CenterAdapter.fromJson(json['bound2'] as Map<String, dynamic>)
            : null,
      );

  static Map<String, dynamic> toJson(BoundsModel bounds) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bounds.bound2 != null) {
      data['bound2'] = CenterAdapter.toJson(bounds.bound2 as CenterModel);
    }
    if (bounds.bound1 != null) {
      data['bound1'] = CenterAdapter.toJson(bounds.bound1 as CenterModel);
    }
    return data;
  }
}

CenterModel _getCenter(json) {
  return CenterAdapter.fromJson(json as Map<String, dynamic>);
}

class CenterAdapter {
  static CenterModel fromJson(Map<String, dynamic> json) => CenterModel(
        lat: normalizeLatitude(json['lat']),
        lng: normalizeLatitude(json['lng']),
      );
  static Map<String, dynamic> toJson(CenterModel center) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = center.lat.toString();
    data['lng'] = center.lng.toString();
    return data;
  }
}

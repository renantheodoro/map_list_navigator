import 'package:flutter/cupertino.dart';
import 'package:map_navigation/data/datasource/origins_datasource.dart';
import 'package:map_navigation/data/repositories/origins_repository.dart';
import 'package:map_navigation/domain/entities/origins_result_entity.dart';
import 'package:map_navigation/domain/usecases/get_origins_data_usecase.dart';
import 'package:map_navigation/presentation/views/continents_section/continents_model.dart';
import 'package:map_navigation/presentation/views/result_page_model.dart';

ResultPageModel getOriginsResultViewModel(BuildContext context) =>
    ResultPageModel(
        context: context, usecase: getGetOriginsDataUsecase());

GetOriginsDataUsecase getGetOriginsDataUsecase() =>
    GetOriginsDataUsecase(protocol: getOriginsRepository());

OriginsRepository getOriginsRepository() =>
    OriginsRepository(dataSource: OriginsDataSource());

ContinentsViewModel getContinentViewModel(OriginsResultEntity ancestryInfo) =>
    ContinentsViewModel(ancestryInfo);
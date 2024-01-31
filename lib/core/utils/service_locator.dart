import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reading/core/utils/api._service.dart';
import 'package:reading/features/home/data/data_sources/home_local_data_source.dart';
import 'package:reading/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:reading/features/home/data/repos/home_repo_impl.dart';

GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpel>(
    HomeRepoImpel(
      homelocaldatasource: HomeLocalDataSourceImpl(),
      homeremotedatasource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}

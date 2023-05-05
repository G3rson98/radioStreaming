import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/audio/audio_repository.dart';
import 'core/audio/just_audio_repository.dart';
import 'core/http/http_options.dart';
import 'core/network/url_launcher.dart';
import 'core/network/url_repository.dart';
import 'features/home/domain/use_cases/check_url_use_case.dart';
import 'features/home/domain/use_cases/open_url_use_case.dart';
import 'features/menu/data/data_sources/social_network_remote_datasource.dart';
import 'features/menu/data/repositories/social_network_repository_impl.dart';
import 'features/menu/domain/repositories/social_network_repository.dart';
import 'features/menu/domain/use_cases/get_social_networks_use_case.dart';
import 'features/radio/data/datasources/radio_remote_datasource.dart';
import 'features/radio/data/repositories/radio_repository_impl.dart';
import 'features/radio/domain/repositories/radio_repository.dart';

List<RepositoryProvider> get repositories{
  return [
    //External
    RepositoryProvider<Dio>(create: (_) => HttpOptions.dio),
    RepositoryProvider<UrlRepository>(create: (_) => UrlLauncher()),

    //Datasources
    RepositoryProvider<RadioRemoteDataSource>(create: (context) => RadioRemoteDataSourceImpl(context.read())),
    RepositoryProvider<SocialNetworkRemoteDataSource>(create: (context) => SocialNetworkRemoteDataSourceImpl(context.read())),

    //Repositories
    RepositoryProvider<AudioRepository>(create: (_) => JustAudioRepository()),
    RepositoryProvider<RadioRepository>(create: (context) => RadioRepositoryImpl(context.read())),
    RepositoryProvider<SocialNetworkRepository>(create: (context) => SocialNetworkRepositoryImpl(context.read())),

    //Use cases
    RepositoryProvider<OpenUrl>(create: (context) => OpenUrl(context.read())),
    RepositoryProvider<CheckUrl>(create: (context) => CheckUrl(context.read())),

    RepositoryProvider<GetSocialNetworks>(create: (context) => GetSocialNetworks(context.read())),

  ];
}
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/audio/audio_repository.dart';
import 'core/audio/just_audio_repository.dart';
import 'core/http/http_options.dart';
import 'core/network/url_launcher.dart';
import 'core/network/url_repository.dart';
import 'features/announcement/data/data_sources/announcement_remote_datasource.dart';
import 'features/announcement/data/repositories/announcement_repository_impl.dart';
import 'features/announcement/domain/repositories/announcement_repository.dart';
import 'features/announcement/domain/use_cases/get_announcements_use_case.dart';
import 'features/library/data/data_sources/history_remote_datasource.dart';
import 'features/library/data/repositories/history_repository_impl.dart';
import 'features/library/domain/repositories/history_repository.dart';
import 'features/library/domain/use_cases/get_past_episodes_use_case.dart';
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
    RepositoryProvider<HistoryRemoteDataSource>(create: (context) => HistoryRemoteDataSourceImpl(context.read())),
    RepositoryProvider<HistoryRemoteDataSource>(create: (context) => HistoryRemoteDataSourceImpl(context.read())),
    RepositoryProvider<AnnouncementRemoteDataSource>(create: (context) => AnnouncementRemoteDataSourceImpl(context.read())),



    //Repositories
    RepositoryProvider<AudioRepository>(create: (_) => JustAudioRepository()),
    RepositoryProvider<RadioRepository>(create: (context) => RadioRepositoryImpl(context.read())),
    RepositoryProvider<SocialNetworkRepository>(create: (context) => SocialNetworkRepositoryImpl(context.read())),
    RepositoryProvider<HistoryRepository>(create: (context) => HistoryRepositoryImpl(context.read())),
    RepositoryProvider<AnnouncementRepository>(create: (context) => AnnouncementRepositoryImpl(context.read())),


    //Use cases
    RepositoryProvider<OpenUrl>(create: (context) => OpenUrl(context.read())),
    RepositoryProvider<CheckUrl>(create: (context) => CheckUrl(context.read())),

    RepositoryProvider<GetSocialNetworks>(create: (context) => GetSocialNetworks(context.read())),
    RepositoryProvider<GetPastEpisodes>(create: (context) => GetPastEpisodes(context.read())),
    RepositoryProvider<GetAnnouncements>(create: (context) => GetAnnouncements(context.read())),



  ];
}
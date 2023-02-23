import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/audio/audio_repository.dart';
import 'core/audio/just_audio_repository.dart';
import 'core/http/http_options.dart';
import 'features/radio/data/datasources/radio_remote_datasource.dart';
import 'features/radio/data/repositories/radio_repository_impl.dart';
import 'features/radio/domain/repositories/radio_repository.dart';

List<RepositoryProvider> get repositories{
  return [
    //External
    RepositoryProvider<Dio>(create: (_) => HttpOptions.dio),
    //Datasources
    RepositoryProvider<RadioRemoteDataSource>(create: (context) => RadioRemoteDataSourceImpl(context.read())),

    //Repositories
    RepositoryProvider<AudioRepository>(create: (_) => JustAudioRepository()),
    RepositoryProvider<RadioRepository>(create: (context) => RadioRepositoryImpl(context.read())),

  ];
}
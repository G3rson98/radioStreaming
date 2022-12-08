import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/audio/audio_repository.dart';
import 'core/audio/just_audio_repository.dart';

List<RepositoryProvider> get repositories{
  return [
    RepositoryProvider<AudioRepository>(create: (_) => JustAudioRepository()),
  ];
}
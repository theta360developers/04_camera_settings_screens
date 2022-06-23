import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';

import '../../services/theta_service.dart';

part 'video_settings_event.dart';
part 'video_settings_state.dart';

class VideoSettingsBloc extends Bloc<VideoSettingsEvent, VideoSettingsState> {
  VideoSettingsBloc() : super(VideoSettingsState.initial()) {
    var chopper = ChopperClient(
        services: [ThetaService.create()], converter: const JsonConverter());
    final thetaService = chopper.getService<ThetaService>();
    on<Video8K2FPSEvent>((event, emit) async {
      var response = await thetaService.command({
        'name': 'camera.setOptions',
        'parameters': {
          'options': {
            'fileFormat': {
              'type': 'mp4',
              'width': 7680,
              'height': 3840,
              '_codec': 'H.264/MPEG-4 AVC',
              '_frameRate': 2
            }
          }
        }
      });
      emit(VideoSettingsState(responseMessage: response.bodyString));

      // TODO: implement event handler
    });
    on<Video8K10FPSEvent>((event, emit) async {
      var response = await thetaService.command({
        'name': 'camera.setOptions',
        'parameters': {
          'options': {
            'fileFormat': {
              'type': 'mp4',
              'width': 7680,
              'height': 3840,
              '_codec': 'H.264/MPEG-4 AVC',
              '_frameRate': 10
            }
          }
        }
      });
      emit(VideoSettingsState(responseMessage: response.bodyString));

      // TODO: implement event handler
    });
    on<Video4K30FPSEvent>((event, emit) async {
      var response = await thetaService.command({
        'name': 'camera.setOptions',
        'parameters': {
          'options': {
            'fileFormat': {
              'type': 'mp4',
              'width': 3840,
              'height': 1920,
              '_codec': 'H.264/MPEG-4 AVC',
              '_frameRate': 30
            }
          }
        }
      });
      emit(VideoSettingsState(responseMessage: response.bodyString));

      // TODO: implement event handler
    });
    on<FineBitRateEvent>((event, emit) async {
      var response = await thetaService.command({
        'name': 'camera.setOptions',
        'parameters': {
          'options': {'_bitrate': 'Fine'}
        }
      });
      emit(VideoSettingsState(responseMessage: response.bodyString));
    });
    on<NormalBitRateEvent>((event, emit) async {
      var response = await thetaService.command({
        'name': 'camera.setOptions',
        'parameters': {
          'options': {'_bitrate': 'Normal'}
        }
      });
      emit(VideoSettingsState(responseMessage: response.bodyString));
    });
    on<EconomyBitRateEvent>((event, emit) async {
      var response = await thetaService.command({
        'name': 'camera.setOptions',
        'parameters': {
          'options': {'_bitrate': 'Economy'}
        }
      });
      emit(VideoSettingsState(responseMessage: response.bodyString));
    });
    on<VideoStitchingOnEvent>((event, emit) async {
      var response = await thetaService.command({
        'name': 'camera.setOptions',
        'parameters': {
          'options': {'videoStitching': 'ondevice'}
        }
      });
      emit(VideoSettingsState(responseMessage: response.bodyString));
    });
    on<VideoStitchingOffEvent>((event, emit) async {
      var response = await thetaService.command({
        'name': 'camera.setOptions',
        'parameters': {
          'options': {'videoStitching': 'none'}
        }
      });
      emit(VideoSettingsState(responseMessage: response.bodyString));
    });
  }
}

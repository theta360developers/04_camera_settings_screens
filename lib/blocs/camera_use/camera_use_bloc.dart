import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../services/theta_service.dart';

part 'camera_use_event.dart';
part 'camera_use_state.dart';

class CameraUseBloc extends Bloc<CameraUseEvent, CameraUseState> {
  CameraUseBloc() : super(CameraUseState.initial()) {
    var chopper = ChopperClient(
        services: [ThetaService.create()], converter: const JsonConverter());
    final thetaService = chopper.getService<ThetaService>();
    on<TakePictureEvent>((event, emit) async {
      var response = await thetaService.command({'name': 'camera.takePicture'});
      emit(CameraUseState(responseMessage: response.bodyString));
      print(response.body);
    });
    on<StartCaptureEvent>((event, emit) async {
      emit(CameraUseState(responseMessage: '', isRecording: true));
      var response =
          await thetaService.command({'name': 'camera.startCapture'});
      emit(CameraUseState(
          responseMessage: response.bodyString, isRecording: true));
      print(response.body);
    });
    on<StopCaptureEvent>(
      (event, emit) async {
        emit(CameraUseState(responseMessage: '', isRecording: false));
        var response =
            await thetaService.command({'name': 'camera.stopCapture'});
        emit(CameraUseState(
            responseMessage: response.bodyString, isRecording: false));
        print(response.body);
      },
    );
    on<VideoModeEvent>((event, emit) async {
      var response = await thetaService.command({
        'name': 'camera.setOptions',
        'parameters': {
          'options': {'captureMode': 'video'}
        }
      });
      emit(CameraUseState(responseMessage: response.body));
    });
  }
}

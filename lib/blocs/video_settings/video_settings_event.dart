part of 'video_settings_bloc.dart';

abstract class VideoSettingsEvent extends Equatable {
  const VideoSettingsEvent();

  @override
  List<Object> get props => [];
}

class Video8K2FPSEvent extends VideoSettingsEvent {}

class Video8K10FPSEvent extends VideoSettingsEvent {}

class Video4K30FPSEvent extends VideoSettingsEvent {}

class FineBitRateEvent extends VideoSettingsEvent {}

class NormalBitRateEvent extends VideoSettingsEvent {}

class EconomyBitRateEvent extends VideoSettingsEvent {}

class VideoStitchingOnEvent extends VideoSettingsEvent {}

class VideoStitchingOffEvent extends VideoSettingsEvent {}

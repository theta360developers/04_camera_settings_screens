part of 'image_settings_bloc.dart';

class ImageSettingsEvent extends Equatable {
  const ImageSettingsEvent();

  @override
  List<Object> get props => [];
}

class ImageStitchingAutoEvent extends ImageSettingsEvent {}

class ImageStitchingNoneEvent extends ImageSettingsEvent {}

class ImageStitchingStaticEvent extends ImageSettingsEvent {}

class ImageStitchingDynamicEvent extends ImageSettingsEvent {}

class ImageStitchingDynamicSemiAutoEvent extends ImageSettingsEvent {}

class TopBottomCorrectionEvent extends ImageSettingsEvent {}

class TopBottomDisapplyEvent extends ImageSettingsEvent {}

class ExposureMinus2Event extends ImageSettingsEvent {}

class ExposureMinus1Event extends ImageSettingsEvent {}

class Exposure0Event extends ImageSettingsEvent {}

class Exposure1Event extends ImageSettingsEvent {}

class Exposure2Event extends ImageSettingsEvent {}

class FilterHDREvent extends ImageSettingsEvent {}

class FilterOffEvent extends ImageSettingsEvent {}

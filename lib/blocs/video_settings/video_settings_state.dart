part of 'video_settings_bloc.dart';

class VideoSettingsState extends Equatable {
  final String responseMessage;

  const VideoSettingsState({
    required this.responseMessage,
  });

  factory VideoSettingsState.initial() => VideoSettingsState(
        responseMessage: 'video settings',
      );

  @override
  List<Object> get props => [responseMessage];

  VideoSettingsState copyWith({
    String? responseMessage,
  }) {
    return VideoSettingsState(
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }

  @override
  bool get stringify => true;
}

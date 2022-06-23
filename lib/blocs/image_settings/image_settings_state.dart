part of 'image_settings_bloc.dart';

class ImageSettingsState extends Equatable {
  final String response;
  const ImageSettingsState({
    required this.response,
  });
  factory ImageSettingsState.initial() =>
      ImageSettingsState(response: 'initial');

  @override
  List<Object> get props => [response];

  @override
  bool get stringify => true;

  ImageSettingsState copyWith({
    String? response,
  }) {
    return ImageSettingsState(
      response: response ?? this.response,
    );
  }
}

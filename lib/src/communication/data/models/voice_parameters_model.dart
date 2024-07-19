import 'package:tablah/src/communication/domain/entities/voice_parameters.dart';

class VoiceParametersModel extends VoiceParameters {
  VoiceParametersModel(
      {required super.volume,
      required super.rate,
      required super.pitch,
      required super.text});

  static VoiceParametersModel empty = VoiceParametersModel(
    volume: 1.0,
    rate: 0.5,
    pitch: 1.0,
    text: "",
  );

  VoiceParametersModel copyWith({
    double? volume,
    double? rate,
    double? pitch,
    String? text,
  }) =>
      VoiceParametersModel(
        volume: volume ?? this.volume,
        rate: rate ?? this.rate,
        pitch: pitch ?? this.pitch,
        text: text ?? this.text,
      );

  Map<dynamic, dynamic> toJson() => {
        'volume': volume,
        'rate': rate,
        'pitch': pitch,
        'text': text,
      };

  factory VoiceParametersModel.fromJson(Map<dynamic, dynamic> json) {
    return VoiceParametersModel(
      volume: json['volume'] as double,
      rate: json['rate'] as double,
      pitch: json['pitch'] as double,
      text: json['text'] as String,
    );
  }

  factory VoiceParametersModel.fromEntity(VoiceParameters entity) =>
      VoiceParametersModel(
        volume: entity.volume,
        rate: entity.rate,
        pitch: entity.pitch,
        text: entity.text,
      );
}

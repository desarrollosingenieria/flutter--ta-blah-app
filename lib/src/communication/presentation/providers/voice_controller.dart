import 'package:tablah/src/communication/application/services/communication_service.dart';
import 'package:tablah/src/communication/domain/entities/voice_parameters.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_controller.g.dart';

@Riverpod(keepAlive: true)
class VoiceController extends _$VoiceController {
  final CommunicationService voiceService = CommunicationService();

  @override
  VoiceParameters build() => CommunicationService().voiceParameters;

  Future<void> speak({required String text}) async {
    final result = await voiceService.speak(text);
    result.fold(
      (f) => f,
      (r) => r,
    );
  }

  Future<bool> setVolume(double volume) async {
    double currentVolume = state.volume;
    if (currentVolume + volume > 0 && currentVolume + volume <= 1) {
      currentVolume += volume;
    }

    final VoiceParameters parameters = VoiceParameters(
      volume: double.parse(currentVolume.toStringAsFixed(2)),
      rate: state.rate,
      pitch: state.pitch,
      text: state.text,
    );
    state = parameters;
    return voiceService.setVoiceParameters(parameters);
  }

  Future<bool> setRate(double rate) async {
    double currentRate = state.rate;
    if (currentRate + rate > 0 && currentRate + rate <= 1) {
      currentRate += rate;
    }
    final VoiceParameters parameters = VoiceParameters(
      volume: state.volume,
      rate: double.parse(currentRate.toStringAsFixed(2)),
      pitch: state.pitch,
      text: state.text,
    );
    state = parameters;
    return voiceService.setVoiceParameters(parameters);
  }

  Future<bool> setPitch(double pitch) async {
    double currentPitch = state.pitch;
    if (currentPitch + pitch > 0 && currentPitch + pitch <= 1) {
      currentPitch += pitch;
    }
    final VoiceParameters parameters = VoiceParameters(
      volume: state.volume,
      rate: state.rate,
      pitch: double.parse(currentPitch.toStringAsFixed(2)),
      text: state.text,
    );

    state = parameters;
    return voiceService.setVoiceParameters(parameters);
  }

  Future<bool> setText({required String text}) async {
    final VoiceParameters parameters = VoiceParameters(
      volume: state.volume,
      rate: state.rate,
      pitch: state.pitch,
      text: text,
    );

    state = parameters;
    return voiceService.setVoiceParameters(parameters);
  }

  Future<bool> deleteAllText() {
    final VoiceParameters parameters = VoiceParameters(
      volume: state.volume,
      rate: state.rate,
      pitch: state.pitch,
      text: '',
    );

    state = parameters;
    return voiceService.setVoiceParameters(parameters);
  }

  Future<bool> deleteLast() {
    String? newText;
    if (state.text.isNotEmpty) {
      newText = state.text.substring(0, state.text.length - 1);
      final VoiceParameters parameters = VoiceParameters(
        volume: state.volume,
        rate: state.rate,
        pitch: state.pitch,
        text: newText,
      );

      state = parameters;
      return voiceService.setVoiceParameters(parameters);
    }
    return Future.value(false);
  }
}

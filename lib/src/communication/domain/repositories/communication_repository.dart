import 'package:tablah/core/errors/failures.dart';
import 'package:tablah/src/communication/domain/entities/voice_parameters.dart';
import 'package:dartz/dartz.dart';

abstract class CommunicationRepository {
    Future<Either<Failure, bool>> initVoiceParameters();
    Future<Either<Failure, bool>> initLanguages();
    Future<Either<Failure, bool>> setVoiceParameters(VoiceParameters parameters);
    Future<Either<Failure, VoiceParameters>> getVoiceParameters();
    Future<Either<Failure, bool>> clearVoiceParameters();
    Future<Either<Failure, bool>> speak(String text);
    VoiceParameters get voiceParameters;
    
}
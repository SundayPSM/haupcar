import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lang_event.dart';
part 'lang_state.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(const LangState()) {
    on<InitialLangEvent>(_onInit);
    on<OnLangChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          lang: state.lang.languageCode == "en" ? const Locale("th", "TH") : const Locale("en", "US"),
        ),
      );
    });
  }

  FutureOr<void> _onInit(InitialLangEvent event, Emitter<LangState> emit) {
    emit(state);
  }
}

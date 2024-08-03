part of 'lang_bloc.dart';

sealed class LangEvent extends Equatable {
  const LangEvent();

  @override
  List<Object> get props => [];
}

class InitialLangEvent extends LangEvent {}

class OnLangChangedEvent extends LangEvent {}

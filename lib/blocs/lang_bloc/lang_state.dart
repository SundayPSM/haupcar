// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lang_bloc.dart';

class LangState extends Equatable {
  const LangState({
    this.lang = const Locale("en", "US"),
  });
  final Locale lang;

  @override
  List<Object> get props => [lang];

  LangState copyWith({
    Locale? lang,
  }) {
    return LangState(
      lang: lang ?? this.lang,
    );
  }
}

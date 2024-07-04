import 'package:bloc/bloc.dart';
import 'mood_diary_event.dart';
import 'mood_diary_state.dart';

class MoodDiaryBloc extends Bloc<MoodDiaryEvent, MoodDiaryState> {
  MoodDiaryBloc() : super(const MoodDiaryState()) {
    on<NoteChanged>((event, emit) {
      final isSaveButtonEnabled = event.note.trim().isNotEmpty;
      emit(state.copyWith(
          note: event.note, isSaveButtonEnabled: isSaveButtonEnabled));
    });

    on<TabSelected>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });

    on<MoodTabSelected>((event, emit) {
      emit(state.copyWith(
          selectedMoodTab: event.moodTab, selectedMoodImage: event.moodImage));
    });

    on<ChipsSelected>((event, emit) {
      emit(state.copyWith(selectedChips: event.chips));
    });

    on<StressLevelChanged>((event, emit) {
      emit(state.copyWith(stressLevel: event.stressLevel));
    });

    on<SelfEsteemLevelChanged>((event, emit) {
      emit(state.copyWith(selfEsteemLevel: event.selfEsteemLevel));
    });

    on<Save>((event, emit) {
      // Handle save logic if necessary
    });
  }
}

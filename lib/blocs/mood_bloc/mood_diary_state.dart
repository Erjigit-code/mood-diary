import 'package:equatable/equatable.dart';

class MoodDiaryState extends Equatable {
  final int selectedIndex;
  final String selectedMoodTab;
  final String? selectedMoodImage;
  final List<String> selectedChips;
  final double stressLevel;
  final double selfEsteemLevel;
  final String note;
  final bool isSaveButtonEnabled;

  const MoodDiaryState({
    this.selectedIndex = 0,
    this.selectedMoodTab = 'Радость',
    this.selectedMoodImage,
    this.selectedChips = const [],
    this.stressLevel = 0,
    this.selfEsteemLevel = 0,
    this.note = '',
    this.isSaveButtonEnabled = false,
  });

  MoodDiaryState copyWith({
    int? selectedIndex,
    String? selectedMoodTab,
    String? selectedMoodImage,
    List<String>? selectedChips,
    double? stressLevel,
    double? selfEsteemLevel,
    String? note,
    bool? isSaveButtonEnabled,
  }) {
    return MoodDiaryState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedMoodTab: selectedMoodTab ?? this.selectedMoodTab,
      selectedMoodImage: selectedMoodImage ?? this.selectedMoodImage,
      selectedChips: selectedChips ?? this.selectedChips,
      stressLevel: stressLevel ?? this.stressLevel,
      selfEsteemLevel: selfEsteemLevel ?? this.selfEsteemLevel,
      note: note ?? this.note,
      isSaveButtonEnabled: isSaveButtonEnabled ?? this.isSaveButtonEnabled,
    );
  }

  @override
  List<Object?> get props => [
        selectedIndex,
        selectedMoodTab,
        selectedMoodImage,
        selectedChips,
        stressLevel,
        selfEsteemLevel,
        note,
        isSaveButtonEnabled,
      ];
}

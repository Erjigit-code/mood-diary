import 'package:flutter/material.dart';
import 'package:mood_diary/components/buttons/save_button.dart';
import 'package:mood_diary/components/inputs/notes_input.dart';
import 'package:mood_diary/widgets/mood_widget.dart';
import 'package:mood_diary/widgets/stress_level_widget.dart';

class MoodDiaryTab extends StatelessWidget {
  final double containerWidth;
  final String selectedMoodTab;
  final List<String> selectedChips;
  final double stressLevel;
  final double selfEsteemLevel;
  final TextEditingController notesController;
  final FocusNode notesFocusNode; // Add this line
  final bool isSaveButtonEnabled;
  final VoidCallback onSave;
  final ValueChanged<String> onMoodTabSelected;
  final ValueChanged<List<String>> onChipsSelected;
  final ValueChanged<String> onImageSelected;
  final ValueChanged<double> onStressLevelChanged;
  final ValueChanged<double> onSelfEsteemLevelChanged;

  const MoodDiaryTab({
    Key? key,
    required this.containerWidth,
    required this.selectedMoodTab,
    required this.selectedChips,
    required this.stressLevel,
    required this.selfEsteemLevel,
    required this.notesController,
    required this.notesFocusNode, // Add this line
    required this.isSaveButtonEnabled,
    required this.onSave,
    required this.onMoodTabSelected,
    required this.onChipsSelected,
    required this.onImageSelected,
    required this.onStressLevelChanged,
    required this.onSelfEsteemLevelChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Что чувствуешь?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito-bold',
            ),
          ),
        ),
        const SizedBox(height: 10),
        MoodWidget(
          onTabSelected: onMoodTabSelected,
          onChipsSelected: onChipsSelected,
          onImageSelected: onImageSelected,
        ),
        Container(
          width: containerWidth,
          child: StressLevelWidget(
            title: 'Уровень стресса',
            lowLabel: 'Низкий',
            highLabel: 'Высокий',
            onChanged: onStressLevelChanged,
          ),
        ),
        Container(
          width: containerWidth,
          child: StressLevelWidget(
            title: 'Самооценка',
            lowLabel: 'Неуверенность',
            highLabel: 'Уверенность',
            onChanged: onSelfEsteemLevelChanged,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: containerWidth,
          child: const Text(
            'Заметки',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito-bold',
            ),
          ),
        ),
        const SizedBox(height: 10),
        NotesInput(
          containerWidth: containerWidth,
          notesController: notesController,
          focusNode: notesFocusNode, // Add this line
        ),
        const SizedBox(height: 20),
        SaveButton(
          containerWidth: containerWidth,
          isSaveButtonEnabled: isSaveButtonEnabled,
          onSave: onSave,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

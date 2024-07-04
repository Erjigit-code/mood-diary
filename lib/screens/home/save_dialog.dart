import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/blocs/mood_bloc/mood_diary_bloc.dart';
import 'package:mood_diary/blocs/mood_bloc/mood_diary_event.dart';
import 'package:mood_diary/screens/home/journal_tab.dart';

import 'package:mood_diary/screens/home/mood_entry.dart';

class SaveDialog extends StatelessWidget {
  final String selectedMoodTab;
  final String? selectedMoodImage;
  final List<String> selectedChips;
  final double stressLevel;
  final double selfEsteemLevel;
  final String notes;

  const SaveDialog({
    Key? key,
    required this.selectedMoodTab,
    required this.selectedMoodImage,
    required this.selectedChips,
    required this.stressLevel,
    required this.selfEsteemLevel,
    required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentTextStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Nunito-bold',
      ),
      backgroundColor: Colors.white.withOpacity(0.75),
      content: SingleChildScrollView(
        child: MoodEntryWidget(
          selectedMoodTab: selectedMoodTab,
          selectedMoodImage: selectedMoodImage,
          selectedChips: selectedChips,
          stressLevel: stressLevel,
          selfEsteemLevel: selfEsteemLevel,
          notes: notes,
        ),
      ),
      actions: <Widget>[
        Container(
          width: 100,
          height: 50,
          child: TextButton(
            child: const Text('OK'),
            onPressed: () {
              context.read<MoodDiaryBloc>().add(Save());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JournalScreen()),
              );
            },
          ),
        ),
      ],
    ).animate().scale(duration: 500.ms, curve: Curves.easeInOut);
  }
}

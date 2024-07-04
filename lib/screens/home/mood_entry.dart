import 'package:flutter/material.dart';

class MoodEntryWidget extends StatelessWidget {
  final String selectedMoodTab;
  final String? selectedMoodImage;
  final List<String> selectedChips;
  final double stressLevel;
  final double selfEsteemLevel;
  final String notes;

  const MoodEntryWidget({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildMoodInfo(),
        _buildChipInfo(),
        _buildStressLevelInfo(),
        _buildSelfEsteemLevelInfo(),
        _buildNotesInfo(),
      ],
    );
  }

  Widget _buildMoodInfo() {
    return Column(
      children: [
        const SizedBox(width: 10),
        Text(
          'Ваше настроение: $selectedMoodTab',
          style: TextStyle(fontSize: 25),
        ),
        if (selectedMoodImage != null)
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(
              selectedMoodImage!,
              fit: BoxFit.fill,
            ),
          ),
      ],
    );
  }

  Widget _buildChipInfo() {
    return Text('Вы испытваете: ${selectedChips.join(', ')}');
  }

  Widget _buildStressLevelInfo() {
    return Text('Уровень стресса: ${stressLevel.toStringAsFixed(1)}');
  }

  Widget _buildSelfEsteemLevelInfo() {
    return Text('Самооценка: ${selfEsteemLevel.toStringAsFixed(1)}');
  }

  Widget _buildNotesInfo() {
    return Text('Ваша заметка: $notes');
  }
}

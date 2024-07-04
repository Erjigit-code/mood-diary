import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        child: ListBody(
          children: <Widget>[
            _buildMoodInfo(),
            _buildChipInfo(),
            _buildStressLevelInfo(),
            _buildSelfEsteemLevelInfo(),
            _buildNotesInfo(),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ).animate().scale(duration: 500.ms, curve: Curves.easeInOut);
  }

  Widget _buildMoodInfo() {
    return Column(
      children: [
        const SizedBox(width: 10),
        Text(
          textAlign: TextAlign.center,
          'Ваше настроение: $selectedMoodTab',
          style: TextStyle(fontSize: 25),
        ),
        if (selectedMoodImage != null)
          Container(
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

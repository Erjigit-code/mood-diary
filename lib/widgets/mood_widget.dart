import 'package:flutter/material.dart';
import 'package:mood_diary/widgets/choiceChipContainer.dart';

class MoodWidget extends StatefulWidget {
  final ValueChanged<String> onTabSelected;
  final ValueChanged<List<String>> onChipsSelected;
  final ValueChanged<String> onImageSelected;

  const MoodWidget({
    Key? key,
    required this.onTabSelected,
    required this.onChipsSelected,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  _MoodWidgetState createState() => _MoodWidgetState();
}

class _MoodWidgetState extends State<MoodWidget> {
  int? _selectedTab;
  List<String> selectedOptions = [];

  final List<String> tabs = [
    'Радость',
    'Страх',
    'Бешенство',
    'Грусть',
    'Спокойствие',
    'Сила'
  ];

  final List<List<String>> chips = [
    [
      'Возбуждение',
      'Восторг',
      'Игривость',
      'Наслаждение',
      'Удовольствие',
      'Эйфория',
      'Умиротворение',
      'Довольство',
      'Воодушевление'
    ],
    [
      'Очарование',
      'Осознанность',
      'Смелость',
      'Тревога',
      'Паника',
      'Беспокойство',
      'Испуг',
      'Опасение',
      'Напряжение'
    ],
    [
      'Удовольствие',
      'Чувственность',
      'Энергичность',
      'Гнев',
      'Злоба',
      'Раздражение',
      'Ярость',
      'Фрустрация',
      'Негодование'
    ],
    [
      'Экстравагантность',
      'Печаль',
      'Тоска',
      'Меланхолия',
      'Уныние',
      'Депрессия',
      'Огорчение'
    ],
    [
      'Мир',
      'Безмятежность',
      'Гармония',
      'Расслабление',
      'Спокойствие',
      'Уравновешенность'
    ],
    ['Мощь', 'Сила', 'Воля', 'Мужество', 'Решимость', 'Энергия', 'Власть'],
  ];

  final List<String> imagePaths = [
    'assets/emojis/happy.png',
    'assets/emojis/fear.png',
    'assets/emojis/madness.png',
    'assets/emojis/sadness.png',
    'assets/emojis/calmness.png',
    'assets/emojis/power.png',
  ];

  void _handleChipSelection(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
    widget.onChipsSelected(selectedOptions);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(tabs.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (_selectedTab == index) {
                      _selectedTab = null;
                      selectedOptions.clear();
                    } else {
                      _selectedTab = index;
                      selectedOptions.clear();
                    }
                  });
                  widget.onTabSelected(tabs[index]);
                  widget.onChipsSelected(selectedOptions);
                  widget.onImageSelected(imagePaths[index]);
                },
                child: Container(
                  height: 118,
                  width: 83,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: _selectedTab == index
                          ? Colors.orange
                          : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(76),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePaths[index],
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        tabs[index],
                        style:
                            const TextStyle(fontFamily: 'Nunito', fontSize: 11),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        if (_selectedTab != null) ...[
          const SizedBox(height: 10),
          Container(
            width: 329,
            child: ChoiceChipContainer(
              options: chips[_selectedTab!],
              selectedOptions: selectedOptions,
              onSelected: _handleChipSelection,
            ),
          ),
        ]
      ],
    );
  }
}

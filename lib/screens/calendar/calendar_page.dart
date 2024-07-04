import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _monthKeys = {};
  late final int currentMonthIndex;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    currentMonthIndex = DateTime.now().month - 1;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentMonth();
    });
  }

  void _scrollToCurrentMonth() {
    if (_monthKeys.containsKey(currentMonthIndex)) {
      final context = _monthKeys[currentMonthIndex]!.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(context,
            duration: Duration(seconds: 1), curve: Curves.easeInOut);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _goToToday() {
    _scrollToCurrentMonth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFDFC),
      appBar: AppBar(
        surfaceTintColor: Color(0xffFFFDFC),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFDFC),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: Color(0xffBCBCBF),
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              onPressed: _goToToday,
              child: const Text(
                'Сегодня',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    color: Color(0xffBCBCBF)),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const DaysOfWeekHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: List.generate(12, (index) {
                    DateTime month =
                        DateTime(DateTime.now().year, index + 1, 1);
                    _monthKeys[index] = GlobalKey();
                    return Container(
                      key: _monthKeys[index],
                      child: MonthCalendar(
                        month: month,
                        selectedDay: _selectedDay,
                        onDaySelected: (selectedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DaysOfWeekHeader extends StatelessWidget {
  const DaysOfWeekHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> daysOfWeek = ['ВС', 'ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: daysOfWeek.map((day) {
        return Text(
          day,
          style: const TextStyle(
              color: Color(0xffBCBCBF), fontFamily: 'Nunito', fontSize: 16),
        );
      }).toList(),
    );
  }
}

class MonthCalendar extends StatelessWidget {
  final DateTime month;
  final DateTime? selectedDay;
  final void Function(DateTime) onDaySelected;

  const MonthCalendar({
    super.key,
    required this.month,
    required this.selectedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    String year = DateFormat.y('ru').format(month); // Текущий год
    String monthName = toBeginningOfSentenceCase(DateFormat.MMMM('ru')
        .format(month))!; // Название месяца с большой буквы

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          year,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Nunito-bold',
              color: Color(0xffbcbcbf)),
        ),
        Text(
          monthName,
          style: const TextStyle(fontSize: 24, fontFamily: 'Nunito-bold'),
        ),
        TableCalendar(
          daysOfWeekVisible: false,
          locale: 'ru_RU',
          firstDay: DateTime.utc(2022, 1, 1),
          lastDay: DateTime.utc(2024, 12, 31),
          focusedDay: month,
          headerVisible: false,
          pageJumpingEnabled: false,
          availableGestures: AvailableGestures.none, // Отключить жесты
          pageAnimationEnabled: false, // Отключить анимацию страниц
          selectedDayPredicate: (day) => isSameDay(selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            onDaySelected(selectedDay);
          },
          calendarStyle: CalendarStyle(
            weekendTextStyle: TextStyle(
                fontSize: 18, fontFamily: 'Nunito', color: Color(0xff4C4C69)),
            selectedTextStyle: TextStyle(
                fontSize: 18, fontFamily: 'Nunito', color: Color(0xff4C4C69)),
            outsideDaysVisible: false,
            defaultTextStyle: const TextStyle(
                fontSize: 18, fontFamily: 'Nunito', color: Color(0xff4C4C69)),
            todayDecoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.withOpacity(0.3),
            ),
            markersMaxCount: 1,
            markerDecoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            markerBuilder: (context, date, events) {
              if (isSameDay(selectedDay, date)) {
                return Positioned(
                  bottom: 10,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                  ),
                );
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 20), // Добавляем отступ между месяцами
      ],
    );
  }
}

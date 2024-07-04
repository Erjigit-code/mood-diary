import 'package:flutter/material.dart';

class CustomTabs extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomTabs({
    Key? key,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.8;

    return Center(
      child: Container(
        width: containerWidth,
        height: 44,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 100),
              left: widget.selectedIndex == 0 ? 0 : containerWidth * 0.35,
              child: Container(
                width: containerWidth * 0.65,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: widget.selectedIndex == 0 ? 13 : 7,
                  child: GestureDetector(
                    onTap: () => widget.onTabSelected(0),
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            color: widget.selectedIndex == 0
                                ? Colors.white
                                : Colors.grey,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'Дневник настроения',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: widget.selectedIndex == 0
                                      ? Colors.white
                                      : Colors.grey,
                                  fontFamily: 'Nunito',
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: widget.selectedIndex == 0 ? 7 : 13,
                  child: GestureDetector(
                    onTap: () => widget.onTabSelected(1),
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bar_chart,
                            color: widget.selectedIndex == 1
                                ? Colors.white
                                : Colors.grey,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'Статистика',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: widget.selectedIndex == 1
                                      ? Colors.white
                                      : Colors.grey,
                                  fontFamily: 'Nunito',
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

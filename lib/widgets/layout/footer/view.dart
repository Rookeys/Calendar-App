import 'package:calendar_app/constants/customColor.dart';
import 'package:flutter/material.dart';

class NavigaterBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavigaterBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 60,
          child: Row(
            children: [
              NavigationItem(
                Icons.format_list_bulleted,
                pageIndex == 0,
                onTap: () => onTap(0),
              ),
              NavigationItem(
                Icons.calendar_month_outlined,
                pageIndex == 1,
                onTap: () => onTap(1),
              ),
              NavigationItem(
                Icons.notifications_none_outlined,
                pageIndex == 2,
                onTap: () => onTap(2),
              ),
              NavigationItem(
                Icons.person_outline,
                pageIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget NavigationItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: selected ? CustomColor.skyBlue : Colors.black,
          size: 40,
        ),
      ),
    );
  }
}

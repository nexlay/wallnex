import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/navigation_bar/provider/get_default_home_page_notifier.dart';
import 'dart:math' as math;
import '../../../const/const.dart'; // Assuming this is your provider

class CustomNavBarItem extends StatefulWidget {
  const CustomNavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.tabIndex,
    required this.filledIcon, // Add this for the filled icon
  });

  final IconData icon;
  final String label;
  final int tabIndex;
  final IconData filledIcon; // Icon to be used when the tab is selected

  @override
  State<CustomNavBarItem> createState() => _CustomNavBarItemState();
}

class _CustomNavBarItemState extends State<CustomNavBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _positionAnimation;
  late Animation<double> _fillAnimation;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );

    _positionAnimation = Tween<double>(begin: 10.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _fillAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _shakeAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedPage = Provider.of<GetPages>(context);
    final selected = selectedPage.selectedIndex == widget.tabIndex;

    if (selected) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    return InkWell(
      customBorder: RoundedRectangleBorder(
        // Add customBorder
        borderRadius: BorderRadius.circular(kRadius),
      ),
      onTap: () {
        context.read<GetPages>().changeTab(widget.tabIndex);
      },
      child: AnimatedContainer(
        duration: kAnimationDuration,
        padding: kAppPadding,
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).primaryColor.withOpacity(kOpacity)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(kRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_positionAnimation.value, 0),
                  child: ClipRect(
                    child: Transform.rotate(
                      angle: selected ? _shakeAnimation.value : 0.0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Outline icon
                          Opacity(
                            opacity: 1 - _fillAnimation.value,
                            child: Icon(
                              widget.icon,
                              size: kUnselectedIconSize,
                              color: selected
                                  ? Theme.of(context).colorScheme.inversePrimary
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                          ),
                          // Filled icon
                          Opacity(
                            opacity: _fillAnimation.value,
                            child: Icon(
                              widget.filledIcon, // Use the filled icon here
                              size: kSelectedIconSize,
                              color: selected
                                  ? Theme.of(context).colorScheme.inversePrimary
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

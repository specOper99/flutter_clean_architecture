import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class SquareBottomNavBarWidget extends StatelessWidget {
  const SquareBottomNavBarWidget({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 22,
    this.backgroundColor,
    this.itemCornerRadius = 0,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 250),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
    this.containerPadding = const EdgeInsets.symmetric(horizontal: 12),
  })  : assert(
          items.length == 4,
          "Items length must be 4",
        ),
        super(key: key);

  /// padding for the navbar container
  final EdgeInsets containerPadding;

  /// The selected item is index. Changing this property will change and animate
  /// the item being selected. Defaults to zero.
  final int selectedIndex;

  /// The icon size of all items. Defaults to 22.
  final double iconSize;

  /// The background color of the navigation bar. It defaults to
  /// [Theme.bottomAppBarColor] if not provided.
  final Color? backgroundColor;

  /// Whether this navigation bar should show a elevation. Defaults to true.
  final bool showElevation;

  /// Use this to change the item's animation duration. Defaults to 270ms.
  final Duration animationDuration;

  /// Defines the appearance of the buttons that are displayed in the bottom
  /// navigation bar. This should have at least two items and five at most.
  final List<SquareBottomNavBarItemWidget> items;

  /// A callback that will be called when a item is pressed.
  final ValueChanged<int> onItemSelected;

  /// Defines the alignment of the items.
  /// Defaults to [MainAxisAlignment.spaceBetween].
  final MainAxisAlignment mainAxisAlignment;

  /// The [items] corner radius, if not set, it defaults to 50.
  final double itemCornerRadius;

  /// Defines the bottom navigation bar height. Defaults to 56.
  final double containerHeight;

  /// Used to configure the animation curve. Defaults to [Curves.linear].
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ??
        BottomAppBarTheme.of(context).color ??
        Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: containerPadding,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final SquareBottomNavBarItemWidget item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      curve: curve,
      width: MediaQuery.of(context).size.width / 4,
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: isSelected
            ? item.activeBackgroundColor
            : item.inactiveBackgroundColor,
        border: const Border(
          top: BorderSide(color: borderColor, width: 0.5),
          bottom: BorderSide(color: borderColor, width: 0.5),
          right: BorderSide(color: borderColor, width: 0.25),
          left: BorderSide(color: borderColor, width: 0.25),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width / 5,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: IconTheme(
            data: IconThemeData(
              size: iconSize,
              color: isSelected
                  ? item.activeColor.withOpacity(1)
                  : item.inactiveColor ?? item.activeColor,
            ),
            child: item.icon,
          ),
        ),
      ),
    );
  }
}

/// The [SquareBottomNavBarWidget.items] definition.
class SquareBottomNavBarItemWidget {
  SquareBottomNavBarItemWidget({
    required this.icon,
    this.activeColor = Colors.blueAccent,
    this.inactiveColor,
    this.activeBackgroundColor = Colors.black12,
    this.inactiveBackgroundColor,
  });

  /// item's icon .
  final Widget icon;

  /// Active color for [icon] and [title]
  /// Default: [Colors.blueAccent].
  final Color activeColor;

  /// Inactive color for [icon] and [title]
  /// Default: [activeColor].
  final Color? inactiveColor;

  final Color activeBackgroundColor;

  final Color? inactiveBackgroundColor;
}

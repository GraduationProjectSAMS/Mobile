import 'package:flutter/material.dart';

import '../../../../core/utilities/resources/app_colors.dart';
import '../../../../core/utilities/resources/app_styles.dart';
import '../../../profile/presentation/widgets/profile_bloc_builder.dart';
import '../../../profile/presentation/widgets/show_logout_dialog_content.dart';

class FurnitureDrawer extends StatefulWidget {
  const FurnitureDrawer({Key? key, this.onItemSelected}) : super(key: key);

  /// Callback when an item is selected
  final void Function(int index)? onItemSelected;

  @override
  State<FurnitureDrawer> createState() => _FurnitureDrawerState();
}

class _FurnitureDrawerState extends State<FurnitureDrawer> {
  int _selectedIndex = 0;

  static const List<_DrawerItemData> _drawerItems = [
    _DrawerItemData(Icons.home, 'Dashboard'),
    _DrawerItemData(Icons.chair, 'Products'),
    _DrawerItemData(Icons.local_offer, 'Offers'),
    _DrawerItemData(Icons.shopping_cart, 'Orders'),
  ];

  void _onItemTap(int index) {
    setState(() => _selectedIndex = index);
    widget.onItemSelected?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF264733),
        child: Column(
          children: [
            ProfileBlocBuilder(textColor: AppColors.white,),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _drawerItems.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (_, index) {
                final item = _drawerItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: _DrawerItemTile(
                    icon: item.icon,
                    label: item.label,
                    selected: index == _selectedIndex,
                    onTap: () => _onItemTap(index),
                  ),
                );
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _DrawerItemTile(
                icon: Icons.logout,
                label: 'Logout',
                iconColor: AppColors.red,
                labelStyle:
                    AppStyles.defaultStyle.copyWith(color: AppColors.red),
                onTap: () {
                  showLogoutDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A reusable tile widget for drawer items
class _DrawerItemTile extends StatelessWidget {
  const _DrawerItemTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
    this.iconColor = Colors.white,
    this.labelStyle,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final Color iconColor;
  final TextStyle? labelStyle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(

      color: selected ? Colors.white24 : Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          label,
          style: labelStyle ?? const TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        selected: selected,
        selectedTileColor: Colors.white24,
        onTap: onTap,
      ),
    );
  }
}

/// Simple data holder for drawer items
class _DrawerItemData {
  const _DrawerItemData(this.icon, this.label);

  final IconData icon;
  final String label;
}

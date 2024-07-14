import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/customization_provider.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';

class Customization extends StatelessWidget {
  const Customization({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    return Scaffold(
      body: BodyScrollView(
        title: locale.customization,
        childWidget: SliverToBoxAdapter(
          child: Consumer<CustomizationProvider>(
            builder: (_, value, __) => Column(
              children: [
                _buildCustomizationCard(
                  title: locale.navigation,
                  description: locale.navigationDesc,
                  value: value.customNavBar,
                  onChanged: value.setNavBarStyle,
                ),
                _buildCustomizationCard(
                  title: locale.gridCount,
                  description: locale.gridCountDesc,
                  value: value.crossAxisCount,
                  onChanged: value.setCrossAxisCount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomizationCard({
    required String title,
    required String description,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(kPaddingSize),
        child: ListTile(
          title: Text(title),
          subtitle: Text(description),
          trailing: Switch(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

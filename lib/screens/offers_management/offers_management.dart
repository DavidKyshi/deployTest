import 'package:kyshi_operations_dashboard/helper/screen_export.dart';

import 'offer_management_tab.dart';

class OffersManagementScreen extends StatelessWidget {
  const OffersManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [OfferManagementTab()],
        ),
      ),
    );
  }
}

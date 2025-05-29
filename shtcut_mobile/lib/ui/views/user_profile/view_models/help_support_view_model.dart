import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class HelpSupportViewModel extends MBaseViewModel {
  // Sample help and support data
  final List<Map<String, dynamic>> _helpItems = [
    {
      'leadingPath': 'assets/svgs/help_calling.svg',
      'title': 'Call Us',
      'subtitle': 'Contact call center',
      'onTap': () => print('FAQ tapped'),
    },
    {
      'leadingPath': 'assets/svgs/help_message.svg',
      'title': 'Chat With Us',
      'subtitle': 'Send an in-app chat',
      'onTap': () => print('Contact Support tapped'),
    },
    {
      'leadingPath': 'assets/svgs/help_faq.svg',
      'title': 'FAQs',
      'subtitle': 'Frequently asked questions',
      'onTap': () => print('User Guide tapped'),
    },
  ];

  // Getter for help items
  List<Map<String, dynamic>> get helpItems => _helpItems;

  // Navigation methods
  void navigateToFAQ() {
    // TODO: Navigate to FAQ page
    print('Navigating to FAQ');
  }

  void navigateToContactSupport() {
    navRouter.navigateToContactUsView();
  }

  void navigateToChatSupport() {
    // TODO: Navigate to user guide page
    print('Navigating to User Guide');
  }

  // Handle help item tap
  void onHelpItemTap(int index) {
    switch (index) {
      case 0:
        navigateToContactSupport();
        break;
      case 1:
        navigateToChatSupport();
        break;
      case 2:
        navigateToFAQ();
        break;
      default:
        break;
    }
  }
}

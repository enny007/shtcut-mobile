import 'package:shtcut_mobile/app/app.router.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/core/base/base_view_model.dart';

class SocialListeningViewModel extends MBaseViewModel {
  final content = <Map<String, dynamic>>[
    {
      'eventTitle': 'Christmas Celebration',
      'subtitle': 'Holiday Campaign Review',
      'eventTag': 'Event Monitoring',
      'onTap': () {
        navRouter.navigateToSocialListeningDetailView(
            topicName: 'Christmas Celebration');
      },
    },
    {
      'eventTitle': 'Men Media',
      'subtitle': 'Brand Awareness',
      'eventTag': 'Brand Health',
      'onTap': () {
        navRouter.navigateToSocialListeningDetailView(topicName: 'Men Media');
      },
    },
    {
      'eventTitle': 'Sign Health',
      'subtitle': 'Brand Awareness',
      'eventTag': 'Event Monitoring',
      'onTap': () {
        navRouter.navigateToSocialListeningDetailView(topicName: 'Sign Health');
      },
    },
    {
      'eventTitle': 'Sign Health',
      'subtitle': 'Brand Awareness',
      'eventTag': 'Event Monitoring',
      'onTap': () {
        navRouter.navigateToSocialListeningDetailView(
          topicName: 'Sign Health',
        );
      },
    },
  ];
  void navigateToCreateTopic() {
    navRouter.navigateToCreateTopicView();
  }
}

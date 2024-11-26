import 'package:campus_saga/core/notifications/notification_service.dart';
import 'package:flutter/material.dart';

void showNotificationsSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Replace with your actual notifications list
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10, // Replace with actual notifications count
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          final notificationService =
                              NotificationService.instance;
                          // notificationService.showNotificationNow(
                          //   id: 0,
                          //   title: "Trying to Schedule a Notification",
                          //   body: "A notification is scheduled for 5 seconds",
                          // );
                          // notificationService.showNotificationScheduled(
                          //   id: 1,
                          //   title: "Scheduled Notification",
                          //   body:
                          //       "This notification is scheduled for 5 seconds",
                          //   scheduledDate: DateTime.now().add(
                          //     Duration(seconds: 5),
                          //   ),
                          // );
                          // await notificationService
                          //     .showNotificationWithImageURLAndSound(
                          //   id: 1,
                          //   title: "Exciting News!",
                          //   body: "Check out this amazing picture!",
                          //   imageUrl:
                          //       'https://static.vecteezy.com/system/resources/previews/008/352/318/large_2x/smartphone-notification-concept-banner-isometric-style-vector.jpg', // Ensure the image is locally available
                          //   payload: 'Check out this amazing picture!',
                          //   soundAsset: 'bell_notificaion',
                          // );
                          await notificationService
                              .showNotificationWithImageAssetAndSoundFromAssets(
                            id: 1,
                            title: "Exciting News!",
                            body: "Check out this amazing picture!",
                            imageAsset: "assets/temp/jenny.jpg",
                            payload: 'Check out this amazing picture!',
                            soundAsset: 'assets/sounds/bell_notificaion.wav',
                          );
                          await notificationService
                              .showNotificationWithImageFromAssets(
                            id: 1,
                            title: "Exciting News!",
                            body: "Check out this amazing picture!",
                            imageAsset: "assets/temp/jenny.jpg",
                            payload: 'Check out this amazing picture!',
                          );
                        },
                        child: ListTile(
                          leading: Icon(Icons.notification_important),
                          title: Text('Notification Title $index'),
                          subtitle: Text('Notification Body $index'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_post_controller.dart';

class AddPostPage extends StatelessWidget {
  final AddPostController controller = Get.put(AddPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: controller.postType.value,
              items: [
                DropdownMenuItem(value: 'Problem', child: Text('Problem')),
                DropdownMenuItem(value: 'Promotion', child: Text('Promotion')),
              ],
              onChanged: (value) => controller.setPostType(value!),
              decoration: InputDecoration(labelText: 'Post Type'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Post Title'),
              onChanged: (value) => controller.setPostTitle(value),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 5,
              onChanged: (value) => controller.setPostDescription(value),
            ),
            // Add more form fields as needed for attachments, etc.

            ElevatedButton(
              onPressed: () => controller.submitPost(),
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}

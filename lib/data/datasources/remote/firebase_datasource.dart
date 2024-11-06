// lib/data/datasources/remote/firebase_datasource.dart

import 'dart:io';
import 'dart:math';
import 'package:campus_saga/data/models/university_model.dart';
import 'package:path/path.dart' as p;
import 'package:campus_saga/core/usecases/usecase.dart';
import 'package:campus_saga/data/models/comment_model.dart';
import 'package:campus_saga/data/models/feedback_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../models/user_model.dart';
import '../../models/post_model.dart';

class FirebaseDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final FirebaseStorage firebaseStorage;

  FirebaseDataSource(
      {required this.firebaseAuth,
      required this.firestore,
      required this.firebaseStorage});

  Future<UserModel?> getUserProfile(String userId) async {
    final userDoc = await firestore.collection('users').doc(userId).get();
    if (userDoc.exists) {
      return UserModel.fromJson(userDoc.data()!);
    }
    return null;
  }

  Future<void> createUser(UserModel user) async {
    await firestore.collection('users').doc(user.id).set(user.toJson());
  }

  Future<void> createPost(PostModel post) async {
    //create doc baseed on the post id
    await firestore.collection('posts').doc(post.id).set(post.toJson());
  }

  Future<void> createFeedback(
      String postId, String authorityId, String message) async {
    final feedback = AuthorityFeedbackModel(
      id: postId,
      authorityId: authorityId,
      postId: postId,
      message: message,
      timestamp: DateTime.now(),
    );

    await firestore.collection('posts').doc(postId).update({
      'feedback': feedback.toJson(),
    });
  }

  Future<void> createComment(String postId, String userId, String text) async {
    final comment = CommentModel(
      id: postId,
      userId: userId,
      postId: postId,
      text: text,
      timestamp: DateTime.now(),
    );

    await firestore.collection('posts').doc(postId).update({
      'comments': FieldValue.arrayUnion([comment.toJson()]),
    });
  }

  Future<List<PostModel>> fetchPosts(String universityId) async {
    final querySnapshot = await firestore
        .collection('posts')
        .where('universityId', isEqualTo: universityId)
        .orderBy('timestamp', descending: true)
        .get();

    return querySnapshot.docs
        .map((doc) => PostModel.fromJson(doc.data()))
        .toList();
  }

  Future<List<PostModel>> getTimelinePosts(String universityId) async {
    List<PostModel> timelinePosts = [];
    // 1. Get the latest 2 posts by timestamp
    final latestPostsSnapshot = await firestore
        .collection('posts')
        .where('universityId', isEqualTo: universityId)
        .orderBy('timestamp', descending: true)
        .limit(2)
        .get();

    final latestPosts = latestPostsSnapshot.docs
        .map((doc) => PostModel.fromJson(doc.data()))
        .toList();
    timelinePosts.addAll(latestPosts);

    // 2. Get the top 4 posts by trueVotes
    final topVotedPostsSnapshot = await firestore
        .collection('posts')
        .where('universityId', isEqualTo: universityId)
        .orderBy('trueVotes', descending: true)
        .limit(4)
        .get();
    final topVotedPosts = topVotedPostsSnapshot.docs
        .map((doc) => PostModel.fromJson(doc.data()))
        .toList();
    timelinePosts.addAll(topVotedPosts);

    // 3. Get a random post
    final randomPostSnapshot = await firestore
        .collection('posts')
        .where('universityId', isEqualTo: universityId)
        .get();
    if (randomPostSnapshot.size > 0) {
      final randomIndex = Random().nextInt(randomPostSnapshot.size);
      final randomPost =
          PostModel.fromJson(randomPostSnapshot.docs[randomIndex].data());
      timelinePosts.add(randomPost);
    }

    // 4. Get the remaining posts sorted by timestamp (newer to older)
    final remainingPostsSnapshot = await firestore
        .collection('posts')
        .where('universityId', isEqualTo: universityId)
        .orderBy('timestamp', descending: true)
        .startAfterDocument(latestPostsSnapshot.docs.isNotEmpty
            ? latestPostsSnapshot.docs.last
            : topVotedPostsSnapshot.docs.last)
        .get();

    final remainingPosts = remainingPostsSnapshot.docs
        .map((doc) => PostModel.fromJson(doc.data()))
        .toList();
    timelinePosts.addAll(remainingPosts);

    return timelinePosts;
  }

  //Add commnet to a specific post
  Future<void> addComment(String postId, CommentModel comment) async {
    await firestore.collection('posts').doc(postId).update({
      'comments': FieldValue.arrayUnion([comment.toJson()]),
    });
  }
  
  //add feedback to a specific post
  Future<void> addFeedback(String postId, AuthorityFeedbackModel feedback) async {
    await firestore.collection('posts').doc(postId).update({
      'feedback': feedback.toJson(),
    });
  }

  //Add a vote to a specific post
  Future<void> addVote(String postId, String userId, bool isTrueVote) async {
    await firestore.collection('posts').doc(postId).update({
      'votes': FieldValue.arrayUnion([userId]),
    });

    if (isTrueVote) {
      await firestore.collection('posts').doc(postId).update({
        'trueVotes': FieldValue.increment(1),
      });
    } else {
      await firestore.collection('posts').doc(postId).update({
        'falseVotes': FieldValue.increment(1),
      });
    }
  }

  Future<void> updatePostStatus(String postId, bool isResolved) async {
    await firestore.collection('posts').doc(postId).update({
      'isResolved': isResolved,
    });
  }

  Future<String> uploadUserImage(File image, String userId) async {
    try {
      final ref =
          firebaseStorage.ref().child('user_images').child('$userId.jpg');
      await ref.putFile(image);
      return await ref.getDownloadURL();
    } catch (e) {
      throw Exception('Image upload failed');
    }
  }

  Future<List<String>> uploadPostImages(
      String postId, List<File> images) async {
    print("uploadPostImages: $images");
    final urls = <String>[];
    for (final image in images) {
      final ref = firebaseStorage
          .ref()
          .child('post_images')
          .child('$postId-${p.basename(image.path)}.jpg');
      await ref.putFile(image);
      urls.add(await ref.getDownloadURL());
    }
    return urls;
  }

  Future<String> signUpUser(UserParams user) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    return userCredential.user!.uid;
  }

  Future<String> signInUser(UserParams user) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    return userCredential.user!.uid;
  }

  //logOut
  Future<void> signOutUser() async {
    await firebaseAuth.signOut();
  }


  //Add university
  Future<void> addUniversity(UniversityModel university) async {
    try {
      await firestore.collection('universities').doc(university.id).set(university.toJson());
    } catch (e) {
      throw Exception('University creation failed');
    }
  }
  
}

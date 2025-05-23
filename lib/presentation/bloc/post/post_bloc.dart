// lib/presentation/bloc/post/post_bloc.dart
import 'package:campus_saga/data/models/post_model.dart';
import 'package:campus_saga/domain/entities/post.dart';
import 'package:campus_saga/domain/usecases/issue/upload_post_images.dart';
import 'package:campus_saga/presentation/bloc/issue/issue_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';
import '../../../domain/usecases/issue/create_post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final CreatePost createPost;
  final UploadPostImages uploadPostImages;
  final IssueBloc issueBloc;
  PostBloc({
    required this.createPost,
    required this.uploadPostImages,
    required this.issueBloc,
  }) : super(PostingInitial()) {
    on<PostCreated>((event, emit) async {
      // List<Post> posts = [];
      // if (state is PostsLoaded) {
      //   posts = (state as PostsLoaded).posts;
      // }
      try {
        emit(PostingLoading());
        List<String> imageUrls = [];
        if (event.images != null) {
          final imageResult =
              await uploadPostImages("${event.post.id}", event.images!);
          await imageResult.fold(
            (failure) async => emit(PostingFailure(failure.message)),
            (images) async {
              imageUrls = images;
            },
          );
        }

        Post post = PostModel.fromEntity(event.post)
            .copyWith(imageUrls: imageUrls)
            .toEntity();

        final result = await createPost(post);
        await result.fold(
          (failure) async => emit(PostingFailure(failure.message)),
          (createdPost) async {
            emit(PostingSuccess(createdPost));
            // posts.elementAt(0);
            // posts = posts.toSet().toList();
            // emit(PostsLoaded(posts));
            // Trigger FetchIssueEvent after successful post creation
            issueBloc.add(FetchIssueEvent(createdPost.universityId));
          },
        );
      } catch (e) {
        emit(PostingFailure(e.toString()));
      }
    });
  }
}

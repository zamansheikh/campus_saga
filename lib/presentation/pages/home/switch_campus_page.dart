import 'package:campus_saga/core/injection_container.dart';
import 'package:campus_saga/presentation/bloc/auth/auth_bloc.dart';
import 'package:campus_saga/presentation/bloc/auth/auth_state.dart';
import 'package:campus_saga/presentation/bloc/issue/issue_bloc.dart';
import 'package:campus_saga/presentation/pages/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchCampusPage extends StatefulWidget {
  final String universityId;
  const SwitchCampusPage({required this.universityId, super.key});

  @override
  State<SwitchCampusPage> createState() => _SwitchCampusPageState();
}

class _SwitchCampusPageState extends State<SwitchCampusPage> {
  var userState = null;
  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  void _fetchPosts() {
    final state = sl<AuthBloc>().state;
    if (state is AuthAuthenticated) {
      setState(() {
        userState = state.user;
      });
      final String universityId = widget.universityId;
      print("Fetching posts for university: $universityId");
      sl<IssueBloc>().add(FetchIssueEvent(universityId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "You are visiting @${widget.universityId} Campus",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: sl<AuthBloc>(),
        listener: (context, state) {
          if (state is AuthUnauthenticated) {
            Navigator.of(context).pushReplacementNamed('/login');
          }
        },
        builder: (context, authState) {
          if (authState is! AuthAuthenticated) {
            return const Center(child: CircularProgressIndicator());
          }

          return BlocBuilder<IssueBloc, IssueState>(
            bloc: sl<IssueBloc>(),
            builder: (context, issueState) {
              print("Post state: ${issueState.runtimeType}");
              if (issueState is IssueLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (issueState is IssueFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      Text(issueState.message),
                      ElevatedButton(
                        onPressed: _fetchPosts,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              if (issueState is IssueLoaded && issueState.posts.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.post_add,
                        size: 64,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "No posts yet",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Be the first to create a post!",
                      ),
                    ],
                  ),
                );
              }

              if (issueState is IssueLoaded) {
                return RefreshIndicator(
                  onRefresh: () async => _fetchPosts(),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: issueState.posts.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            Text(
                              "Latest Issues",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PostCard(
                                post: issueState.posts[index],
                                user: authState.user,
                              ),
                            ),
                          ],
                        );
                      }
                      if (index == 2) {
                        return Column(
                          children: [
                            Text(
                              "Trending Issues",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PostCard(
                                post: issueState.posts[index],
                                user: authState.user,
                              ),
                            ),
                          ],
                        );
                      }
                      if (index == 7) {
                        return Column(
                          children: [
                            Text(
                              "Other Issues",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PostCard(
                                post: issueState.posts[index],
                                user: authState.user,
                              ),
                            ),
                          ],
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PostCard(
                          post: issueState.posts[index],
                          user: authState.user,
                        ),
                      );
                    },
                  ),
                );
              }

              return const Center(child: Text("Something went wrong"));
            },
          );
        },
      ),
    );
  }
}

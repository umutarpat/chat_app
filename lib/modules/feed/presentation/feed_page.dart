import 'dart:io';

import 'package:chat_app/global/common/bottom_nav_bar.dart';
import 'package:chat_app/global/core/routes.dart';
import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/feed/application/feed_bloc.dart';
import 'package:chat_app/modules/feed/application/feed_bloc_event.dart';
import 'package:chat_app/modules/feed/application/feed_bloc_state.dart';
import 'package:chat_app/modules/feed/domain/entities/get_posts_result.dart';
import 'package:chat_app/modules/feed/presentation/widgets/new_post_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FeedBloc>(context).add(GetCurrentLoggedInUserEvent());
    BlocProvider.of<FeedBloc>(context).add(GetFeedEvent());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.feed,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed('/${AppRoute.settings.name}');
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocBuilder<FeedBloc, FeedBlocState>(
        builder: (context, state) {
          if (state.getPostsResult is GetPostsSuccess) {
            final posts = state.posts ?? [];

            if (posts.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.noPostsYet,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<FeedBloc>().add(GetFeedEvent());
              },
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 64,
                ),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            title: Text(
                              "${post.firstName} ${post.lastName}",
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                            ),
                            subtitle: Text(
                              post.createdAt != null
                                  ? DateFormat(
                                      'dd/MM/yyyy',
                                    ).format(post.createdAt!)
                                  : '',
                              style: Theme.of(context).textTheme.titleSmall!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          Text(
                            post.title ?? '',
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),

                          Text(
                            post.description ?? '',
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),

                          if (post.imagePath != null &&
                              post.imagePath!.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                File(post.imagePath!),
                                width: double.infinity,
                                height: 250,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  logIt().e(error.toString());

                                  return Container(
                                    width: double.infinity,
                                    height: 250,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surfaceContainerHighest,
                                    child: Icon(
                                      Icons.broken_image,
                                      size: 48,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final feedBloc = context.read<FeedBloc>();

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (bottomSheetContext) {
              return BlocProvider.value(
                value: feedBloc,
                child: const FeedPageNewPostSheet(),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_stories/flutter_stories.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wrapper/components/story_1.dart';
import 'package:wrapper/components/story_2.dart';
import 'package:wrapper/components/story_3.dart';
import 'package:wrapper/components/story_4.dart';
import 'package:wrapper/components/story_5.dart';
import 'package:wrapper/components/story_6.dart';
import 'package:wrapper/generated/assets.gen.dart';
import 'package:wrapper/services/user_summary_service.dart';
import 'package:wrapper/view_models/stories_viewer_view_model.dart';

class StoriesViewerPage extends StatelessWidget {
  const StoriesViewerPage({
    super.key,
    required this.id,
  });

  final String id;

  static Map<StoryType, WidgetBuilder> stories = {
    StoryType.story1: (_) => const Story1(),
    StoryType.story2: (_) => const Story2(),
    StoryType.story3: (_) => const Story3(),
    StoryType.story4: (_) => const Story4(),
    StoryType.story5: (_) => const Story5(),
    StoryType.story6: (_) => const Story6(),
  };

  static const Map<StoryType, Duration> storyDuration = {
    StoryType.story1: Duration(seconds: 10),
    StoryType.story2: Duration(seconds: 6),
    StoryType.story3: Duration(seconds: 5),
    StoryType.story4: Duration(seconds: 6),
    StoryType.story5: Duration(seconds: 6),
    StoryType.story6: Duration(seconds: 7),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) {
          return StoriesViewerViewModel(
            id: id,
            userSummaryService: UserSummaryService(),
          )..fetch();
        },
        builder: (context, _) {
          return Consumer<StoriesViewerViewModel>(
            builder: (context, model, child) {
              final state = model.state;
              if (state is StoriesInitial) {
                return const SizedBox();
              } else if (state is StoriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is StoriesLoaded) {
                return Provider.value(
                  value: state.userSummary,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Story(
                      momentCount: state.availableStories.length,
                      momentBuilder: (BuildContext context, int index) {
                        final storyType = state.availableStories[index];
                        final widget = stories[storyType]!(context);
                        return Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).padding.top + 24,
                            ),
                            Expanded(
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 430),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  child: widget,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      momentDurationGetter: (int? index) {
                        if (index != null) {
                          final storyType = state.availableStories[index];
                          return storyDuration[storyType]!;
                        } else {
                          return const Duration(seconds: 5);
                        }
                      },
                      progressSegmentGap: 6,
                      progressSegmentBuilder: (context, index, progress, gap) =>
                          Container(
                        clipBehavior: Clip.antiAlias,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(horizontal: gap / 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAE1E1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: progress,
                          child: Container(
                            color: const Color(0xffDD2C2C),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: LottieBuilder.asset(
                    Assets.lottie.error,
                    repeat: false,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

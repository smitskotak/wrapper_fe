import 'package:flutter/foundation.dart';
import 'package:wrapper/models/user_summary.dart';
import 'package:wrapper/services/user_summary_service.dart';

class StoriesViewerViewModel extends ChangeNotifier {
  StoriesViewerViewModel({
    required this.id,
    required this.userSummaryService,
  }) : state = StoriesInitial();

  final String id;
  final UserSummaryService userSummaryService;

  StoriesModelState state;

  Future<void> fetch() async {
    state = StoriesLoading();
    notifyListeners();

    try {
      final summary = await userSummaryService.getUserSummary(id);
      final availableStories = [
        StoryType.story1,
        StoryType.story2,
        StoryType.story3,
        StoryType.story4,
        StoryType.story5,
        StoryType.story6,
      ];
      state = StoriesLoaded(
        userSummary: summary,
        availableStories: availableStories,
      );
    } catch (_) {
      state = StoriesError();
    }

    notifyListeners();
  }
}

enum StoryType {
  story1,
  story2,
  story3,
  story4,
  story5,
  story6,
}

abstract class StoriesModelState {}

class StoriesInitial extends StoriesModelState {}

class StoriesLoading extends StoriesModelState {}

class StoriesLoaded extends StoriesModelState {
  final UserSummary userSummary;
  final List<StoryType> availableStories;

  StoriesLoaded({
    required this.userSummary,
    required this.availableStories,
  });
}

class StoriesError extends StoriesModelState {}

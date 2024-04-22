import 'package:bridgme/models/stories/story_model.dart';

class UserStory {
  final String  user;
  final String owner;
  final List<StoryModel> stories;

  UserStory({
    required this.user,
    required this.stories,
    required this.owner,
  });
}
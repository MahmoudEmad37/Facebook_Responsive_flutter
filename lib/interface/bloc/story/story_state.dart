part of 'story_cubit.dart';

abstract class StoryState {
  const StoryState();
}

class StoryInitial extends StoryState {}

class StoryLoadding extends StoryState {}

class StoryLoaded extends StoryState {
  final List<Story> stories;

  StoryLoaded(this.stories);
}

class StoryFailure extends StoryState {}

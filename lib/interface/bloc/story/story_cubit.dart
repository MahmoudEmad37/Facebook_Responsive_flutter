import 'package:facebook_flutter/services/classes/classes.dart';
import 'package:facebook_flutter/services/repositories/get_all_stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState>{
final GetAllStories getAllStory;

StoryCubit({@required this.getAllStory}):super(StoryInitial());

Future<void> getAllStories()async{
emit(StoryLoadding());
try{
  final storyData = await getAllStory.call();
  emit(StoryLoaded(storyData));
}catch(_){
  emit(StoryFailure());
}
}
}
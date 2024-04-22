
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

import '../user/user_model_entity.dart';

part 'story_model.g.dart';
enum MediaType{
	image,
	video
}

@JsonSerializable()
class StoryModel {
	final String url;
	final MediaType media;
	final Duration duration;
	final String  user;
	final String owner;
	final int expiry;

	StoryModel({
		required this.url,
		required this.media,
		required this.duration,
		required this.user,
		required this.expiry,
		required this.owner,
	});
}

@Collection<StoryModel>('story_model')
final storyModelRef = StoryModelCollectionReference();







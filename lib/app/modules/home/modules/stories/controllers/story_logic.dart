import 'package:get/get.dart';

import '../../../../../../models/stories/story_model.dart';



class StoryLogic extends GetxController {


  List<StoryModel> stories = [
    StoryModel(
      url:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo9uKHVGjTolD5xVn0zezwOxjrnaspeV6eUzZtHU3cwtnhuZb_Pig57_21tiKzKiCT3NE&usqp=CAU',
      media: MediaType.image,
        duration: const Duration(seconds: 3),
        expiry: DateTime.now().millisecondsSinceEpoch,
        user: "Dr. Justin",
        owner: "philmaxsnr@gmail.com"
    ),
    StoryModel(
      url:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShlLKGn1mrQ3ohMnPRkID4lC0UtT5Gb2Ggbg&usqp=CAU',
      media: MediaType.image,
      duration: const Duration(seconds: 3), expiry: DateTime.now().millisecondsSinceEpoch,
      user: "Dr. Justin",
      owner: "philmaxsnr@gmail.com"
    ),
  ];

}

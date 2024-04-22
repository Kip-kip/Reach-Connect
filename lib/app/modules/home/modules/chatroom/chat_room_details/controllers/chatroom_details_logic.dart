import 'package:get/get.dart';

import '../../../../../../../models/chatroom/chat_room_model.dart';

class ChatroomDetailsLogic extends GetxController {
  var selectedID = "";
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    loadSelectedChatRoom(selectedID);
  }

  var selectedChatroom = ChatRoomModel(
    title:"",
    text: "",
    category: "",
    createdAt : "",
    ownerId: "",
    postId:"",
    mood: "",
    image: "",)
      .obs;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }



  loadSelectedChatRoom(selectedID){
    selectedChatroom.value = ChatRoomModel(
      title:"A rather short story",
      text: ""'When I was about 16, my mother came with me to therapy once.'
          ' She complained and expressed that I was being so wimpy and submissive towards my friends and new boyfriend. She couldnt understand how I could have become so subdued, when she was such a  who could stand up for herself and never let herself be bullied around by dad, for example.'"",
      category: "Addiction",
      createdAt : "test created at",
      ownerId: "John Doe",
      postId:"test",
      mood: "Mood",
      image: '',

    );
  }

}

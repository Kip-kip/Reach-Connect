import 'package:bridgme/models/chatroom/chat_room_model.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:get/get.dart';

class ChatroomLogic extends GetxController {
  @Collection<ChatRoomModel>('chatroom')
  final chatroomRef = ChatRoomModelCollectionReference();
  var chatRoomList = <ChatRoomModel>[].obs;
  var selectedCategories = [].obs;


  @override
  void onReady() {
    super.onReady();
    getChatroomData();
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateSelectedCategories(category){
    if (!checkIfCategoryIsAlreadySelected(category)) {
      selectedCategories.add(category);
    } else {
      selectedCategories.removeWhere((item) => item == category);
    }
  }

  checkIfCategoryIsAlreadySelected(category) {
    return (selectedCategories.contains(category));
  }

  getChatroomData(){
    loadDummyChats();
    // chatRoomList.bindStream(chatroomRef
    //     .orderByCreatedAt(descending: true)
    //     .snapshots()
    //     .map((event) => event.docs.map((e) => e.data).toList()));
  }


  getChatroomDataForCategories(selectedCategories){
    chatRoomList.value = [
      ChatRoomModel(
        title:"A Short story",
        text: ""'When I was about 16, my mother came with me to therapy once.'
            ' She complained and expressed that I was being so wimpy and submissive towards my friends and new boyfriend. She couldnt understand how I could have become so subdued, when she was such a  who could stand up for herself and never let herself be bullied around by dad, for example.'"",
        category: "Addiction",
        createdAt : "test created at",
        ownerId: "Jane Doe",
        postId:"test",
        mood: "Mood",
        image: '',

      ),
    ];
  }


  loadDummyChats(){
    chatRoomList.value = [
      ChatRoomModel(
        title:"A Short story",
        text: ""'When I was about 16, my mother came with me to therapy once.'
            ' She complained and expressed that I was being so wimpy and submissive towards my friends and new boyfriend. She couldnt understand how I could have become so subdued, when she was such a  who could stand up for herself and never let herself be bullied around by dad, for example.'"",
        category: "Addiction",
        createdAt : "test created at",
        ownerId: "Jane Doe",
        postId:"test",
        mood: "Mood",
        image: '',

    ),
      ChatRoomModel(
        title:"A Short story",
        text: ""'When I was about 16, my mother came with me to therapy once.'
            ' She complained and expressed that I was being so wimpy and submissive towards my friends and new boyfriend. She couldnt understand how I could have become so subdued, when she was such a  who could stand up for herself and never let herself be bullied around by dad, for example.'"",
        category: "Addiction",
        createdAt : "test created at",
        ownerId: "Jane Doe",
        postId:"test",
        mood: "Mood",
        image: '',

      ),
    ];
  }

}

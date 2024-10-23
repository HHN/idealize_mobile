import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
import 'package:idealize_new_version/Core/Constants/routes.dart';
import 'package:idealize_new_version/Features/Base/base_model.dart';
import 'package:idealize_new_version/Features/Base/domain/entity/chat_entity.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class BaseViewModel extends GetxController {
  late BaseModel _model;

  IO.Socket? socket;
  bool isConnect = false;

  RxBool aiIsResponding = false.obs;
  RxList<ChatEntity> chats = RxList<ChatEntity>([
    ChatEntity(text: 'Hi! how can I help you?', isMe: false),
  ]);

  final messageCtrl = TextEditingController();
  final scrollCtrl = ScrollController();

  BaseViewModel() {
    _model = BaseModel();
  }

  BaseModel get model => _model;

  void updateNavigationIndex(int index) {
    _model.updateNavigationIndex(index);
    update();
  }

  void openChatScreen() {
    Get.toNamed(AppRoutes().chatScreen);
  }

  void onTappedMoreButton() {}

  void onTappedSendMessage() {
    if (messageCtrl.text.isNotEmpty) {
      chats.add(ChatEntity(text: messageCtrl.text, isMe: true));
      messageCtrl.clear();

      socket?.emit("sendMessage", {
        "message": messageCtrl.text,
      });

      aiIsResponding.value = true;

      scrollCtrl.animateTo(scrollCtrl.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  Future<void> connectSocket() async {
    try {
      socket?.disconnect();
      socket = null;
      socket = IO.io(
          AppConfig().chatBotServer,
          OptionBuilder()
              .setTransports(["websocket"])
              .disableAutoConnect()
              .enableForceNew()
              .build());

      socket?.on("unauthorized", (data) {
        isConnect = false;
      });

      socket?.on("error", (data) {
        print('error: $data');
        chats.add(ChatEntity(text: data, isMe: false));
        aiIsResponding.value = false;
      });

      socket?.on("receiveMessage", (data) {
        print('receiveMessage: $data["message"]');
        chats.add(ChatEntity(text: data['message'], isMe: false));
        aiIsResponding.value = false;

        scrollCtrl.animateTo(scrollCtrl.position.maxScrollExtent + 100,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      });

      socket?.onConnect((data) {
        debugPrint("connect");
        isConnect = true;
      });
      socket?.onDisconnect((data) {
        debugPrint("disconnect");
        isConnect = false;
      });

      socket?.connect();
    } catch (x) {
      debugPrint('$x');
    }
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   // print('\n\n-------------');
  //   // debugPrint('token: ${AppRepo().jwtToken}');
  //   // debugPrint('refreshToken: ${AppRepo().jwtRefreshToken}');
  //   // print('-------------\n\n');
  // }
}
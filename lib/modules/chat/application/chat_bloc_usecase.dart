import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_chats_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/chat/domain/entities/get_messages_result.dart';
import 'package:chat_app/modules/chat/domain/entities/join_meeting_result.dart';
import 'package:chat_app/modules/chat/domain/entities/send_message_result.dart';
import 'package:chat_app/modules/chat/domain/repositories/chat_repository_interface.dart';
import 'package:injectable/injectable.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:permission_handler/permission_handler.dart';

@injectable
class ChatBlocGetCurrentLoggedUserUseCase {
  final ChatRepositoryInterface repository;

  ChatBlocGetCurrentLoggedUserUseCase(this.repository);

  Future<GetCurrentLoggedInUserResult> call() async {
    return await repository.getCurrentLoggedUser();
  }
}

@injectable
class ChatBlocFetchUserListUseCase {
  final ChatRepositoryInterface repository;

  ChatBlocFetchUserListUseCase(this.repository);

  Future<FetchUserResult> call() async {
    return await repository.fetchUserList();
  }
}

@injectable
class ChatBlocSendMessageUseCase {
  final ChatRepositoryInterface repository;

  ChatBlocSendMessageUseCase(this.repository);

  Future<SendMessageResult> call(String message, int receiverId) async {
    return await repository.sendMessage(message, receiverId);
  }
}

@injectable
class ChatBlocGetMessagesUseCase {
  final ChatRepositoryInterface repository;

  ChatBlocGetMessagesUseCase(this.repository);

  Future<GetMessagesResult> call(int receiverId) async {
    return await repository.getMessages(receiverId);
  }
}

@injectable
class ChatBlocGetChatsUseCase {
  final ChatRepositoryInterface repository;

  ChatBlocGetChatsUseCase(this.repository);

  Future<GetChatsResult> call(int userId) async {
    return await repository.getChats(userId);
  }
}

@injectable
class ChatBlocJoinMeetingUseCase {
  ChatBlocJoinMeetingUseCase();

  Future<JoinMeetingResult> call({
    required String displayName,
    required String email,

    /// audio -> mic
    bool isAudioMuted = false,
    bool isVideoMuted = false,
  }) async {
    try {
      final statusCamera = await Permission.camera.request();
      final statusMic = await Permission.microphone.request();

      if (statusCamera.isGranted && statusMic.isGranted) {
        var jitsiMeet = JitsiMeet();

        var options = JitsiMeetConferenceOptions(
          serverURL: "https://meet.ffmuc.net/",
          room: 'innoscriptatest2025-1',
          configOverrides: {
            "startWithAudioMuted": isAudioMuted,
            "startWithVideoMuted": isVideoMuted,
            "subject": "Jitsi Meeting",
          },
          featureFlags: {
            "prejoinpage.enabled": false,
            "lobby-mode.enabled": false,
            "calendar.enabled": true,
          },
          userInfo: JitsiMeetUserInfo(displayName: displayName, email: email),
        );

        var listener = JitsiMeetEventListener(
          conferenceJoined: (url) {
            logIt().d("conferenceJoined: url: $url");
          },

          readyToClose: () {
            logIt().d("readyToClose");
          },
        );

        jitsiMeet.join(options, listener);

        return JoinMeetingSuccess();
      } else {
        return JoinMeetingPermissionError();
      }
    } catch (e) {
      return JoinMeetingError();
    }
  }
}

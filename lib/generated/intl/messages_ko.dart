// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("두부랩"),
        "checkYourEmail":
            MessageLookupByLibrary.simpleMessage("로그인 링크를 당신의 이메일에서 확인해보세요!"),
        "email": MessageLookupByLibrary.simpleMessage("이메일"),
        "emailSignIn": MessageLookupByLibrary.simpleMessage(
            "아래 이메일로 Magic Link를 통해 로그인 하세요."),
        "error": MessageLookupByLibrary.simpleMessage("에러"),
        "loading": MessageLookupByLibrary.simpleMessage("로딩중..."),
        "profile": MessageLookupByLibrary.simpleMessage("프로필"),
        "profileUpdateSuccessful":
            MessageLookupByLibrary.simpleMessage("프로필이 업데이트 성공!"),
        "saving": MessageLookupByLibrary.simpleMessage("저장중..."),
        "sendMagicLink": MessageLookupByLibrary.simpleMessage("Magic Link 보내기"),
        "signIn": MessageLookupByLibrary.simpleMessage("로그인"),
        "signOut": MessageLookupByLibrary.simpleMessage("로그아웃"),
        "success": MessageLookupByLibrary.simpleMessage("성공"),
        "update": MessageLookupByLibrary.simpleMessage("업데이트"),
        "updatedProfileImage":
            MessageLookupByLibrary.simpleMessage("프로필 이미지가 업데이트 되었습니다!"),
        "userName": MessageLookupByLibrary.simpleMessage("유저 이름"),
        "website": MessageLookupByLibrary.simpleMessage("웹사이트")
      };
}

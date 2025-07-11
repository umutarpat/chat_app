import 'package:flutter/services.dart';

var dontAllowSpaceInputFormatter = FilteringTextInputFormatter.deny(
  RegExp(r'\s'),
);

var dontAllowEmojiInputFormatter = FilteringTextInputFormatter.deny(
  RegExp(
    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
  ),
);

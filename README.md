# chat_app

This repository contains a chat app which uses Clean Architecture + BLoC patterns.

External packages used in the project: go_router, injectable, get_it, freezed, drift (SQLite ORM), form_builder, jitsi_meet_flutter_sdk


## To login to app use following credentials:

Username: case_study@innoscripta.com
Password: CaseStudyInnoscripta2025!


## Recommended option to run the app

Run the app on release mode, especially for Jitsi.

## Below there are 2 videos which from IOS and Android recorded from real devices:

https://github.com/user-attachments/assets/4e2970f9-22f9-48ba-8f87-5d43c57553c6




https://github.com/user-attachments/assets/4acfdfd5-9009-4209-9464-915df5adc5fb

## Known issues

### Feed Post Image loading on debug mode

Due to debug modes behavior of storing images in device directory being different, when you add a post with image to feed and close & open app again the app cannot find the image.

This is expected behavior for debug mode, on release it works fine and user can see posted image again when they close & reopen app.

### Jitsi not working on some emulators.

Jitsi, the video conferencing package could be not working on some emulators. It works on simulators (IOS) and also works on both real devices as shown in videos (Android & IOS)

If you want to try Jitsi, please try on release mode and also with real devices.

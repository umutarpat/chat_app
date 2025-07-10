pod:
	cd ios && rm -rf pods && rm -f Podfile.lock && pod install && cd ..

runner: 
	dart run build_runner build

ios-build-obfuscate:
	flutter build ios --release --obfuscate --split-debug-info=build/debug-info

localization:
	flutter gen-l10n

env:
	dart run build_runner clean && dart run build_runner build --delete-conflicting-outputs

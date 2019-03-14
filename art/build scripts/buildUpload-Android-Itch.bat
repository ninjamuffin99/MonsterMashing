cd ..
cd ..
lime build android -release
butler push ./export/release/android/bin/bin/MonsterMashing-debug.apk ninja-muffin24/monster-mashing:android
butler status ninja-muffin24/monster-mashing:android
pause
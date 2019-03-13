cd ..
cd ..
lime build windows -release
butler push ./export/release/windows/bin ninja-muffin24/monster-mashing:win
butler status ninja-muffin24/monster-mashing:win
pause
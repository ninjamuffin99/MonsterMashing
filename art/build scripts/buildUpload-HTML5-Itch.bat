@echo off
color 0e
cd ..
cd ..
@echo on
lime build html5 -release
butler push ./export/release/windows/bin ninja-muffin24/monster-mashing:html5
butler status ninja-muffin24/monster-mashing:html5
pause
#!/bin/bash

echo
echo "System patching completed, configuration instructions follow."
echo "Press <ENTER> to continue..."
read -s
clear
echo "Display settings"
echo "----------------"
echo "The 'ClassicLooks' theme consists of a collection of \"display themes\" (Xfce settings panel -> Appearance -> Themes), plus two \"window manager themes\" (Xfce settings panel -> Window Manager); in this context:"
echo
echo "- the 'ClassicLooks' display themes blend well with 'Noto Sans 9'/'DejaVu Sans Book 9'/'Bitstream Vera Sans 9' fonts and 'elementary Xfce darkER' icon set, and they scale consistently for font sizes [7-13]@96dpi"
echo "- for a consistent look of the window titles across all applications (xfwm4 and gtk3-csd) you should select the same font (family, style, and size) for the window manager titles as you have selected for your display theme (e.g. 'Noto Sans 9', etc)"
echo "- for a consistent look of window manager controls across all applications (xfwm4 and gtk3-csd) you should select the 'ClassicLooks XFWM4' window manager theme when using a low-DPI display theme (e.g. 'ClassicLooks') and the 'ClassicLooks XFWM4 (HDPI)' window manager theme when using a high-DPI display theme (e.g. 'ClassicLooks (HDPI)'"
echo
echo "Hacking"
echo "-------"
echo "See '$themes_dir/ClassicLooks/TOOLS/CONFIG/HACKING' for end-user customization options."
echo
echo "You may have to restart your system for all settings to take effect."
echo "Setup completed, press <ENTER> to close this window."
read -s
echo

#!/bin/bash

# install qt5.7+ font fix
echo "Installing Qt font fix..."
echo
$sudo "mkdir -p $qt5_conf_dir"
$sudo "rm -f $qt5_conf_dir/90-classiclooks_qt5fontfix.conf" # MUST explicitly remove if exists
$sudo "$cp_no_attributes ./lib/90-classiclooks_qt5fontfix.conf $qt5_conf_dir"

# set QT_QPA_PLATFORMTHEME in all supported shells' initialization files
echo "Installing QT_QPA_PLATFORMTHEME..."
echo
for sf in "${shell_init_files[@]}"
do
  s=$(echo $sf | cut -d':' -f 1)
  f=$(echo $sf | cut -d':' -f 2)
# echo $s $f
  if [ -f $f ]
  then
    [ "$(tail -c 1 "$f" | wc -l)" -eq 0 ] && $sudo "echo >> $f"
    $sudo "$defn_delines; exec_delines '#classiclooks' $f"
    if [ "$s" == "csh" ]
    then
      set_qt_theme="setenv QT_QPA_PLATFORMTHEME gtk2"
    else
      set_qt_theme="export QT_QPA_PLATFORMTHEME=gtk2"
    fi
    set_qt_theme=$set_qt_theme" #classiclooks_qt5-gtk2" # classiclooks marker for uninstall
    $sudo "echo '$set_qt_theme' >> $f"
#   $sudo "echo '[ \"\$(which xfconf-query | grep \"/\")\" -a \"\$(xfconf-query -c xsettings -p /Net/ThemeName | grep -i \"ClassicLooks \")\" ] && $set_qt_theme' >> $f"
#   $sudo "echo '[ ! \"\$(which xfconf-query | grep \"/\")\" ] && $set_qt_theme' >> $f"
  fi
done

# set up qt6ct configuration for qt6 apps
# NOTE: For Qt6 support with qt6ct, users should set QT_QPA_PLATFORMTHEME=qt6ct
# (the existing gtk2 setting above handles Qt4/Qt5 via qt5-styleplugins)
echo "Installing Qt6 theme configuration..."
echo
qt6ct_conf_dir="$HOME/.config/qt6ct"
qt6ct_qss_dir="$qt6ct_conf_dir/qss"
mkdir -p "$qt6ct_qss_dir"
cp ./lib/../QT/classiclooks-qt6.qss "$qt6ct_qss_dir/"
if [ ! -f "$qt6ct_conf_dir/qt6ct.conf" ]; then
  cat > "$qt6ct_conf_dir/qt6ct.conf" << 'QTCONF'
[Appearance]
color_scheme_path=
custom_palette=false
icon_theme=
standard_dialogs=default
style=Fusion

[Interface]
activate_item_on_single_click=1
buttonbox_layout=0
cursor_flash_time=1000
dialog_buttons_have_icons=1
double_click_interval=400
gui_effects=@Invalid()
keyboard_scheme=2
menus_have_icons=true
show_shortcuts_in_context_menus=true
stylesheets=classiclooks-qt6.qss
toolbutton_style=4
underline_shortcut=1
wheel_scroll_lines=3
QTCONF
fi

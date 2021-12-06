#####################################################################
# called by the themecolor.sh script found inside each theme folder #
#####################################################################

if [ "$1" == "" -o "$(echo $1 | sed 's/#[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]\/00\.[0-9][0-9]//')" != "" ]
then
  echo "Wrong argument for 'color_tone/pull_strength' in '$(pwd)', press <ENTER> to finish."
  read -s
  exit
fi

shift_bg_color=$(echo $1 | cut -d '/' -f 1)
pull_strength=$(echo $1 | cut -d '/' -f 2)

files=""
files=$(find ./gtk-?.0/*.css -printf "\"%p\" ")" $files"
files=$(find ./gtk-?.0/options/*.css -printf "\"%p\" ")" $files"

sed="sed -E -i 's/00\.[0-9][0-9]([^0-9])/$pull_strength\1/g' $files"
eval $sed
sed="sed -E -i 's/shift_bg_color([: \t]+)#[0-9a-fA-F]+/shift_bg_color\1$shift_bg_color/' $files"
eval $sed

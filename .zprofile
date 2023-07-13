#
# z(sh)profile config
# ~/.zprofile
#

# Automatically start Hyprland if on tty1
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi

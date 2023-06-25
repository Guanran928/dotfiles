xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
exec bspwm

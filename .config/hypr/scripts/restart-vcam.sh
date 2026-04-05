echo "Restarting OBS Virtual Camera..."

pkill -9 obs 2>/dev/null || true
sleep 1

sudo modprobe -r -f v4l2loopback 2>/dev/null || true
sleep 1
sudo modprobe v4l2loopback

echo "Virtual Camera restarted."
notify-send "Virtual Camera" "Restarted successfully" --icon=camera-web

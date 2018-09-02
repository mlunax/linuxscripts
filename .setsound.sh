#Debian Cinnamon Gnome Alsa and PulseAudio
pactl set-card-profile alsa_card.pci-0000_00_1b.0 output:analog-stereo
sleep 0.1
pactl set-sink-port alsa_output.pci-0000_00_1b.0.analog-stereo analog-output-headphones
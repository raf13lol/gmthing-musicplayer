enum Syskeys
{
	MediaNextTrack = 176,
	MediaPreviousTrack = 177,
	MediaStop = 178,
	MediaPlayPause = 179
}

#macro USE_ALT_SYSKEYS false

syskeyspressed = {
	medianexttrack: false,
	mediaprevioustrack: false,
	mediastop: false,
	mediaplaypause: false
}

cursound = -1;
paused = false;
singleloop = true;
prevsingleloop = true;
skipswitch = false;

pitch = 1;
spd = 1;
step = 0.05;

playcursound = function() {
	skipswitch = cursound.ismidi;
	cursound.channel = fmod_system_play_sound(cursound.sound, false);
	fmod_channel_control_set_callback(cursound.channel);
	paused = false;
	skipswitch = true;
	event_user(0);
}

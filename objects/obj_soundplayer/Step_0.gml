
if (cursound == -1 || cursound.channel == -1)
	return;
	
#region track change

var mediapt = keyboard_check_direct(Syskeys.MediaPreviousTrack) 
	|| (USE_ALT_SYSKEYS && keyboard_check_direct(vk_pageup));

if (!syskeyspressed.mediaprevioustrack && mediapt)
{
	if (cursound == -1 || fmod_channel_get_position(cursound.channel, FMOD_TIMEUNIT.MS) < 5000.0)
	{
		with (obj_soundbrowser)
		{
			other.skipswitch = true;
			soundindex--;
			if (soundindex < playliststart)
				soundindex = playlistend - 1;
			usesoundindex = true;
			event_user(0);
		}
	}
	else
		fmod_channel_set_position(cursound.channel, 0.0, FMOD_TIMEUNIT.MS);
}
syskeyspressed.mediaprevioustrack = mediapt;


var mediant = keyboard_check_direct(Syskeys.MediaNextTrack) 
	|| (USE_ALT_SYSKEYS && keyboard_check_direct(vk_pagedown));
	
if (!syskeyspressed.medianexttrack && mediant)
{
	with (obj_soundbrowser)
	{
		other.skipswitch = true;
		soundindex++;
		if (soundindex >= playlistend)
			soundindex = playliststart;
		usesoundindex = true;
		event_user(0);
	}
}

syskeyspressed.medianexttrack = mediant;

#endregion

#region play/pause/stop

var mediapp = keyboard_check_direct(Syskeys.MediaPlayPause) 
	|| (USE_ALT_SYSKEYS && keyboard_check_direct(vk_pause));
	
if (!syskeyspressed.mediaplaypause && mediapp)
{
	paused = !paused;
	fmod_channel_control_set_paused(cursound.channel, paused);
}
syskeyspressed.mediaplaypause = mediapp;


var mediastop = keyboard_check_direct(Syskeys.MediaStop) 
	|| (USE_ALT_SYSKEYS && keyboard_check_direct(vk_end));
	
if (!syskeyspressed.mediastop && mediastop)
{
	fmodutil_destroy_sound(cursound);
	with (obj_soundbrowser)
		soundindex = -1;
	cursound = -1;
	skipswitch = true;
}

syskeyspressed.mediastop = mediastop;

#endregion

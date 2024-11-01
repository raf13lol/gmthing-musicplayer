show_debug_message(singleloop);
show_debug_message(skipswitch);
if (async_load[? "type"] == "fmod_channel_control_set_callback"
&& !singleloop && !skipswitch)
{
	if (async_load[? "kind"] == FMOD_CHANNELCONTROL_CALLBACK_TYPE.END)
	{
		with (obj_soundbrowser)
		{
			soundindex++;
			if (soundindex >= playlistend)
				soundindex = soundindex - playlistend + playliststart;
			usesoundindex = true;
			event_user(0);
		}
	}
}
skipswitch = false;
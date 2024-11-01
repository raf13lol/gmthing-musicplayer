// feather ignore GM1041

/// @param {struct.FmodUtilSound} sound Sound to destroy.
function fmodutil_destroy_sound(sound) {
	array_foreach(sound.dsps, function(e, i){
		if (e == -1)
			return;
		fmod_channel_control_remove_dsp(sound.dsps, e);
		fmod_dsp_release(e);
	});
	if (sound.pitchdsp != -1)
	{
		fmod_channel_control_remove_dsp(sound.channel, sound.pitchdsp);
		fmod_dsp_release(sound.pitchdsp);
	}
	fmod_sound_release(sound.sound);
	
	return;
}

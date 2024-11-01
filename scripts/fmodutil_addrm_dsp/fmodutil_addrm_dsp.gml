/// @param {struct.FmodUtilSound} sound Input sound to add dsp to.
/// @param {real} index Index to input the dsp in.
/// @param {struct.FMOD_DSP_TYPE} dsp_type The type of the dsp.
function fmodutil_add_dsp(sound, index, dsp_type) {
	var dsp = fmod_system_create_dsp_by_type(dsp_type);
	while (array_length(sound.dsps) < (index + 1))
	{
		array_push(sound.dsps, -1);
	}
	
	sound.dsps[index] = dsp;
	fmod_channel_control_add_dsp(sound.channel, index + 1, dsp);
}

/// @param {struct.FmodUtilSound} sound Input sound to remove dsp from.
/// @param {real} index Index of dsp in the sound.dsps array.
function fmodutil_remove_dsp(sound, index) {
	var dsp = sound.dsps[index];
	
	fmod_channel_control_remove_dsp(sound.channel, dsp);
	sound.dsps[index] = -1;
	fmod_dsp_release(dsp);
}

/// @param {struct.FmodUtilSound} sound Input sound to remove pitch dsp from.
function fmodutil_remove_pitchdsp(sound) {
	if (sound.pitchdsp == -1)
		return;
		
	var dsp = sound.pitchdsp;
	
	fmod_channel_control_remove_dsp(sound.channel, dsp);
	sound.pitchdsp = -1;
	fmod_dsp_release(dsp);
}
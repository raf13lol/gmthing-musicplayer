/// @param {struct.FmodUtilSound} sound Sound to change pitch/speed on.
/// @param {real} pitch New pitch.
/// @param {real} speed New speed.
function fmodutil_set_pitch_speed(sound, pitch, speed) {
	var ismidi = sound.ismidi;
	
	fmod_channel_control_set_pitch(sound.channel, ismidi ? pitch : speed);
		
	/*if (ismidi)
	{
		fmod_sound_set_music_speed(sound.sound, speed / pitch)
		return;
	}
	
	if (sound.pitchdsp == -1)
	{
		var dsp = fmod_system_create_dsp_by_type(FMOD_DSP_TYPE.PITCHSHIFT);
		fmod_channel_control_add_dsp(sound.channel, 0, dsp);
		sound.pitchdsp = dsp;
	}*/
	
	// uhoh :sob:
	//fmod_dsp_set_parameter_float(sound.pitchdsp, FMOD_DSP_PITCHSHIFT.PITCH, clamp(pitch / speed, 0.5, 2.0));
}
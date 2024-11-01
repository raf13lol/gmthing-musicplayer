/// @param {struct.FmodUtilSound} sound Sound to check if it's a midi.
/// @returns {bool}
function fmodutil_is_midi(sound) {
	switch (sound.format)
	{
		case FMOD_SOUND_TYPE.IT:
		case FMOD_SOUND_TYPE.MOD:
		case FMOD_SOUND_TYPE.S3M:
		case FMOD_SOUND_TYPE.XM:
		case FMOD_SOUND_TYPE.MIDI:
			return true;
	}
	
	return false;
}
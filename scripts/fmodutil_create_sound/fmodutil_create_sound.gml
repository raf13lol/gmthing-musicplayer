// feather ignore GM1041

/// @param {string} path Path to audio file.
/// @param {bool} singleloop If the file is a single-loop.
/// @returns {struct.FmodUtilSound}
function fmodutil_create_sound(path, singleloop) {
	var optis = new FmodSystemCreateSoundExInfo();

	if (file_exists(working_directory + "midibank.dls"))
		optis.dls_name = working_directory + "midibank.dls";

	var sound = fmod_system_create_sound(path, 
	(singleloop ? FMOD_MODE.LOOP_NORMAL : FMOD_MODE.LOOP_OFF) 
	| FMOD_MODE.ACCURATETIME, optis);
	var format = fmod_sound_get_format(sound).type;
	var dsps = [];
	
	return {sound, channel: -1, pitchdsp: -1, format, dsps, ismidi: fmodutil_is_midi({format})};
}

// making it work with feather 
function FmodUtilSound() constructor {
	sound = -1;
	channel = -1;
	format = FMOD_SOUND_TYPE.UNKNOWN;
	dsps = [];
	pitchdsp = -1;
	ismidi = false;
}
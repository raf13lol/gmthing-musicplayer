allowedformats = ["aif", "aiff", "asf", "wma", "wmv", "flac", "it", 
"mid", "midi", "mod", "mp2", "mp3", "wav", "ogg", "raw", "xm", "s3m"];

nonrecursivedirs = [];
recursivedirs = [];

if (file_exists("recursivedirs.txt"))
{
	var f = file_text_open_read("recursivedirs.txt");
	var path = "";
	while (!file_text_eof(f))
	{
		path = string_nonewline(file_text_readln(f));
		
		if (path != "" && (string_ends_with(path, "\\") || string_ends_with(path, "/"))
		&& directory_exists(path))
			array_push(recursivedirs, string_nonewline(path));
	}
}
if (file_exists("nonrecursivedirs.txt"))
{
	var f = file_text_open_read("nonrecursivedirs.txt");
	var path = "";
	while (!file_text_eof(f))
	{
		path = string_nonewline(file_text_readln(f));
		
		if (path != "" && (string_ends_with(path, "\\") || string_ends_with(path, "/"))
		&& directory_exists(path))
			array_push(nonrecursivedirs, string_nonewline(path));
	}
}

curselected = 0;
soundindex = -1;
holddir = 0;
holdtime = 0;
holdwait = 0;

effectselected = 0;
effectholddir = 0;
effectholdtime = 0;
effectholdwait = 0;

foundfiles = [];
fflength = 0;

hasplaylist = false;
playliststart = 0;
playlistend = 0;
workingonplaylist = false;
usesoundindex = false;

draw = true;

// feather ignore GM2017
// this is not an instance variable ???
function FmodUtilDirSound() constructor {
	path = "";
}
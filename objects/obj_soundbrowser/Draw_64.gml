if (!draw)
{
	draw_text(2, 2, "Drawing disabled for performance...turn back on with '3'.");
	return;
}
if (fflength == 0)
{
	draw_text(2, 2, "Er... no files found. Make sure you have added some paths (must end with / or \\) in the txt files!");
	return;
}

var basei = 0;
var _x = 160;
for (var i = clamp(0, curselected - 15, fflength - 35); i < fflength; i++)
{
	var _y = basei * 20 + 2;
	
	if (_y > 720)
		break;
	
	
	if (i == curselected)
	{
		draw_set_color(merge_colour(c_yellow, c_black, 0.2));
		draw_rectangle(_x, _y, 1280, _y + 20, false);
		draw_set_color(c_white);
	}
	var isplaying = i == soundindex;
	var playlist = workingonplaylist || hasplaylist;
	if (playlist || isplaying)
	{
		var isstart = playlist && i == playliststart;
		var isend = hasplaylist && (i == playlistend - 1) || (workingonplaylist && i == curselected);
		// this sukc
		if (isstart && isend)	
			draw_text(_x - 20, _y, isplaying ? "=" : "#");
		else if (isstart)
			draw_text(_x - 20, _y, isplaying ? "{" : "(");
		else if (isend)
			draw_text(_x - 20, _y, isplaying ? "}" : ")");
		else if (isplaying)
			draw_text(_x - 20, _y, ">");
	}	
	
		
		
	draw_text(_x, _y, foundfiles[i]);
	
	basei++;
}

var soundrn = false;
with (obj_soundplayer)
{
	soundrn = (cursound != -1)
}

if (soundrn)
{
	draw_set_color(merge_colour(c_yellow, c_black, 0.2));

	var shift = keyboard_check(vk_shift);
	var _y = 2;
	draw_rectangle(0, _y, _x - 22, _y  + 40, false);
}

with (obj_soundplayer)
{
	var ps = pitch / spd;
	draw_set_color(cursound != -1 && !cursound.ismidi && clamp(ps, 0.5, 2.0) != ps ? c_red : c_white);
	
	draw_text(2, 2, $"Pitch: {string_decimallength(pitch, 2)}x");
	draw_text(2, 22, $"Speed: {string_decimallength(spd, 2)}x");
	
	draw_set_color(c_white);
	
	if (cursound != -1)
	{
		var pos = fmod_channel_get_position(cursound.channel, FMOD_TIMEUNIT.MS) / 1000;
		if (cursound.ismidi)
			pos /= pitch / spd;
		draw_text(2, 52, $"{pos}");
	}
	else
		draw_text(2, 52, "0.00");
	draw_text(2, 72, (singleloop) ? "Single Loop" : "Loop");
}
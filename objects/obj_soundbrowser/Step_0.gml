/// @description errr not the best code

if (fflength == 0)
	return;

var gmspd = game_get_speed(gamespeed_fps);

if (keyboard_check_pressed(ord("3")))
{
	draw = !draw;
}

#region track selection

var uppressed = keyboard_check(vk_up) && holdtime == 0;
var downpressed = !uppressed && keyboard_check(vk_down) && holdtime == 0;

if (holddir == 1)
{
	if (keyboard_check(vk_up))
	{
		if (holdtime++ >= gmspd / 2)
		{
			uppressed = true + 1;
		}
	}
	else
		holdtime = 0;
}
else if (holddir == 2)
{
	if (keyboard_check(vk_down))
	{
		if (holdtime++ >= gmspd / 2)
		{
			downpressed = true + 1;
		}
	}
	else
		holdtime = 0;
}
if (uppressed)
{
	curselected--;
	if (curselected < playliststart)
		curselected = playlistend - 1;
	if (--uppressed)
		return;
	holddir = 1;
	holdtime = 1;
}
if (downpressed)
{
	curselected++;
	if (curselected >= playlistend)
		curselected = curselected - playlistend + playliststart;
	if (--downpressed)
		return;
	holddir = 2;
	holdtime = 1;
}
if (keyboard_check_pressed(vk_space))
{
	event_user(0);
}

#endregion

#region playlist handler

if (!hasplaylist)
{
	if (keyboard_check_pressed(ord("1")))
	{
		if (!workingonplaylist)
		{
			workingonplaylist = true;
			playliststart = curselected;
		}
		else
		{
			workingonplaylist = false;
			hasplaylist = true;
			playlistend = curselected + 1;
		}
	}
}
else if (keyboard_check_pressed(ord("1")))
{
	hasplaylist = false;
	playliststart = 0;
	playlistend = fflength;
}

if (keyboard_check_pressed(ord("2")))
{
	with (obj_soundplayer)
	{
		singleloop = !singleloop;
		if (cursound != -1 && cursound.channel != -1)
		{
			skipswitch = true;
			event_user(0);
		}
		else
			prevsingleloop = singleloop;
	}
}

#endregion

#region effect selection + changing

var soundrn = false;
with (obj_soundplayer)
{
	soundrn = (cursound != -1)
}

if (!soundrn)
	return;

if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(ord("S")))
{
	effectselected = !effectselected;
}

var leftpressed = keyboard_check(vk_left) && effectholdtime == 0;
var rightpressed = !leftpressed && keyboard_check(vk_right) && effectholdtime == 0;
var holdwaittime = 4 - min(floor(effectholdtime / (gmspd * 3)), 4);

if (effectholddir == 1)
{
	if (keyboard_check(vk_left))
	{
		if (effectholdtime++ >= gmspd / 2 && effectholdwait-- <= 0)
		{
			leftpressed = true + 1;
			effectholdwait = holdwaittime;
		}
	}
	else
		effectholdtime = 0;
}
else if (effectholddir == 2)
{
	if (keyboard_check(vk_right))
	{
		if (effectholdtime++ >= gmspd / 2 && effectholdwait-- <= 0)
		{
			rightpressed = true + 1;
			effectholdwait = holdwaittime;
		}
	}
	else
		effectholdtime = 0;
}

if (leftpressed)
{
	var shiftpressed = !keyboard_check(vk_shift);
	var effecs = effectselected;
	with (obj_soundplayer)
	{
		//if (effecs == 0 || !shiftpressed)
		pitch -= step;
		//if (effecs == 1 || !shiftpressed)
		spd -= step;
		event_user(0);
	}
	if (--leftpressed)
		return;
	effectholddir = 1;
	effectholdtime = 1;
	effectholdwait = holdwaittime;
}
if (rightpressed)
{
	var shiftpressed = !keyboard_check(vk_shift);
	var effecs = effectselected;
	with (obj_soundplayer)
	{
		//if (effecs == 0 || !shiftpressed)
		pitch += step;
		//if (effecs == 1 || !shiftpressed)
		spd += step;
		event_user(0);
	}
	if (--rightpressed)
		return;
	effectholddir = 2;
	effectholdtime = 1;
	effectholdwait = holdwaittime;
}

#endregion

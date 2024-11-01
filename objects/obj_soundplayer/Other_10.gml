if (cursound == -1 || cursound.channel == -1)
	return;
	
if (!cursound.ismidi)
{
	pitch = clamp(pitch, 0.25, 3.0);
	spd = clamp(spd, 0.25, 3.0);
}
else
{
	pitch = max(pitch, step);
	spd = max(spd, step);
}

var ershoulddo = false;
with (obj_soundbrowser)
	ershoulddo = soundindex != -1;
if (prevsingleloop != singleloop && ershoulddo)
{
	prevsingleloop = singleloop;
	fmodutil_destroy_sound(cursound);
	with (obj_soundbrowser)
		other.cursound = fmodutil_create_sound(foundfiles[soundindex], other.singleloop);
	playcursound();
}

fmodutil_set_pitch_speed(cursound, pitch, spd);
skipswitch = cursound.ismidi;
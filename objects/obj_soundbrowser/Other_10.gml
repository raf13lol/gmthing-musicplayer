if (soundindex != -1)
{
	with (obj_soundplayer)
	{
		fmodutil_destroy_sound(cursound);
	}
}
var i = (usesoundindex) ? soundindex : curselected;
with (obj_soundplayer)
{
	cursound = fmodutil_create_sound(other.foundfiles[i], singleloop);
	skipswitch = true;
	playcursound();
}
if (!usesoundindex)
	soundindex = curselected;
usesoundindex = false;
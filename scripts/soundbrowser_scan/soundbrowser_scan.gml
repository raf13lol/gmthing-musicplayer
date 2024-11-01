/// @param {real} nonrstart Where to start in the non-recursive array.
/// @param {real} nonrcount How much to do in the non-recursive array.
/// @param {real} rstart Where to start in the recursive array.
/// @param {real} rcount How much to do in the recursive array.
function soundbrowser_scan(nonrstart, nonrcount, rstart, rcount) {
	
	var nrl = nonrstart + nonrcount;
	var rl = rstart + rcount;
	var noncheckedfiles = [];
	
	for (var i = nonrstart; i < nrl; i++)
	{
		var startdir = nonrecursivedirs[i];
		var file_name = file_find_first(startdir + "*", fa_none);

		while (file_name != "")
		{
		    array_push(noncheckedfiles, startdir + file_name);
		    file_name = file_find_next();
		}
	}
	
	var directories = [];
	
	for (var i = rstart; i < rl; i++)
	{
		array_push(directories, recursivedirs[i]);
	}
	
	while (array_length(directories) > 0)
	{
		var startdir = directories[0];
		var file_name = file_find_first(startdir + "*", fa_directory);
		var insertplace = 1;
		while (file_name != "")
		{
			if (directory_exists(startdir + file_name))
				array_insert(directories, insertplace++, startdir + file_name + "/");
			else
				array_push(noncheckedfiles, startdir + file_name);
		    file_name = file_find_next();
		}
		
		array_delete(directories, 0, 1);
	}
	
	var l = array_length(noncheckedfiles);
	for (var i = 0; i < l; i++)
	{
		var f = noncheckedfiles[i];
		if (array_contains(allowedformats, string_lower(string_copy(f, string_last_pos(".", f) + 1, 4))))
			array_push(foundfiles, f);
	}
}
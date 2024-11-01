/// @param {string} str String to cleanse.
/// @returns {string}
function string_nonewline(str){
	var retstr = str;
	retstr = string_replace(retstr, "\n", "");
	retstr = string_replace(retstr, "\r", "");
	return retstr;
}
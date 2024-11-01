/// @param {real} number Number to input.
/// @param {real} decimals How many decimals to ensure.
/// @returns {string}
function string_decimallength(number, decimals){
	var targetlength = decimals + floor(log10(number)) + 2 + (number < 0);

	var retstr = string(number);
	
	var l = string_length(retstr);
	if (l + decimals <= targetlength)
	{
		retstr += ".";
		l++;
	}	
	while (l < targetlength)
	{
		retstr += "0";
		l++;
	}
	
	return retstr;
}
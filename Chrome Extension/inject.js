/**
 * Make sure the window has loaded
 */
window.onload = function ()
{
	// appendURL();
	var start = " | url:[";
	var end = "]";

	// If the URL has not already been added
	if (document.title.indexOf(start) == -1)
	{
		document.title += start + location.href + end;
	}
}

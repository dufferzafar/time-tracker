/**
 * Make sure the window has loaded
 */
window.onload = function ()
{
	// If the URL has not already been added
	if (document.title.indexOf("http") == -1)
	{
		// document.title += location.href;
		document.title += " - " + location.host;
	}
}

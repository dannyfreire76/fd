<?
// *************** USER CONFIGURABLE SECTION ******************
// Before this script will do anything useful, the following
// variables must be set.

// MANDATORY VARIABLES
$sendto = "danny@freire-design.com";
$email = $_REQUEST["email"];
$msg = $_REQUEST["msg"];
$subject = 'Message from freire-design.com';

// ************ END OF USER CONFIGURABLE SECTION ***************

// ******************** MAIN FEEDBACK SCRIPT *****************
// Do not touch the following. You break it, you fix it.

function disable_caching ()
{
    header( "Expires: Mon, 8 Dec 1999 05:00:00 GMT" );
    header( "Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT" );
    header( "Cache-Control: no-cache, must-revalidate" );
    header( "Pragma: no-cache" );
}

$headers  = "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
$headers .= "From: <$email>";

// send the email now
if ( mail($sendto, $subject, $msg, $headers ) ) {
    echo 'ok';
};
?>

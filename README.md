To get response from website listed in the given file like demo file "check"

Files:

constat.sh   fetch the website response and print it in console.
parameters:

$1  hostname of website or ip. for example www.baidu.com
$2  optional, the port of web server, 80 by default if omit this .
$3  optional, page url. some thing like /, /index.html , /login.asp '/' by default if omitted.  


main.sh   get the web connection status in prarllel by invoking constat.sh. the only paramter is the web url list file.
parameter:

$1 the file of web sites to check. each line is a url like www.baidu.com:80/index.html , see the demo file "check".(note that don't add 'http://' prefix in the url list file.)

check     the demo url list file. please "cat check" andread it, then type "./main.sh check" in bash console.
	  (note that don't add 'http://' prefix in the url list file.)
Example:

./constat.sh www.shangsuancai.com 80 /
./constat.sh www.baidu.com
in that way the http pages' response will show in console.

./main.sh check
grep the connection status (like 200 OK, 404 not found) for every url in the file named "check"
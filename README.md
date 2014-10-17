http-shell
============
To get response from website whose URL listed in a given file

Environment and Dependence:
-------------------------------

The shell command sould run in bash environment for any distribution of linux.
note that the following command 'nc' and 'parallel' shold be installed before run the shell.

- nc - arbitrary TCP and UDP connections and listens

- parallel - build and execute shell command lines from standard input inparallel

Please check them with command "which nc" and "which parallel".  if not, please install them.

for example, in ubuntu please run :

		apt-get install parallel


Files:
------

#### constat.sh   

fetch the website response and print it in console.

parameters:

- $1  hostname of website or ip. for example www.baidu.com.
- $2  optional, the port of web server, 80 by default if omit this.
- $3  optional, page url. some thing like /, /index.html , /login.asp '/' by default if omitted.  


#### main.sh  
 
get the web connection status in prarllel by invoking constat.sh. the only paramter is the web url list file.

parameter:

- $1 the file of web sites to check. each line is a url like www.baidu.com:80/index.html , see the demo file "check".(note that don't add 'http://' prefix in the url list file.)

#### check     

the demo url list file. please  "cat check" and read it, then type "./main.sh check" in bash console.

		(please don't add 'http://' prefix to the url in list file.)

Example:
--------

		./constat.sh www.shangsuancai.com 80 /

		./constat.sh www.baidu.com

in that way the http pages' response will show in console.

		./main.sh check

grep the connection status (like 200 OK, 404 not found) for every url in the file named "check"



by 
--

xiongbin.shangai@gmail.com
Oct,2014
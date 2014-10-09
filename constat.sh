#!/usr/bin/env bash
reqcmd='GET pathname HTTP/1.1
Host: hostname
Connection: keep-alive
Cache-Control: max-age=0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36
DNT: 1
Accept-Encoding: deflate,sdch
Accept-Language: zh,zh-CN;q=0.8,en;q=0.6,en-US;q=0.4,en-GB;q=0.2,zh-TW;q=0.2

'

func_makeReq(){
esc_str=$(sed -e 's/\\/\//g' <<<$2)
esc_str=$(sed -e 's/\//\\\//g' <<<$esc_str)
echo $reqcmd|sed -e "s/hostname/$1/"|sed -e "s/pathname/$esc_str/"
}
func_toEscChar(){
esc_str=$(sed -e 's/\\/\//g' <<<$1)
esc_str=$(sed -e 's/\//\\\//g' <<<$esc_str)
echo $esc_str
}


#$1 is hostname or ip
#$2 is port 
#$3 is urlpath without hostname, like /login.html

func_connect() {

if [ -z "$1" ];then
echo no host specfified.
fi
port="$2"
path="$3"
if [ -z "$port" ];then
	 port=80
fi
if [ -z "$path" ];then
	 path='/'
fi

#encode inputs from "/","\" to "\/","\\" so sed can read in regx.
encoded_path=$(func_toEscChar $path)
#echo $1 $port $encoded_path


echo "$reqcmd"|sed -e "s/hostname/$1/"|sed -e"s/pathname/$encoded_path/"|nc $1 $port

}

##main##  ./constat.sh www.baidu.com [8080] [/index.html]
func_connect $1 $2 $3

# $1 the website list file name like demo file:"check"
cat $1|
awk -F '[: \/]' '$0!~/^#/ {if($2~/[0-9]+/)
  {printf "%s  %s \/%s \n",  $1, $2, $3}
else 
  {printf "%s 80 \/%s\n", $1, $2}}' |
parallel -kj4 'url=({});
  ary=($(echo $url)); 
  echo -n ${ary[0]};
  echo -n -e \\t;
  ./constat.sh {}|grep HTTP'


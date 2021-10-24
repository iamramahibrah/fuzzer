#!/bin/bash

echo -e "
          =[FUZZ ]=
              V0.1"




function install
{ 

echo -e "installing tools ..."
if ! which ffuf >/dev/null; then
echo -e "installing ffuf ..."
sleep 1s
go get -u github.com/ffuf/ffuf
cd 
cd /go/bin/ffuf
sudo cp ffuf /usr/local/bin
echo -e "Ffuf installed succefully 😉"
fi

if ! which go >/dev/null; then
echo -e "installing ffuf ..."
sleep 1s
sudo apt-get install golang -y
echo -e "Ffuf installed succefully 😉"
fi
}



function check
{
echo -e "Checking tools ....."
sleep 1s
if ! which go >/dev/null; then
echo -e "Golang                                [x]"
else
echo -e "Golang                                [Ok]"
fi

#///

if ! which ffuf >/dev/null; then
echo -e "Ffuf                                  [x]"
else
echo -e "Ffuf                                  [Ok]"
fi
}


function help
{
echo -e "

         -H --help | Show usage help
         -d --dir  | Discover hidden directories /admin panel "

}

function dir
{
	echo -e "Enter link: "
	read link
	ffuf -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u $link -c -v
}

while [ $# -gt 0 ]; do
  case "$1" in
    -H|--help)
      clear
      help
      ;;
    -d|--dir)
      clear
      dir
      ;;
    --cve-scanner)
      cve
      ;;

    *)
      >&2 printf "Error: Invalid argument\n"
      exit 1
      ;;
  esac
  shift
done






































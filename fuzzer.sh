#!/bin/bash

function ban
{

echo -e "
       // FUZZER AUTOMATION //
                     v0.1"

}





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

if ! which amass >/dev/null; then
echo -e "installing amass ..."
sleep 1s
sudo apt-get install amass -y
echo -e "amass installed succefully 😉"
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

#///

if ! which amass >/dev/null; then
echo -e "Amass                                   [x]"
else
echo -e "Amass                                  [Ok]"
fi
}


function dns-enum
{

echo -e -n "Enter url: "
read dns
echo -e "enumerating $dns"
amass enum --passive -d $dns 

}

function help
{
echo -e "

         -H --help    | Show usage help
         -i --install | Install tools
         -c --check   | check tools
         -d --dir     | Discover hidden directories /admin panel
         -e --enum    | subdomain enumeration"

}

function dir
{
	echo -e -n "Enter link: "
	read link
	ffuf -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u $link -c -v
}

while [ $# -gt 0 ]; do
  case "$1" in
    -H|--help)
      clear
      ban
      help
      ;;
    -d|--dir)
      clear
      ban
      dir
      ;;
    -e|--enum)
     clear
     ban
     dns-enum
      ;;
    -i|--install)
      clear
      ban
      install
      ;;
    -c|--check)
      clear
      ban
      check
      ;;

    *)
      >&2 printf "Error: Invalid argument\n"
      exit 1
      ;;
  esac
  shift
done






































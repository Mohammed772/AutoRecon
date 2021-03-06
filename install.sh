#!/bin/bash

## VARIABLES
ToolsDIR="/root/Recon/Tools"
GoPath="/root/go"

## SCRIPTS DEPENDANCES
apt-get install git jq python3 python3-pip -y
pip2 install jsbeautifier
mkdir $ToolsDIR

## Install AMASS
wget https://github.com/OWASP/Amass/releases/download/2.9.1/amass_2.9.1_linux_amd64.zip
unzip amass_2.9.1_linux_amd64.zip -d $ToolsDIR/
rm amass_2.9.1_linux_amd64.zip
mv $ToolsDIR/amass_2.9.1_linux_amd64 $ToolsDIR/Amass

## Install MassDNS
git clone https://github.com/blechschmidt/massdns.git $ToolsDIR/MassDNS
mkdir -p $ToolsDIR/MassDNS/bin
cc  -O3 -std=c11 -DHAVE_EPOLL -DHAVE_SYSINFO -Wall -fstack-protector-strong $ToolsDIR/MassDNS/main.c -o $ToolsDIR/MassDNS/bin/massdns

## Install Sublist3r
git clone https://github.com/aboul3la/Sublist3r.git $ToolsDIR/Sublist3r
pip3 install -r $ToolsDIR/Sublist3r/requirements.txt

## Install Aquatone
apt-get install chromium -y
wget https://github.com/michenriksen/aquatone/releases/download/v1.4.3/aquatone_linux_amd64_1.4.3.zip
unzip aquatone_linux_amd64_1.4.3.zip -d $ToolsDIR/Aquatone
rm aquatone_linux_amd64_1.4.3.zip
mv $ToolsDIR/Aquatone/aquatone $ToolsDIR/Aquatone/Aquatone

## Install Subjack
go get github.com/haccer/subjack
cp $GoPath/bin/subjack $ToolsDIR/Subjack

## Install TkoSubs
go get github.com/bgentry/heroku-go
go get github.com/gocarina/gocsv
go get github.com/google/go-github/github
go get github.com/olekukonko/tablewriter
go get golang.org/x/net/publicsuffix
go get golang.org/x/oauth2
go get github.com/miekg/dns

git clone https://github.com/anshumanbh/tko-subs.git $ToolsDIR/TkoSubs
go build $ToolsDIR/TkoSubs/tko-subs.go
mv tko-subs $ToolsDIR/TkoSubs/TkoSubs

## Install DirSearch
git clone https://github.com/maurosoria/dirsearch.git $ToolsDIR/DirSearch

## Install CORStest
git clone https://github.com/RUB-NDS/CORStest.git $ToolsDIR/CORStest

## Install LinkFinder
git clone https://github.com/GerbenJavado/LinkFinder.git $ToolsDIR/LinkFinder
cd $ToolsDIR/LinkFinder
python setup.py install

## Install WafW00F
pip install wafw00f

## Install MassCan
apt-get install masscan -y

## END
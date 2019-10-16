#!/bin/bash

rm -f hwinfo.txt

sudo apt install lsscsi

echo "Section: CPU" >> hwinfo.txt
echo "-----------------------------------------------------------------">> hwinfo.txt

lscpu >> hwinfo.txt

echo "" >> hwinfo.txt
echo "Section: Memory" >> hwinfo.txt
echo "-----------------------------------------------------------------">> hwinfo.txt

sudo dmidecode -t memory >> hwinfo.txt

echo "" >> hwinfo.txt
echo "Section: Storage" >> hwinfo.txt
echo "-----------------------------------------------------------------">> hwinfo.txt
lsscsi >> hwinfo.txt

echo "" >> hwinfo.txt
echo "Section: Model" >> hwinfo.txt
echo "-----------------------------------------------------------------">> hwinfo.txt
dmidecode | grep -A3 '^System Information' >> hwinfo.txt

echo "" >> hwinfo.txt
echo "Section: Service Tag" >> hwinfo.txt
echo "-----------------------------------------------------------------">> hwinfo.txt
dmidecode -s system-serial-number>> hwinfo.txt



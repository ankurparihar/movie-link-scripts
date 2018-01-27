#! /bin/bash

# for linux only. Tested succussfully on Ubuntu 16.04

# upper limit = 11544
# lower limit = 1040
# on 26-January-2018 4:00 PM

# instructions:
# download this script
# make a new folder and place this script file inside that folder
# open file with text editor
# change the range values within upper and lower bound
# open terminal
# run command 'sudo chmod +x khatrimaza.sh'
# run command './khatrimaza.sh'
# wait for complete execution
# open the created file khatrimaza.csv in a csv viewer/editor
# Now search your movie and visit link.

# Notes :
# You may need to change your csv viewer settings to comma separated only.
# You may need to change all occurance of '&amp;' to '&' manually.


echo "Generating csv file to store links...";
echo "index,Movie Name,Link" >> khatrimaza.csv;
echo "Fetching and parsing required data...";
for i in {7530..7545};
do
    wget --quiet "https://khatrimaza.org/site_$i.xhtml";
    title=$(cat site_$i.xhtml 2>/dev/null 2>/dev/null | grep title | head -n 1 | cut -c 8- | rev | cut -c 111- | rev);
	if [ "$title" != "" ];
    then
	    echo "$i,$title,https://khatrimaza.org/site_$i.xhtml" >> khatrimaza.csv ;	
    fi
done;
echo "removing site files...";
rm site*;
echo "Open file khatrimaza.csv in directory $(pwd) and search your movie... :)";
echo "Notes:";
echo "You may need to change your csv viewer settings to comma separated only.";
echo "You may need to change all occurance of '&amp;' to '&' manually.";

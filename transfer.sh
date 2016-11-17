#!/bin/bash

echo""
echo ">>> Hello!"
echo ">>> Pull or push content?"
read -p ">>> " userInput
echo ""

if [ "`echo $userInput | tr [:upper:] [:lower:]`" = "`echo pull`" ]; then

	if [ "`hostname`" = "`echo 'iMac.local'`" ]; then
		if [ -d /Users/`whoami`/Documents/CS_projects/plateletsBMT/matlab/ ]; then
			cd /Users/`whoami`/Documents/CS_projects/plateletsBMT/matlab/
			# remote sync: rsync -[options] [source] [destination]
			rsync -auv fgonzalez@ATLLA5031-2.local:/Users/fgonzalez/Documents/CS_projects/plateletsBMT/matlab/*.m .
			echo ">>> Files pulled from:"
			echo ">>> fgonzalez@ATLLA5031-2.local:/Users/fgonzalez/Documents/CS_projects/plateletsBMT/matlab/"
		else
			echo "'~/Documents/CS_projects/plateletsBMT/matlab/' directory Not Found "

		fi

	elif [ "`hostname`" = "`echo 'ATLLA5031-2.local'`" ]; then
                if [ -d /Users/`whoami`/Documents/CS_projects/plateletsBMT/matlab/ ]; then
                        cd /Users/`whoami`/Documents/CS_projects/plateletsBMT/matlab/
                        rsync -auv francisco@iMac.local:/Users/francisco/Documents/CS_projects/plateletsBMT/matlab/*.m .
			echo ">>> Files pulled from:"
                        echo ">>> francisco@iMac.local:/Users/francisco/Documents/CS_projects/plateletsBMT/matlab/"
                else
                        echo "'~/Documents/CS_projects/plateletsBMT/matlab/' directory Not Found "

                fi

	else
		echo "Ups! Something went wrong"
	fi


elif [ "`echo $userInput | tr [:upper:] [:lower:]`" =  "`echo push`" ]; then

	if [ "`hostname`" = "`echo 'iMac.local'`" ]; then
		if [ -d /Users/`whoami`/Documents/CS_projects/plateletsBMT/matlab/ ]; then
        	        cd /Users/`whoami`/Documents/CS_projects/plateletsBMT/matlab/
               		rsync -auv ./*.m fgonzalez@ATLLA5031-2.local:/Users/fgonzalez/Documents/CS_projects/plateletsBMT/matlab/
                        echo ">>> Files pushed to:"
                        echo ">>> fgonzalez@ATLLA5031-2.local:/Users/fgonzalez/Documents/CS_projects/plateletsBMT/matlab/"
        	else
                	echo "'~/Documents/CS_projects/plateletsBMT/matlab/' directory Not Found "

        	fi
	elif [ "`hostname`" = "`echo 'ATLLA5031-2.local'`" ]; then

                if [ -d /Users/`whoami`/Documents/CS_projects/plateletsBMT/matlab/ ]; then
                        cd /Users/`whoami`/Documents/CS_projects/plateletsBMT/matlab/
                        rsync -auv ./*.m francisco@iMac.local:/Users/francisco/Documents/CS_projects/plateletsBMT/matlab/
                        echo ">>> Files pushed to:"
                        echo ">>> francisco@iMac.local:/Users/francisco/Documents/CS_projects/plateletsBMT/matlab/"
                else
                        echo "'~/Documents/CS_projects/plateletsBMT/matlab/' directory Not Found "

                fi
        else
                echo "Ups! Something went wrong"

	fi

else

	echo "Ups! Invalid option. Try again."

fi

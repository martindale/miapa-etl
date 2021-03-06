#!/bin/bash

echo
echo "This is a script to run XSLT transformations using Saxon"
echo

# This function takes 3-4 inputs and returns the command to run Saxon with the specified files
printdir()
{
	
	expath="java -jar $3 $1 $2"
	if [ "$four" != "" ]
	then
	expath=$($expath > $4)
	fi
	echo
	echo "Transformation Started..."
	$expath
}



#If 3 or 4 arguments weren't passed, collect & pass them.
if [ "$#" != "3" ] && [ "$#" !=  "4" ]

then

echo "  If your setup is like mine, your XML is here:"
echo "  $HOME/git/miapa-etl/nexmlex/S10160.xml"
echo
echo "Enter absolute path of XML to be transformed or press enter to use above path:"
read one

${one:="$HOME/git/miapa-etl/nexmlex/S10160.xml"}

echo
echo "  If your setup is like mine, your MIAPA ETL XSLT file is here:"
echo "  $HOME/git/miapa-etl/nexml-isatab.xsl"
echo
echo "Enter absolute path of XSLT file to transform with or press enter to use above path:"
read two

${two:="$HOME/git/miapa-etl/nexml-isatab.xsl"}

echo
echo "  If your setup is like mine, Saxon is here:"
echo "  $HOME/git/working/saxon9he.jar"
echo
echo "Enter absolute path of your Saxon jar or press enter to use above path:"
read three

${three:="$HOME/git/working/saxon9he.jar"}

echo
echo "  Optional: To redirect output to a file enter a relative path.  e.g:"
echo "  log.txt"
echo
echo "Enter optional redirect path or press enter to get stdoutput in terminal:"
read four


printdir $one $two $three $four


#If 3 or 4 arguments were rec'd, plug them in to printdir()
else
echo "File Locations Received"
echo
printdir $1 $2 $3 $4 $5


fi
echo "Transformation Complete."
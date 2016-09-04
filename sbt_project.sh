#!/bin/bash
# Create a set of directories to start a sbt project
# Pass the name of the project as the argument
function help {
	echo "Argument missing!"
	echo "Usage: $0 {Project Name}"
}
if [ $# -eq 0 ] 
then
	help
	exit 1
fi
PROJNAME=$1
DIRNAME=${PROJNAME/" "/"_"}
BUILDFILE=$DIRNAME/build.sbt
mkdir -p $DIRNAME/{main,test}/{java,resources,scala}
mkdir -p $DIRNAME/{lib,project,target}
echo "name := \"$PROJNAME\"" > $BUILDFILE
echo 'version := "0.0.1"' >> $BUILDFILE
echo 'scalaVersion := "2.11.8"' >> $BUILDFILE
exit 0

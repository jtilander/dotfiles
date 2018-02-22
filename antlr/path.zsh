
if [ -z $CLASSPATH ]; then
	export CLASSPATH=".:${HOME}/.antlr/antlr.jar"
else
	export CLASSPATH=".:${HOME}/.antlr/antlr.jar:$CLASSPATH"
fi

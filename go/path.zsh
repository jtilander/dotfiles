
if [ -d $HOME/go ]; then
	export GOPATH=$HOME/go	
fi

if [ -d $PROJECTS/go ]; then
	export GOPATH=$PROJECTS/go
fi

export PATH="$GOPATH/bin:$PATH"

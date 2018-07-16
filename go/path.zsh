
if [ -d $HOME/go ]; then
	export GOPATH=$HOME/go	
	export GOBIN=$GOPATH/bin
	mkdir -p $GOBIN
fi

if [ -d $PROJECTS/go ]; then
	export GOPATH=$PROJECTS/go
	export GOBIN=$GOPATH/bin
	mkdir -p $GOBIN
fi

export PATH="$GOPATH/bin:$PATH"

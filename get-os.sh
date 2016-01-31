
#!/bin/bash
if [ "$(uname)" == "Darwin" ]; then
	echo "darwin"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	echo "linux"
elif [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then
	echo "cygwin"
fi

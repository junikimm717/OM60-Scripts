#!/bin/bash

error() {
    echo "
Not correct number of arguments.
Should be called as
./iterate.sh \(command to be tested\) (file name to dump data to)
"
}

CMD=$@
FILE=data


rm -rf $FILE

[ ! -f DUMMY ] && ./create_dummy.sh

for i in {1..20}; do
    (time (for j in {1..100}; do
        $CMD DUMMY > /dev/null
    done) 2>&1) | awk '/user/{print $2}' | sed 's/m//g' | sed 's/s//g' >> $FILE
    [ $? -ne 0 ] && exit 1
done

echo -e "\nTest Results for $OSTYPE with command $CMD\n"
./process.py

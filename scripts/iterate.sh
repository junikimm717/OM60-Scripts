#!/usr/bin/env bash

error() {
    echo "
Not correct number of arguments.
Should be called as
./iterate.sh \(command to be tested\) (file name to dump data to)
"
}

CMD=$@
FILE=data


[ ! -f DUMMY ] && ./create_dummy.sh

echo -e "\nTest Results for $OSTYPE with command $CMD\n" >> $FILE
echo -e "Testing for $OSTYPE with command $CMD\n"

for i in {1..40}; do
    (time (for j in {1..500}; do
        $CMD DUMMY > /dev/null
    done) 2>&1) | awk '/user/{print $2}' | sed 's/m//g' | sed 's/s//g' >> $FILE
    [ $? -ne 0 ] && exit 1
done

#./process.py

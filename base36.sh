#!/bin/bash

## base36 converstion taken from 
## https://boulderappsco.postach.io/post/convert-decimal-to-base-36-alpha-numeric-in-bash-linux
function decimal_to_base36() {
        BASE36=($(echo {0..9} {A..Z}));
        arg1=$@;
        for i in $(bc <<< "obase=36; $arg1"); do
echo -n ${BASE36[$(( 10#$i ))]}
done && echo
}

if [ $1 == "-r" ]; then
        shift
        for i in "$@"
        do
                echo -n "$i --- ";decimal_to_base36 $i
        done
else

        for i in "$@"
        do
                echo -n "$i ... ";bc<<<"ibase=36;$i"
        done
fi

#!/bin/bash

## http://stackoverflow.com/questions/2972765/linux-script-that-monitors-file-changes-within-folders-like-autospec-does

sha=0
previous_sha=0

update_sha()
{
    sha=`ls -lR . | sha1sum`
}

build () {
    ## Build/make commands here
    echo
    echo "--> Monitor: Monitoring filesystem... (Press enter to force a build/update)"
}

changed () {
    echo "--> Monitor: Files changed, Building..."
    coffee test
    previous_sha=$sha
}

compare () {
    update_sha
    if [[ $sha != $previous_sha ]] ; then changed; fi
}

run () {
    while true; do

        compare

        read -s -t 1 && (
            echo "--> Monitor: Forced Update..."
            coffee test
        )

    done
}

echo "--> Monitor: Init..."
echo "--> Monitor: Monitoring filesystem... (Press enter to force a build/update)"
run

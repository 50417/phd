# Push and pull results to server.

push() {
    local dir=$1

    cd $dir

    local archive=$(date +"$HOSTNAME-%y-%m-%d.%H-%M.tar.bz2")

    if [[ $HOSTNAME == "monza" ]]; then
        zip $arhive intel.csv intel-errors.csv nvidia.csv nvidia-errors.csv
    else
        echo "Unkown hostname '$HOSTNAME'" >&2
        exit 1
    fi

    echo "Prepared tarball $archive"
    scp ./$archive brendel.inf.ed.ac.uk:
}


pull() {
    local dir=$1
    local archive=$2

    cd $dir

    scp brendel.inf.ed.ac.uk:$archive .
    tar -I pbzip2 -xvf $archive
}

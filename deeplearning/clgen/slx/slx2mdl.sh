#!/bin/bash
dir=/var/phd/deeplearning/clgen/slx
zipdir=/var/zip/SourceForge
cd $zipdir

for a in $(find $zipdir -name "*.zip"); do
    echo "Extracting ${a}"
    unzip -n -d "$zipdir/" $a "*.slx" "*.mdl"
done

num=1
for a in $(find $zipdir -name "*.slx"); do
    new=$(printf "slx%04d.slx" "$num")
    filename=$(basename "$a")
    mv $a $dir/$new
    let num=num+1
done
num=1
for a in $(find $zipdir -name "*.mdl"); do
    new=$(printf "mdl%04d.mdl" "$num")
    filename=$(basename "$a")
    mv $a $dir/mdl/$new
    let num=num+1
done

cd $dir
matlab -nodisplay -nosplash -nodesktop -r "run(\"slx2mdl\"),close_system(\"${name}\",0),exit;"
for a in $(find $dir -name "*.slx"); do
    filename=$(basename "$a")
    name="${filename%.*}"
    ext="${filename##*.}"
    if [ "$ext" != "slx" ]
    then
        continue
    fi
    if [ ! -f "${dir}/${name}.mdl" ]; then
        echo "${name}.mdl not found!"
    fi
done
echo "Checking Finished!"

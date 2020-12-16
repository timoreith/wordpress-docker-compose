#/bin/bash
echo "Are you sure?"
echo "This will delete the current installation, including the database, and reset it to its default settings."
read -p "(Y/y)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo $'\n*** Stopping ***\n'
    ./stop.sh
    echo $'\n*** Deleting directories: wordpress, mysql ***\n'
    rm -rf ./wordpress/* ./mysql/*
    echo $'\n*** Building ***\n'
    ./build.sh
else
    echo "Skipping."
fi

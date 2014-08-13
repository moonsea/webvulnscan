ADHOCRACY_DIR="$INSTALL_DIR/adhocracy"

if [ -d "$ADHOCRACY_DIR" ]; then
    if [ "$OVERWRITE_EXISTING" = false ]; then
    	echo "[INFO] Skipping adhocracy installation: Adhocracy is allready instaled."
    	return
	fi
fi

rm -rf $ADHOCRACY_DIR
mkdir -p $ADHOCRACY_DIR

wget -nv https://raw.github.com/liqd/adhocracy/develop/build.sh -O $ADHOCRACY_DIR/build.sh
cd $ADHOCRACY_DIR
sh build.sh

# Create a index.php file with a redirect to make adhocracy accessible via http://wvs.localhost/adhocracy/
echo "<?php header( 'Location: http://localhost:5001' );?>" > index.php

./adhocracy_buildout/bin/adhocracy_interactive.sh &

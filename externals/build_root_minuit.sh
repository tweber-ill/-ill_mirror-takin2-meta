#!/bin/bash
#
# builds minuit
# @author Tobias Weber <tweber@ill.fr>
# @date sep-2020
# @license GPLv2
#

NUM_CORES=$(nproc)


BUILD_FOR_MINGW=0
if [ "$1" == "--mingw" ]; then
	BUILD_FOR_MINGW=1
fi



MINUIT_REMOTE=https://codeload.github.com/root-project/root/zip/master
MINUIT_LOCAL=${MINUIT_REMOTE##*[/\\]}
MINUIT_DIR=${MINUIT_LOCAL%.tar.gz}


rm -f "${MINUIT_LOCAL}"
rm -rf "${MINUIT_DIR}"


if ! wget ${MINUIT_REMOTE}; then
	echo -e "Could not download ${MINUIT_REMOTE}."
	exit -1
fi


unzip "${MINUIT_LOCAL}"


#cd "${MINUIT_DIR}/math/minuit2"
cd root-master/math/minuit2/
mkdir build && cd build


if BUILD_FOR_MINGW; then
	mingw64-cmake ..
	mingw64-make -j${NUM_CORES} && sudo mingw64-make install-strip
else
	cmake ..
	make -j${NUM_CORES} && sudo make install-strip
fi

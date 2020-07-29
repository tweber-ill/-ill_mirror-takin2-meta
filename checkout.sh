#!/bin/bash
#
# checkout all of takin's repos
# @author Tobias Weber <tweber@ill.fr>
# @date jul-20
# @license GPLv2
#

if [ -L takin ] || [ -d takin ]; then
	echo -e "A takin directory already exists here, exiting."
	exit -1
fi


mkdir takin
cd takin


# clone all sub-repos
git clone https://code.ill.fr/scientific-software/takin/meta.git
git clone https://code.ill.fr/scientific-software/takin/core.git
git clone https://code.ill.fr/scientific-software/takin/mag-core.git
git clone https://code.ill.fr/scientific-software/takin/tlibs.git
git clone https://code.ill.fr/scientific-software/takin/tlibs2.git
git clone https://code.ill.fr/scientific-software/takin/data.git

mkdir plugins
pushd plugins
git clone https://code.ill.fr/scientific-software/takin/plugins/mnsi.git
popd


# make links
pushd core
ln -sf ../data
ln -sf ../tlibs
popd

pushd mag-core
ln -sf ../tlibs2
popd

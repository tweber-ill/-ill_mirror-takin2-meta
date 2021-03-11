#!/bin/bash

#
# backup of source repositories
# @author Tobias Weber <tweber@ill.fr>
# @date mar-21
# @license GPLv2
#

declare -a REPOS_ILL=(
	"https://code.ill.fr/scientific-software/takin/core"
	"https://code.ill.fr/scientific-software/takin/mag-core"
	"https://code.ill.fr/scientific-software/takin/tlibs"
	"https://code.ill.fr/scientific-software/takin/tlibs2"
	"https://code.ill.fr/scientific-software/takin/meta"
	"https://code.ill.fr/scientific-software/takin/data"
	"https://code.ill.fr/scientific-software/takin/plugins/mnsi"
	"https://code.ill.fr/scientific-software/takin/paths"
	"https://code.ill.fr/tweber/tlibs2_magnon_helpers"
	"https://code.ill.fr/tweber/hercules"
	"https://code.ill.fr/tweber/takin-mnsi"
	"https://code.ill.fr/tweber/in20tools"
)

declare -a REPOS_PRIVATE=(
	"https://github.com/t-weber/takin"
	"https://github.com/t-weber/takin2"
	"https://github.com/t-weber/tlibs"
	"https://github.com/t-weber/misc"
	"https://github.com/t-weber/lr1"
	"https://github.com/t-weber/matrix_calc"
	"https://github.com/t-weber/geo"
	"https://github.com/t-weber/magtools"
	"https://github.com/t-weber/libcrystal"
	"https://github.com/t-weber/qthelpers"
	"https://github.com/t-weber/takin-data"
)


declare -a REPOS_FRM=(
	"https://forge.frm2.tum.de/cgit/cgit.cgi/frm2/mira/tastools.git"
	"https://forge.frm2.tum.de/cgit/cgit.cgi/frm2/mira/tlibs.git"
	"https://forge.frm2.tum.de/cgit/cgit.cgi/frm2/mira/takin-data.git"
	"https://forge.frm2.tum.de/cgit/cgit.cgi/frm2/mira/miezetools.git"
)


mkdir -v -p ill
pushd ill
for repo in ${REPOS_ILL[@]}; do
	echo "Cloning ${repo}..."
	git clone -v --recurse-submodules ${repo}
	echo -e "\n"
done
popd


mkdir -v -p priv
pushd priv
for repo in ${REPOS_PRIVATE[@]}; do
	echo "Cloning ${repo}..."
	git clone -v --recurse-submodules ${repo}
	echo -e "\n"
done
popd


mkdir -v -p frm
pushd frm
for repo in ${REPOS_FRM[@]}; do
	echo "Cloning ${repo}..."
	git clone -v --recurse-submodules ${repo}
	echo -e "\n"
done
popd

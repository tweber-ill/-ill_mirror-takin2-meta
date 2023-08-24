#!/bin/bash
#
# builds minuit
# @author Tobias Weber <tweber@ill.fr>
# @date sep-2020
# @license GPLv2
#
# ----------------------------------------------------------------------------
# Takin (inelastic neutron scattering software package)
# Copyright (C) 2017-2021  Tobias WEBER (Institut Laue-Langevin (ILL),
#                          Grenoble, France).
# Copyright (C) 2013-2017  Tobias WEBER (Technische Universitaet Muenchen
#                          (TUM), Garching, Germany).
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
# ----------------------------------------------------------------------------
#

NUM_CORES=$(nproc)


BUILD_FOR_MINGW=0
if [ "$1" == "--mingw" ]; then
	BUILD_FOR_MINGW=1
fi


MINUIT_REMOTE=https://codeload.github.com/root-project/root/zip/refs/heads/latest-stable
MINUIT_LOCAL=${MINUIT_REMOTE##*[/\\]}


rm -f "${MINUIT_LOCAL}"


if ! wget ${MINUIT_REMOTE}; then
	echo -e "Could not download ${MINUIT_REMOTE}."
	exit -1
fi


unzip "${MINUIT_LOCAL}"


#cd root-master/math/minuit2/
cd root-latest-stable/math/minuit2/
mkdir build && cd build


if [ $BUILD_FOR_MINGW -ne 0 ]; then
	mingw64-cmake -DCMAKE_BUILD_TYPE=Release ..
	mingw64-make -j${NUM_CORES} && sudo mingw64-make install
else
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make -j${NUM_CORES} && sudo make install
fi

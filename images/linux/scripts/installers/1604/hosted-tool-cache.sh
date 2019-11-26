#!/bin/bash
################################################################################
##  File:  hosted-tool-cache.sh
##  Team:  CI-Platform
##  Desc:  Downloads and installs hosted tools cache
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

# Fail out if any setups fail
set -e

# Download hosted tool cache
AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
echo "AGENT_TOOLSDIRECTORY=$AGENT_TOOLSDIRECTORY" | tee -a /etc/environment
azcopy --recursive \
       --source https://vstsagenttools.blob.core.windows.net/tools/hostedtoolcache/linux \
       --destination $AGENT_TOOLSDIRECTORY

# Remove Boost toolcache folder manually because azcopy doesn't support exclude flag
rm -rf $AGENT_TOOLSDIRECTORY/Boost/*

# Install tools from hosted tool cache
original_directory=$PWD
setups=$(find $AGENT_TOOLSDIRECTORY -name setup.sh)
for setup in $setups; do
	chmod +x $setup;
	cd $(dirname $setup);
	./$(basename $setup);
	cd $original_directory;
done;

chmod -R 777 $AGENT_TOOLSDIRECTORY

echo "Installing npm-toolcache..."
BOOST_VERSIONS=( '1.69' )

for BOOST_VERSION in ${BOOST_VERSIONS[@]}; do
    echo "Install boost-$BOOST_VERSION"
    npm install toolcache-boost-ubuntu-1604-x64@$BOOST_VERSION --registry=https://buildcanary.pkgs.visualstudio.com/PipelineCanary/_packaging/hostedtoolcache/npm/registry/
done;

DocumentInstalledItem "Python (available through the [Use Python Version](https://go.microsoft.com/fwlink/?linkid=871498) task)"
pythons=$(ls $AGENT_TOOLSDIRECTORY/Python)
for python in $pythons; do
	DocumentInstalledItemIndent "Python $python"
done;

DocumentInstalledItem "Ruby (available through the [Use Ruby Version](https://go.microsoft.com/fwlink/?linkid=2005989) task)"
rubys=$(ls $AGENT_TOOLSDIRECTORY/Ruby)
for ruby in $rubys; do
	DocumentInstalledItemIndent "Ruby $ruby"
done;

#!/bin/bash

set -e 
# Install chef ?
[[ `which chef-solo` ]] || curl -L https://www.opscode.com/chef/install.sh | sudo bash

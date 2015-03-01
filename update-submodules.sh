#!/bin/bash
git submodule foreach git pull origin master
git add bundle/.
git commit -m "Updated submodules"

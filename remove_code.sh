#!/usr/bin/bash
# This is the script which remove all the unnecessary package in the environment to run the model

# pip freeze | xargs pip uninstall -y
pip freeze > requirements_temp.txt
target_commit="c811cfc3b9792f264f9b325baa56c43218b9f2c6" 
# the commit have all the code needed to run the model 
git checkout $target_commit
pip install -r requirements.txt
git checkout - 
pip uninstall -y -r requirements_temp.txt
pip install -r requirements_temp.txt

# delete the temp file
rm requirements_temp.txt

echo "Done"
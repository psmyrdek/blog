#!/bin/bash

hugo -t hugo-paper

git add .

git commit -m "New version deployed"

git push -u origin master
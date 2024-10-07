#!/usr/bin/env bash

# $1 is the file path from Telescope
# 2aecdee Steve McKinney 3 weeks ago Lorem ipsum dolor sit amet
# git log --pretty="format:%h %cn %cr %s" --follow $1 >/tmp/gitlog && cat /tmp/gitlog
git log --pretty=oneline --follow $1 >/tmp/gitlog && cat /tmp/gitlog

#!/bin/bash
set -e

PWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo $PWD

rm -rf $PWD/05_result/*
rm -rf $PWD/log/*

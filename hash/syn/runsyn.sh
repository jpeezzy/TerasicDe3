#!/bin/bash

source /ecelib/linware/synopsys15/env/dc.csh
setenv design `pwd`/design
dc_shell-t -f synth.tcl

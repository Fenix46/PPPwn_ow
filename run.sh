#!/bin/sh

pppwn --interface br-lan --fw 900 --stage1 "/root/offsets/stage1_900.bin" --stage2 "/root/offsets/stage2_900.bin" --auto-retry

# Speedtests
I was upgrading my networking setup: first switching from a shitty old router
to a proper ethernet switch, then upgrading to a cat6 cable, then realizing my
house was wired with cat5 and buying a wifi card, then testing that wifi card
with various antenna configurations.

This repository contains the code I used to test everything along the way to
see what affect my upgrades had on performance. 

# Files
- `repeated-speedtest.sh` is used to run speedtest several times on a few
  different servers to get a reasonable idea of the speeds I can expect.
- `visualize-speedtest.jl` is used to visualize the data gathered into a chart
  that I can easily interpret.
- `plots/result2020-05-18_1920.png` is the best plot I got, comparing each
  different setup

# Test Information
These tests were run to compare how my speeds changed as I incrementally
upgraded the equipment in my desktop. Below are descriptions of the equipment
changes. Each file referenced in the headings below can be found in the `data/`
directory.

## 00-no-upgrades.csv
This was the initial test, the control. My computer was plugged into an old
router that we were using as a switch, and the router was plugged into a wall
jack that led back to the main router. The router we were using as a switch was
one of those "family" routers that filter content and I was locked out of the
admin panel so I couldn't properly configure it.

## 01-new-switch.csv
Replaced the router that was acting as a switch with a TP-Link TL-SG105, a
5-port gigabit switch.

## 02-new-cable.csv
Replaced cat 5e cable with cat 6 cable.

## 03-wifi-no-antennae.csv
Added a wifi card, the TP-Link Archer TX3000E AX3000 PCIe card. I didn't 
attach any antennae for this test.

## 031-wifi-short-antennae.csv
Added the included antennae directly to the wireless card, so it was tucked 
away behind my computer (presumably with poor reception)

## 05-wifi-external-antennae.csv
For this test, I used the included antennae extension thing to put the 
antennae on top of my case.


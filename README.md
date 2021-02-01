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
- `data/README.md` explains exactly what my equipment was in each test


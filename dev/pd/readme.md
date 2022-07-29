# branch=pd

* for source experiments (parameters, etc. to change core gen), and other source updates for PD

### minimize cache/queues/etc. for eFabless

* the parameters were likely not tested much, and may have dependencies, etc.
* see which ones can change and still compile/run simple test; document dependencies

### test OpenROAD tools

1. try unit/sub-unit synthesis and static timing, using blackbox arrays amd estimated wiring for some pdk (nangate45?)

   * equivalent to a CI timing script to catch functional changes that break timing

* what are the OR steps to do this?  can this be done with only yosys script?s

   * floorplan - unbounded?
   * pins - no placement if no bounds, and relaxed i/o assertions?
   * tap cells/power dist/etc. - not needed (account for in estimated wiring?)
   * clock tree synthesis - no (assume ideal clocks + fudge)
   * iterate
      * placement
      * cap/slew/fo checks
      * setup/hold

* are results consistent with expected cycle time?

### Yosys

* blackbox arrays

```
cd synth
yosys -s synth.yo
```

### OpenROAD

* https://openroad.readthedocs.io/en/latest/user/BuildWithDocker.html

* yosys, OpenROAD, LSOracle

```
git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
cd OpenROAD-flow-scripts
./build_openroad.sh [--threads n]
```

```
docker run -it -u $(id -u ${USER}):$(id -g ${USER}) -v $(pwd)/flow/platforms:/OpenROAD-flow-scripts/flow/platforms:ro openroad/flow-scripts
```


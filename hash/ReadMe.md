__112L HDL Simulation/Synthesis GUIDE__

So you want to work on a processor? 
Here's how you do it 

__1. Compiling__
run these commands to start questasim: 
`source setup.csh
source pre_compile.csh
source sim/run` keep in mind you can also go inside here and change parameters to vsim to simulate the behavioral memory
to view the simulation please run: 
run `vsim -64 -gui -view waveform.wlf`

__2. Fixing The ALU__ 
Basically, The instructions missing were branch, and some commands were missing from the alucontroller. We have to fix that now.
Not only that, we'll need flags for the ALU controller e.g.
The CPSR contains the following ALU status flags:

N: Set when the result of the operation was Negative.

Z: Set when the result of the operation was Zero.

C: Set when the operation resulted in a Carry.

V: Set when the operation caused oVerflow.

Heres my number system for the ALU
__2. Synthesis__

__3.REPORT__


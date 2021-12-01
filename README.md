# Mealy-Moore-Comparator-Verilog

Mealy and Moore implementations of an n-bit comparator in verilog. 
How it works works: at each cycle we take in two seperate singular bits a and b, and compare them with respect to the previous state, then we set "equal" or "less" or "greater" in the following manner:

![Truth Table](https://user-images.githubusercontent.com/54000044/144196003-6b22d4af-43af-47c7-a61b-da96179ce189.PNG)

this process continues until reset is active, which signals that a new group of bits are incoming. 

The Mealy FSM looks like the following (note that for example 10 means a=1 and b=0): 

![Mealy FSM](https://user-images.githubusercontent.com/54000044/144197742-160b17b5-878e-4d37-b8ee-a201a09c3d0a.jpg)

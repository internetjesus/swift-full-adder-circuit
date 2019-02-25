# swift-full-adder-circuit
Full-adder implementation in Swift with OR, XOR &amp; AND gates

## About
This full-adder implementation parses a .txt circuit file that describes all nodes along with its edges. 

Circuit input files must contain a description of all the nodes:

A:      INPUT_HIGH;
B:      INPUT_HIGH;
Cin:    INPUT_LOW;
Cout:   PROBE;
S:      PROBE;
NODE1:  OR;
NODE2:  AND;
NODE3:  AND;
NODE4:  NOT;
NODE5:  AND;
NODE6:  OR;
NODE7:  NOT;
NODE8:  NOT;
NODE9:  AND;
NODE10: AND;
NODE11: OR;

And then a description of all the node edges:

Cin:    NODE3,NODE7,NODE10;
A:      NODE1,NODE2;
B:      NODE1,NODE2;
NODE1:  NODE3,NODE5;
NODE2:  NODE4,NODE6;
NODE3:  NODE6;
NODE4:  NODE5;
NODE5:  NODE8,NODE9;
NODE6:  Cout;
NODE7:  NODE9;
NODE8:  NODE10;
NODE9:  NODE11;
NODE10: NODE11;
NODE11: S;

## For more reading
https://en.wikipedia.org/wiki/Adder_(electronics)#Full_adder

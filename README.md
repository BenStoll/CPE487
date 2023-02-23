# CPE487
## Digital System Design Workbooks
The following documents were started within OverLeaf and transferred to TeXnicc using MikTeX. The reports should be lain out as follows
1.  Create a new Overleaf project, names CPE_487_Labs.
2.  In the introduction chapter add a small bio of all the team members.
3.  Add six different .tex files named: xyzLab1, xyzLab2, ... xyzLab6, where xyz is the namespace you use for your project.  Default is "man" from manual
4.  Implement each of the 6 labs listed here:

https://github.com/kevinwlu/dsd/tree/master/Nexys-A7Links to an external site.

5.  For each lab, include the following sections (with \section{}):
a) Lessons Learned -- describe what you've learned from the lab
b) Schematics and Block Diagrams -- include drawings that describe the electronics and block diagrams of what's been implemented in the lab.
c) VHDL Architecture -- describe any new ideas you've learned from the lab, and include any VHDL code you found useful.
d) VHDL Models -- Describe the following models you've encountered in the lab:
Data-flow
• A data-flow style architecture specifies a circuit as a concurrent represen- tation of the flow of
data through the circuit. In the data-flow approach, circuits are described by showing the input
and output relationships be- tween the various built-in components of the VHDL language.
Structural
• The term structural modeling is the terminology that VHDL uses for modular design. The VHDL
modular design approach directly supports hierarchical design which is essentially employed
when attempting to understand complex digital designs.
Behavioral
• The behavioral style models how the circuit outputs will react to the circuit inputs. Whereas in
data-flow modeling you somewhat need to have a feel for the underlying logic in the circuit,
behavioral models provide you with various tools to describe how the circuit will behave and
leave the implementation details up to the synthesis tool.
• The heart of the behavioral style architecture is the process statement.
e) VHDL Component Reuse -- describe any component reuse
f) VHDL Digital Circuits --
g) State Machines
h) Testing -- include any test-bench diagrams, code, and/or pictures of the working board.

6.  Update Table I, which contains the history of updates.
7.  Submit the full Lab PDF report.

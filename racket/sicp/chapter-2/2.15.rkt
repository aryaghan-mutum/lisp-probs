#lang racket

#| Eva Lu Ator, another user, has also noticed the different intervals computed by
different but algebraically equivalent expressions. She says that a formula to compute with intervals
using Alyssa’s system will produce tighter error bounds if it can be written in such a form that no
variable that represents an uncertain number is repeated. Thus, she says, par2 is a ‘‘better’’ program
for parallel resistances than par1. Is she right? Why? |#

;;Ans:

; 'par2' generates tighter error bound compared to 'par1'. However this doesn't
;  conclude 'par2' is 'better' than 'par1'.
; The difference of errors is due to the flaw of the interval arithmatic system. A system must produce the same output for the two procedures.
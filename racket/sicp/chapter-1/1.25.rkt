#lang racket

#| Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod.
After all, she says, since we already know how to compute exponentials, we could have simply written

Is she correct? Would this procedure serve as well for our fast prime tester? Explain. |#

(define (expmod base exp m)
    (remainder (fast-expt base exp m)))


;Ans: This procedure would produce a very large number, and will slow the procedure.

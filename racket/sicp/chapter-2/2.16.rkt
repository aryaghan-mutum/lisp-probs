#lang racket

#| Explain, in general, why equivalent algebraic expressions may lead to different
answers. Can you devise an interval-arithmetic package that does not have this shortcoming, or is this
task impossible? (Warning: This problem is very difficult.) |#

;; Ans:
; It is called the 'Dependency Problem of Interval Arithmatic'. Please refer:
; http://en.wikipedia.org/wiki/Interval_arithmetic#Dependency_problem
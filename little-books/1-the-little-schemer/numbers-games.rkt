;; Base definitions

(define (add1 n)
  (+ n 1))

(define (sub1 n)
  (- n 1))

;; pp. 60
;; Define o+ in terms of zero? add1 and sub1
;; This procedure need only worry about positive
;; integers for the moment
(define (o+ a b)
  (cond ((zero? b) a)
        (else (add1 (o+ a (sub1 b))))))

(o+ 46 12)
;; => 58


;; pp. 61 o- also doesn't work with negative numbers
(define (o- a b)
  (cond ((zero? b) a)
        (else (sub1 (o- a (sub1 b))))))

(o- 4 2)
;; => 2

;; Recursive function equivalent of (apply + tup) 
(define (addtup tup)
  (cond ((null? tup) 0)
        (else (+ (car tup) (addtup (cdr tup))))))

(addtup '(1 2 3 4 5))

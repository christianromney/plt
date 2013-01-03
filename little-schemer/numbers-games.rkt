;; Base definitions

(define (add1 n)
  (+ n 1))

(define (sub1 n)
  (- n 1))

;; pp. 60
;; Define plus in terms of zero? add1 and sub1
;; This procedure need only worry about positive
;; integers for the moment
(define (plus a b)
  (cond ((= a 0) b)
        (else (plus (sub1 a) (add1 b)))))

(plus 46 12)
;; => 58


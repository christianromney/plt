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
  (cond ((zero? a) b)
        (else (plus (sub1 a) (add1 b)))))

(o+ 46 12)
;; => 58


#lang racket

(define mappend
  (λ (f lst)
    (apply append
           (map f lst))))

; int => list(int)
(define half-double
  (λ (n)
    (list (/ n 2) (* n 2))))

(define inc-int
  (λ (n)
    (list (+ 5 n) (+ 10 n))))

(define plus-minus3 
  (λ (n)
    (list (+ n 3) (- n 3))))

(define m-bind
  (λ (lits fn)
    (mappend fn lits)))

; (m-bind (half-double 8) inc-int)

(define m-result
  list)

(m-bind 
 (m-bind 
  (m-bind 
   (m-result 8) 
   half-double) 
  inc-int) 
 plus-minus3)


(m-bind (m-result 8) m-result)

;; Hygenic macro definition of let* 
;; The goal:
(let* [(x 1)
       (y (+ 2 x))]
  (set! x 2)
  (+ x y))

;; Our implementation:

(define-syntax met ;; the name of the macro/special form to create
  (syntax-rules () ;; additional related keywords would go in the list here think cond / else
    [(_ ((var exp) ...) body body1 ...)  ;; the pattern to match _ is replaced with the name above ... means 0 or more
     ((lambda (var ...) body body1 ...) exp ...)])) ;; the replacement pattern note how we split var/exp

(define-syntax met*
  (syntax-rules ()    
    [(_ ((var exp) (var1 exp1) ...) body body1 ...)     
     (met ((var exp))
         (met ((var1 exp1) ...)
            body body1 ...))]))
    
(met* [(x 1)
       (y (+ 2 x))]
    (+ x 2))
       

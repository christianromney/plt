#lang racket
   
;; infinite sequences are possible with delays 
(define fibonacci-seq
  (let next ([a 0]
             [b 1])
    (delay (cons a (next b (+ a b))))))

(define scar
  (λ (s)
    (car (force s))))

(define scdr
  (λ (s)
    (cdr (force s))))

(define snth
  (λ (s n)
    (cond [(eq? 0 n) (scar s)] 
          [else (snth (scdr s) (- n 1))])))

(snth fibonacci-seq 280)





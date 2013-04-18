#lang racket

;; some fun with continuations
(define product
  (λ (lst)
    (let/cc done ;; non-local exit
      (cond [(null? lst) 0]
            [(= 0 (car lst)) (done 0)]
            [(null? (cdr lst)) (car lst)]
            [else (* (car lst)
                     (product (cdr lst)))]))))

(product '(1 2 3 0 4 5))
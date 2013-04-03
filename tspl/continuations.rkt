#lang racket

;; some fun with continuations
(define product
  (λ (lst)
    (let/cc done ;; non-local exit
      (cond [(null? lst) 0]
            [(eq? 0 (car lst)) (done 0)]
            [(null? (cdr lst)) (car lst)]
            [else (* (car lst)
                     (product (cdr lst)))]))))
;; -*- mode: racket; -*-
#lang pie

(claim first-of-one
  (Π ((E U))
     (-> (Vec E 1)
         E)))

(define first-of-one
  (λ (E)
    (λ (v)
      (head v))))

(check-same
 Nat
 5
 (first-of-one Nat (vec:: 5 vecnil)))

;; -*- mode: racket; -*-
#lang pie
;; the iterative step just needs to increment by 1
(claim step+ (-> Nat Nat))
(define step+
  (lambda (n-1)
    (add1 n-1)))

;; add two natural numbers by incrementing j as we decrement n
;; returns j when n is zero
;;
;; it would seem like we should be able to pass add1 where we
;; supply step+, but add1 is a constructor and cannot be used
;; as the step function in the eliminator iter-Nat.
(claim + (-> Nat Nat Nat))
(define +
  (lambda (n j)
    (iter-Nat n
      j
      step+)))

;; the recursive step must add the current N to the recursive result
(claim step-gauss (-> Nat Nat Nat))
(define step-gauss
  (lambda (n-1 gauss-n-1)
    (+ (add1 n-1) gauss-n-1)))

;; sum of all the natural numbers from 0..n
(claim gauss (-> Nat Nat))
(define gauss
  (lambda (n)
    (rec-Nat n
      0
      step-gauss)))

;; multiplication (uses currying)XSXg
(claim step* (-> Nat Nat Nat Nat))
(define step*
  (λ (j)
    (λ (n-1 n-1*)
      (+ j n-1*))))

(claim * (-> Nat Nat Nat))
(define *
  (λ (n j)
    (rec-Nat n
      0
      (step* j))))

;; final chapter 3 exercise left to the reader (factorial)
(claim step! (-> Nat Nat Nat))
(define step!
  (λ (n-1 n-1!)
    (* (add1 n-1) n-1!)))

(claim ! (-> Nat Nat))
(define !
  (λ (n)
    (rec-Nat n
      1
      step!)))

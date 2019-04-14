#lang pie

(claim step-list-of-peas
  (-> Nat (List Atom)
      (List Atom)))

(define step-list-of-peas
  (lambda (k-1 answer-k-1)
    (:: 'pea answer-k-1)))

(claim list-of-peas
  (-> Nat (List Atom)))

(define list-of-peas
  (lambda (k)
    (rec-Nat k
      (the (List Atom) nil)
      step-list-of-peas)))

(check-same (List Atom)
  (:: 'pea nil)
  (list-of-peas 1))

(check-same (List Atom)
  (the (List Atom) nil)
  (list-of-peas 0))

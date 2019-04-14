#lang pie

(claim vec-of-peas
  (Π ((k Nat))
     (Vec Atom k)))

(define vec-of-peas
  (λ (k)
    (rec-Nat k
      (the (Vec Atom zero) vecnil)
      (λ (k-1 ans-k-1)
        (vec:: 'pea ans-k-1)))))

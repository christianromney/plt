#lang pie

(claim motive-peas
  (Π ((l Nat))
     U))

(define motive-peas
  (λ (l)
    (Vec Atom l)))

(claim step-peas
  (Π ((l-1 Nat))
     (-> (motive-peas l-1)
         (motive-peas (add1 l-1)))))

(define step-peas
  (λ (l-1)
    (λ (answer-l-1)
      (vec:: 'pea answer-l-1))))

(claim peas
  (Π ((l Nat))
     (Vec Atom l)))

(define peas
  (λ (l)
    (ind-Nat l
      motive-peas
      vecnil
      step-peas)))

(check-same
 (Vec Atom 5)
 (the (Vec Atom 5)
      (vec:: 'pea
             (vec:: 'pea
                    (vec:: 'pea
                           (vec:: 'pea
                                  (vec:: 'pea vecnil))))))
 (peas 5))

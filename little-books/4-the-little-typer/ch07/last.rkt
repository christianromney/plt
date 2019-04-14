(claim motive-last
  (-> U Nat
      U))

(define motive-last
  (λ (E k)
    (-> (Vec E (add1 k))
        E)))

(claim base-last
  (Π ((E U))
     (-> (Vec E (add1 zero))
         E)))

(define base-last
  (λ (E)
    (λ (es)
      (head es))))

(claim step-last
  (Π ((E U)
      (k Nat))
     (-> (-> (Vec E (add1 k)) E)
         (-> (Vec E (add1 (add1 k)))
             E))))

(define step-last
  (λ (E)
    (λ (n-1 last-of-n-1)
      (λ (es)
        (last-of-n-1 (tail es))))))

(claim last
  (Π ((E U)
      (k Nat))
     (-> (Vec E (add1 k))
         E)))

(define last
  (λ (E k)
    (λ (es)
      ((ind-Nat k
         (motive-last E)
         (base-last E)
         (step-last E)) es))))

(check-same
 Atom
 'Done
 (last Atom 0 (vec:: 'Done vecnil)))

(check-same
 Atom
 'Coming
 (last Atom 2 (vec:: 'Winter (vec:: 'Is (vec:: 'Coming  vecnil)))))

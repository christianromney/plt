#lang pie

(claim motive-drop-last
  (-> U Nat
      U))

(define motive-drop-last
  (λ (E k)
    (-> (Vec E (add1 k))
        (Vec E k))))

(claim base-drop-last
  (Π ((E U))
     (motive-drop-last E zero)))

(define base-drop-last
  (λ (E) ;; for the Π expression type parameter
    (λ (es) ;; a function accepting a vector of one
      vecnil))) ;; returning a vector of zero

(claim step-drop-last
  (Π ((E U)
      (k Nat))
     (-> (motive-drop-last E k)
         (motive-drop-last E (add1 k)))))

(define step-drop-last
  (λ (E)
    (λ (k-1 result-k-1)
      (λ (es)
        (vec:: (head es)
               (result-k-1
                (tail es)))))))

(claim drop-last
  (Π ((E U)
      (k Nat))
     (motive-drop-last E k)))

(define drop-last
  (λ (E k)
    (ind-Nat k
      (motive-drop-last E)
      (base-drop-last E)
      (step-drop-last E))))

(check-same
 (Vec Atom 2)
 (vec:: 'a (vec:: 'b vecnil))
 (drop-last Atom 2 (vec:: 'a (vec:: 'b (vec:: 'c vecnil)))))

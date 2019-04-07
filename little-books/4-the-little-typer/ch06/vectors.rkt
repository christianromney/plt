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
 (the Nat 5)
 (first-of-one Nat (vec:: 5 vecnil)))

(claim first-of-two
  (Π ((E U))
     (-> (Vec E 2)
         E)))

(define first-of-two
  (λ (E)
    (λ (v)
      (head v))))

(check-same
 Nat
 (the Nat 5)
 (first-of-two Nat (vec:: 5 (vec:: 6 vecnil))))

(claim first
  (Π ((E U)
      (l Nat))
     (-> (Vec E (add1 l))
         E)))

(define first
  (λ (E l)
    (λ (v)
      (head v))))

(check-same
 Nat
 (the Nat 2)
 (first Nat 0 (vec:: 2 vecnil)))

(claim rest
  (Π ((E U)
      (l Nat))
     (-> (Vec E (add1 l))
         (Vec E l))))

(define rest
  (λ (E l)
    (λ (v)
      (tail v))))

(check-same
 (Vec Nat 1)
 (the (Vec Nat 1) (vec:: 2 vecnil))
 (rest Nat 1 (vec:: 1 (vec:: 2 vecnil))))

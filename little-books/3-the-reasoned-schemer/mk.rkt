#lang racket

;; Github package resolution:
;; raco pkg install github://github.com/christianromney/Racket-miniKanren/master

(require miniKanren/mk)

;; Sugar
(define s# succeed)
(define u# fail)
(define else# succeed)

;; Definitions
(define nullo 
  (lambda [v]
    (== '() v)))

(define conso 
  (lambda [a d o]
    (== (cons a d) o)))

(define caro 
  (lambda [l v]
    (fresh [x]
      (conso v x l))))
           
(define cdro 
  (lambda [l v]
    (fresh [x]
      (conso x v l))))

(define pairo 
  (lambda [p]
    (fresh [a b]
      (conso a b p))))

(define list? 
  (lambda [l]
    (cond 
      ((null? l) #t)
      ((pair? l) (list? (cdr l)))
      (else #f))))

(define listo 
  (lambda [l]
    (conde 
      ((nullo l) s#)
      ((pairo l)
        (fresh [x]
          (cdro l x)
          (listo x)))
      (u#))))

;(twinso '(a a)) => s#
(define twinso
  (lambda [s]
    (fresh [x]
      (== `(,x ,x) s))))


(define listofo
  (lambda [predo l]
    (conde 
      ((nullo l) s#)
      ((fresh [a]
        (caro l a)
        (predo a))
       (fresh [d]
        (cdro l d)
        (listofo predo d)))
      (u#))))

; (loto '((foo foo) (egg egg))) => s#
(define loto
  (lambda [l]
    (listofo twinso l)))

;(define eq-car? 
;  (lambda [l x]
;    (eq? (car l) x)))
;
;(define member?
;  (lambda [x l]
;    (cond ((null? l) #f)
;          ((eq-car? l x) #t)
;          (else 
;            (member? x (cdr l))))))

(define eq-caro
  (lambda [l x]
    (caro l x)))

(define membero
  (lambda [x l]
    (conde 
      ((nullo l) u#)
      ((eq-caro l x) s#)
      (else#
        (fresh [d]
          (cdro l d)
          (membero x d))))))
    
(define pmembero
  (lambda [x l]
    (conde 
      ((nullo l) u#)
      ((eq-caro l x) (cdro l '()))
      ((eq-caro l x) 
       (fresh [a d]
         (cdro l `(,a . ,d))))
      (else# 
        (fresh [d]
          (cdro l d)
          (pmembero x d))))))

;(run* [q]
;  (pmembero 'tofu '(a b tofu d tofu))
;  (== #t q))

(define first-value
  (lambda [l]
    (run 1 [y]
      (membero y l))))

(define identityo
  (lambda [l]
    (run* [q]
      (membero q l))))

;; WTF? This is verbatim from the book.
(define memberrevo
  (lambda [x l]
    (conde 
      ((nullo l) u#)
      (s# 
        (fresh [d]
          (cdro l d)
          (memberrevo x d)))
      (else#
        (eq-caro l x)))))

;; 3.98 Even better, this is from the official miniKanren repository! WTF????
(define memberrevo2
  (lambda (x l)
    (conde
      ((nullo l) fail)
      (succeed
        (fresh (d)
          (cdro l d)
          (memberrevo2 x d)))
      (else# (eq-caro l x)))))


; Expected: '(fagioli e pasta)
; Actual:   '(pasta e fagioli)
(run* [x]
  (memberrevo2 x '(pasta e fagioli))) 
      

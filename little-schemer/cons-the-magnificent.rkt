;; pp. 53
;; Write the function multirember which gives
;; as its final answer lat with all occurences
;; of a removed.
;;
;; Signature: (define (multirember a lat) (...))

(define (multirember a lat)
  (cond ((null? lat) '())
        ((eq? a (car lat)) (multirember a (cdr lat)))
        (else (cons (car lat)
                    (multirember a (cdr lat))))))

(multirember 'cup '(coffee cup tea cup and hick cup))

;; => '(coffee tea and hick)

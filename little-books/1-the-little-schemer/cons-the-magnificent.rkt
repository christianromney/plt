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


;; pp. 56
;; Write the function multiinsertR
;; Finds every occurrence of 'old' in 'lat' and
;; adds 'new' to the right of 'old'
(define (multiinsertR new old lat)
  (cond ((null? lat) '())
        ((eq? old (car lat)) (cons old
                                   (cons new
                                         (multiinsertR new old (cdr lat)))))
        (else (cons (car lat)
                    (multiinsertR new old (cdr lat))))))

(multiinsertR 'bad 'big '(big girls like big men))
;; => '(big bad girls like big bad men)


;; pp.57
;; Write the function multiinsertL
;; Similar to multiinsertR, only new is inserted
;; before old instead of after it
(define (multiinsertL new old lat)
  (cond ((null? lat) '())
        ((eq? old (car lat)) (cons new (cons old (multiinsertL new old (cdr lat)))))
        (else (cons (car lat) (multiinsertL new old (cdr lat))))))

(multiinsertL 'smelly 'sea '(sally sells sea shells by the sea shore))
;; => '(sally sells smelly sea shells by the smelly sea shore)


;; pp. 57
;; Write the function multisubst
;; The function replaces all occurrences of 'old'
;; within 'lat' with the 'new' value
(define (multisubst new old lat)
  (cond ((null? lat) '())
        ((eq? old (car lat)) (cons new (multisubst new old (cdr lat))))
        (else (cons (car lat) (multisubst new old (cdr lat))))))

(multisubst 'blue 'red '(red bonnet red bonnet))
;; => '(blue bonnet blue bonnet)

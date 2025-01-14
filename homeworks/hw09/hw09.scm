(define (ascending? asc-lst)
  (
    cond 
    ((null? asc-lst) #t)
    ((null? (cdr asc-lst)) #t)
    ((<= (car asc-lst) (car (cdr asc-lst))) (ascending? (cdr asc-lst)))
    (else #f)
  )
)
(define (my-filter pred s) 
    (cond
        ((null? s) '())
        ((pred (car s)) (cons (car s) (my-filter pred (cdr s))))
        (else (my-filter pred (cdr s)))
    )
)

(define (interleave lst1 lst2) 
    (cond
        ((null? lst1) lst2)
        ((null? lst2) lst1)
        (else (append (list (car lst1) (car lst2)) (interleave (cdr lst1) (cdr lst2))))
    )
)

(define (no-repeats lst)
    (
        cond
        ((null? lst) '())
        (else 
            (cons (car lst)
                (no-repeats 
                    (   my-filter   
                        (lambda (x) (not (= x (car lst))))
                        (cdr lst))
                )
            )
        )
    )
)

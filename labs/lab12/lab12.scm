(define (substitute s old new)
  (cond
    ((null? s) '()) ; Base case: if s is empty, return an empty list
    ((pair? (car s)) ; If the first element of s is a pair
     (cons (substitute (car s) old new) (substitute (cdr s) old new))) ; Recursively substitute in the car and cdr
    ((equal? (car s) old) ; If the first element is equal to the old word
     (cons new (substitute (cdr s) old new))) ; Replace it with the new word and continue recursively
    (else ; Otherwise
     (cons (car s) (substitute (cdr s) old new))))) ; Keep the current element and continue recursively

; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s)
      nil
      (cons (fn (car s)) (map fn (cdr s)))))

(define (filter fn s)
  (cond 
    ((null? s)    nil)
    ((fn (car s)) (cons (car s) (filter fn (cdr s))))
    (else         (filter fn (cdr s)))))

(define (count x s) 
  (cond
      ((null? s) 0)
      ((pair? (car s))  (+ (count x (car s)) (count x (cdr s))))
      ((equal? x (car s)) (+ 1 (count x (cdr s))))
      (else (count x (cdr s)))
  )
)

(define (unique s) 
  (cond
    ((null? s) '())                         
    ((pair? (car s))                        
     (cons (unique (car s)) (unique (cdr s)))) 
    (else                                  
     (let ((rest (filter (lambda (x) (not (equal? x (car s)))) (cdr s)))) 
       (cons (car s) (unique rest))))       
  )
)

(define (tally names) 
  (map (lambda (name) (list name (count name names)))
       (unique names))
)

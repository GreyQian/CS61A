(define (over-or-under num1 num2) 
  (
    cond
    ((< num1 num2) -1)
    ((= num1 num2) 0)
    (else 1)
  )
)

(define (make-adder num) 
  (
    define (helper inc) (+ num inc)
  )
  helper
)

(define (composed f g) 
  (
    define (helper x) (f (g x))
  )
  helper
)

(define (repeat f n) 
  (lambda (x)
    (define (apply-f n x)
      (if (= n 0)
          x
          (apply-f (- n 1) (f x))))
    (apply-f n x))
)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 
  (
    if (= (min a b) 0)
    (max a b)
    (gcd (min a b) (modulo (max a b) (min a b)))
  )
)

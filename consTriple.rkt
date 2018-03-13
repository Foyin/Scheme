;a
(define (special-cons x y)
		(lambda (m) (m x y)))

(define (special-car z)
  (z (lambda (x y) x)))

(define (special-cdr z)
  (z (lambda (x y) y)))

(special-car (special-cons 1 2));output: 1
(special-cdr (special-cons 1 2));ouput: 2

;b
(define (triple x y z)
		(lambda (m) (m x y z)))

(define (first z)
  (z (lambda (x y z) x)))

(define (second z)
  (z (lambda (x y z) y)))

(define (third z)
  (z (lambda (x y z) z)))

(first (triple 1 2 3));output: 1
(second (triple 1 2 3));output: 2
(third (triple 1 2 3));output: 3
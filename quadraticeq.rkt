(define (quadratic a b c)

  (define (square x) (* x x))
  (define (negate x) (* -1 x))
  
  (define (discriminant a b c)
    (- (square b) (* 4 a c)))

  (define (quad a b c sign)
  (if (or (<= (discriminant a b c) 0) (= a 0))
      #f
      (/ (sign (negate b) (sqrt (discriminant a b c))) (* 2 a))))
 
  (define (res) (cons (quad a b c +) (quad a b c +)))
  
  (res))


(quadratic 1 5 5)

;if discriminant = 0 or a = 0 or discriminant < 0, return #f
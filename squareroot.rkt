(define (mysqrt x)
  (define (square y)(* y y))

  (define (average x y)
    (/ (+ x y) 2))
  
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))

  (define (improve guess)
    (average guess ( / x guess)))

  (define (sqrt-iteration guess)
    (if (good-enough? guess)
        guess
        (sqrt-iteration (improve guess))))

  (sqrt-iteration 1.0))

(mysqrt 4)
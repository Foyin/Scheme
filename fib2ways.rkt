;Foyin Ogbara 100900459
;a
(define (fib n)
    (- (* (/ 1 (sqrt 5)) (expt (/ (+ 1 (sqrt 5)) 2) n)))
    (* (/ 1 (sqrt 5)) (expt (/ (+ 1 (sqrt 5)) 2) n)))
;b
(define (fibrec n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fibrec (- n 1))
                   (fibrec (- n 2))))))
;c
(define (testfib n p)
  (define (precision)
    (if (= (- (fib n) (fibrec n)) p)
        #t
        #f))

  (precision)
    
)
;input = 15, 0 / output = #f
(testfib 15 0)
;input = 15 / output = 609.9996721309716
(fib 15)
;input = 15 / output = 610
(fibrec 15)
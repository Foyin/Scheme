(define-syntax stream-cons
    (syntax-rules ()
        ((stream-cons a b)(cons a (delay b)))))
(define the-empty-stream '())

(define-syntax delay
    (syntax-rules ()
        ((delay exp)  (lambda() exp))))
		
(define-syntax force
    (syntax-rules ()
        ((force exp)  (exp))))

(define (stream-null? stream)
    (eq? stream the-empty-stream))

(define (stream-range low high)
    (if (> low high)
        the-empty-stream
        (stream-cons low (stream-range (+ low 1) high))))

(define (range low high)
    (if (> low high)
        '()
        (cons low (range (+ low 1) high))))

(define (stream-car stream) 
    (car stream))

(define (stream-cdr stream)
    (force (cdr stream)))

;example list and finite stream
(define list (range 1 10))
(define stream (stream-range 1 10))

;a.
;i. 
(define (stream-first n str)
  (if (eqv? n 0)
      the-empty-stream
      (stream-cons (stream-car str) (stream-first (- n 1) (stream-cdr str)))))
(cons (car stream) (cdr stream))
;example output: (1 . #<procedure>)
;makes a new stream of the first n items in str

;ii.
(define (streamfromlist n lis)
  (if (eqv? n 0)
      '()
      (stream-cons (car lis) (streamfromlist (- n 1) (cdr lis)))))
(cons (car (streamfromlist 3 list)) (cdr (streamfromlist 3 list)))
;example output: (1 . #<procedure>)
;makes a stream from list lis

;iii.
(define (listfromstream n str)
  (if (eqv? n 0)
      '()
      (cons (stream-car str) (listfromstream (- n 1) (stream-cdr str)))))
(cons (car (listfromstream 3 stream)) (cdr (listfromstream 3 stream)))
;example output: (1 2 3)
;makes a list from stream str


;b
;i
(define (streamOf1s)
    (stream-cons 1 (streamOf1s)))
(define 1s (streamof1s))

(streamof1s) ;output: (1 . #<procedure>)
(force (cdr 1s)) ;output: (1 . #<procedure>)
(force (cdr (force (cdr 1s)))) ;output: (1 . #<procedure>)
;infinite stream of 1s

;ii
(define (oddstream)
  (define (stream n)
    (stream-cons n (stream (+ n 2))))
  (stream 1))

(oddstream) ;example output: (1 . #<procedure>)
(force (cdr (oddstream))) ;example output: (3 . #<procedure>)
(force (cdr (force (cdr (oddstream))))) ;example output: (5 . #<procedure>)
;infinite stream of odd
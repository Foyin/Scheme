;Creates a list of numbers between two end points a and b
(define (range a b)
    (if (= a b) (list a)
        (cons a (range (+ a 1) b))))
		
(define nums (range 1 5))

;Finds ith element in list 
(define (get-element items i)
    (if (= i 0)
        (car items)
        (get-element (cdr items) (- i 1))))

;Appends two lists together
(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1)
              (append (cdr list1) list2))))

;Scaling numbers
(define (scale-list items factor)
    (if (null? items)
        '()
        (cons (* (car items) factor)
              (scale-list (cdr items) factor))))

;Technique known as mapping over lists.
;(scale-list (list 1 2 3 4 5 ) 10) => ( 10 20 30 40 50)


;Abstracting the general idea to capture a
;common pattern expressed as a higher-order procedure
(define (map procedure items)
    (if (null? items)
        '()
        (cons (procedure (car items))
              (map procedure (cdr items)))))

;(map abs (list -10 2.5 -11.6 17)) => (10 2.5 11.6 17)
;(map (lambda (x) (* x x)) (list 1 2 3 4)) => ( 1 4 9 16)

;Selecting numbers from a list / filtering a list
(define (filter predicate sequence)
    (cond ((null? sequence) '())
          ((predicate (car sequence)) 
		       (cons (car sequence) 
                     (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))

;Technique known as filtering over lists.
;(filter odd? (list 1 2 3 4 5 6 7)) => ( 1 3 5 7)

;Summation of numbers in a list
(define (reduce operator initial sequence)
    (if (null? sequence)
        initial
        (operator (car sequence) 
                  (reduce operator initial (cdr sequence)))))

Technique known as reducing lists (also known as accumulating).

;(reduce + 0 (list 1 2 3 4 5)) => 15
;(reduce * 1 (list 1 2 3 4 5)) => 120




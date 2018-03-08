(define l '(0 1 2 3 4 5 6));example list
(define l2 '(a b c d e f g))

(define (last items)
  (if (null? items) 0
  (if (eqv? (cdr items) '())
      (car items)
      (last (cdr items)))))
(last l)
;returns last item in list
;input:(0 1 2 3 4 5 6) output: 6

(define (size items)
  (define (len items count)
    (if (null? items) 0
    (if (eqv? (cdr items) '())
        count
        (len (cdr items) (+ count 1)))))
  (len items 1))
(size l)
;size of list
;input:(0 1 2 3 4 5 6) output: 7

(define (count x L)
       (if (null? L) 0
            (if (eqv? (car L) x)
                (+ 1 (count x (cdr L)))
                (count x (cdr L)))))
(count 3 l)
;procedure (count x L) returns the number of instances of the value x in the list L.
;input: 3, (0 1 2 3 4 5 6) output: 1

(define (leading n list)
  (if (= 0 n)
      '()
       (cons (car list) (leading (- n 1) (cdr list)))))
(leading 3 l)
;returns list created from first n items in input list
;input: 3, (0 1 2 3 4 5 6) output: (0 1 2)

(define (after items i)
    (if (= i 0)
        items
        (after (cdr items) (- i 1))))
(after l 3)
;returns list contain all items after the item on position i of input list
;input: 3, (0 1 2 3 4 5 6) output: (3 4 5 6)

(define (splice L i A)
  (if (= i 0)
      (cons A L)
      (cons (car L) (splice (cdr L) (- i 1) A))))
;procedure (splice L i A) that splices the list A into the list L at index i
;input: (0 1 2 3 4 5 6), 3, (a b c d e f g) ouput: (0 1 2 (a b c d e f g) 3 4 5 6)
(splice l 3 l2)



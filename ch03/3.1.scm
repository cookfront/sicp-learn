(define (make-accumulator num)
	(lambda (toAdd)
		(begin (set! num (+ num toAdd)) num)))
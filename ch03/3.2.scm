(define (make-monitored f)
	(let ((count 0))
		(lambda (message)
			(cond ((eq? message 'how-many-calls?)
				   count)
			      ((eq? message 'reset-count)
			       (begin (set! count 0) count))
			      (else
			       (begin (set! count (+ count 1)) (f message)))))))
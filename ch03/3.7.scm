(define (make-joint account password new-password)
	(lambda (given-password mode)
		(if (eq? given-password new-password)
			(account password mode)
			(display "Incorrect password"))))
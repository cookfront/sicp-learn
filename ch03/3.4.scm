(define (make-account balance secret-password)
	(let ((max-times 7)
		  (try-times 0))
		(define (withdraw amount)
			(if (>= balance amount)
				(begin (set! balance (- balance amount))
					balance)
				"Insufficient funds"))
		(define (deposit amount)
			(set! balance (+ balance amount))
			balance)
		(define (call-the-cops)
			(error "call the cops"))
		(define (dispatch password mode)
			(if (eq? password secret-password)
				(begin (set! try-times 0)
					   (cond ((eq? mode 'withdraw)
					   	       withdraw)
					         ((eq? mode 'deposit)
					           deposit)
					         (else
					         	(error "Unknow request"))))
				(begin (set! try-times (+ try-times 1))
					   (if (>= try-times max-times)
					   	   (call-the-cops)
					   	   (display "Incorrect password")))))
		dispatch))
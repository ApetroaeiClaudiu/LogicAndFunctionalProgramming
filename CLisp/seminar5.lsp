;Programare recursiva in Lisp 

;1)Definiti o functie care interclaseaza fara pastrarea dublurilor , 2 liste liniare sortate
;-facut deja

;2) Definiti o functie care sterge toate apartitiile unui element intr-o lista 
(defun sterge (elem lista)
	(cond
		((null lista) nil)
		((equal elem(car lista)) (sterge (cdr lista) elem))
		((listp (car lista)) (cons (sterge (car lista) elem)(sterge (cdr lista) elem)))
		(t(cons(car lista)(sterge (cdr lista) elem)))
	)
)

;3)Construiti o lista cu pozitiile la care se gaseste elementul minim dintr-o lista liniara
;ex : (7 A B 7 5 D 9 3 10 3) = > (8 10)

(defun poz(l poz min plist)
	(cond
		((null l) plist)
		((and (numberp (car l)) (or (null min) (> min (car l)))) (poz(cdr l)(+ 1 poz) (car l)(list poz)))	
		((and (numberp min)(equal min (car l))) (poz (cdr l)(+ 1 poz) min plist))
		(t(poz (cdr l)(+ 1 poz) min plist))
	)
)

(defun da (lista val )
	(cons (car lista) (ceva (cdr lista) val 0))
)
;(1 2 3 4 5 6 7 '999')
;1 + (2 3 4 5 6 7 '1)
(defun ceva (lista v i)
	(cond 
		( (null lista ) nil)
		( (equal 0 i ) ( cons (car lista) (ceva  (cdr lista) v 1) ) )
		( (equal 1 i ) ( cons v (ceva lista v 2) ) )
		(t (cons (car lista) (ceva (cdr lista) v 0)  ) ) 
	)
)

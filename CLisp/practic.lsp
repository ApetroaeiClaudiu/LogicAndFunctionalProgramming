
;1 - creste
;2 - descreste

;10 18 29 17 11 10 29 30

;lista prim 
;18 29 17 11 10 / 10 / 1 
;17 11 10 / 29 / 2
;11 10 / 17 / 2
;1 2 3 4 3 2 9

;10 20 /11 
;20 /10 / 2


(defun munte (lista)
	(cond
		((null lista) nil)
		((> (car lista) (car (cdr lista)) ) nil)
		((equal 1 (verificare (car lista) (cdr lista) 1) ) t)
		(t nil)
	)
)

(defun verificare (primul restul index)
	(cond
		;am ajuns la lista vida fara sa fi oprit programul -> e bine 
		((null restul) 1)
		;elementul anterior e mai mic decat elementul urmator si crestem -> continuam ( 10 18 29)
		( (and (< primul (car restul) ) (equal 1 index) ) (verificare (car restul) (cdr restul) 1) )
		;gasim un alt varf de munte cand trebuia sa descrestem (18 29 17 11 20)
		( (and (< primul (car restul) ) (equal 2 index) ) 0 )
		;daca am gasit varful muntelui  spunem ca va descreste (29 27)
		( (and (> primul (car restul) ) (equal 1 index) ) (verificare (car restul) (cdr restul) 2) )
		;elementul anterior e mai mare decat elementul urmator si descrestem
		( (and (> primul (car restul) ) (equal 2 index) ) (verificare (car restul) (cdr restul) 2) )
		;elementele sunt egale
		(t 0 )
	)
)
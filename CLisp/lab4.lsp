;problema 7/L1

;a)Sa se scrie o functie care testeaza daca o lista este liniara
;lista - input 
;functia returneaza un mesaj ce reprezinta daca lista e sau nu liniara 
(defun liniaritate(lista)
	(cond
		;daca am ajuns la lista vida si nu s-a terminat programul pe clauza t, lista e liniara
		((null lista) (format nil "Este liniara"))
		;daca elementul curent este atom , reapelam functia cu restul listei
		((atom(CAR lista)) (liniaritate(CDR lista)))
		;daca elementul curent e o sublista , inseamna ca lista initiala nu este liniara
		(t (format nil "Nu este liniara"))
	)
)

;b)Definiti o functie care substituie prima aparitie a unui element intr-o lista data
;el aux lista - input
;el - element cautat in lista 
;aux - valoarea cu care substituim prima aparitie a lui el

(defun aparitie (elem listacautata)
	(cond
		((null listacautata) nil)
		((eq(car listacautata) elem) t)
		;((list(car listacautata)) )
		((consp (car listacautata)) (or (aparitie elem (car listacautata))(aparitie elem(cdr listacautata))))
		(t(aparitie elem (cdr listacautata)))


	)
)

(defun substituire(el aux lista)
	(cond
		((null lista) '())
		;daca am gasit elementul -> returnam lista cu valoarea substituita
		((eq (CAR lista) el) (cons aux (CDR lista)))
		((atom(car lista)) (cons (car lista) (substituire el aux (cdr lista)) ) )
		;daca nu suntem la elementul cautat , returnam primul el si reapelam cu restul listei
		;((nil (aparitie el (car lista))) (cons (car lista) (substituire el aux (cdr lista))) )
		;(t (cons (substituire el aux (car lista)) (cdr lista) ))
		((aparitie el (car lista)) (cons (substituire el aux (car lista)) (cdr lista) ) )
		(t (cons (car lista) (substituire el aux (cdr lista)) ) )
	)
)

;((atom(car lista)) (cons (car lista) (substituire el aux (cdr lista))))
;((eq (0 car(substituire el aux (car lista))) ) (cons (car lista) (substituire el aux (cdr lista)) ) )

;c)Sa se inlocuiasca fiecare sublista a unei liste cu ultimul ei element.
;Prin sublista se intelege element de pe primul nivel, care este lista.
 (defun ultim (lista)
 	(cond
 		((null (cdr lista)) (cons(car lista) nil))
 		(t (ultim (cdr lista)))
 	)
 )

(defun ultimElement (lista)
	(cond
		((null lista) ())
		;daca elementul curent al listei e un atom , il concateneaza pe acesta cu reapelarea functiei cu restul listei
		((atom(CAR lista)) (cons (CAR lista) (ultimElement(CDR lista))))
		;daca elementul curent al listei e o lista 
		((and (list(CAR lista)) (list(ultim(CAR lista))) ) (append (ultimElement(ultim(CAR lista))) (ultimElement(CDR lista))) )  
		(t (append (ultim(CAR lista)) (ultimElement(CDR lista))))
	)
)
;((list(CAR lista)) (cons (ultim(CAR lista)) (ultimElement(CDR lista))))
		;((list(ultim (CAR lista))) (append (ultimElement (CDR(CAR lista) ) ) (ultimElement(CDR lista))))

;d)Definiti o functie care interclaseaza fara pastrarea dublurilor doua liste liniare sortate
;a,b - input
;a,b - liste liniare ordonate crescator
;functia returneaza lista rezultata ordonata 
(defun interclasare (a b)
	(cond
		((null a) b)
		((null b) a)
		;daca primul el din prima lista e mai mic decat primul din a doua
		((< (CAR a) (CAR b)) (cons(CAR a) (interclasare(CDR a)b)))
		;daca primul el din prima lista e egal cu primul din a doua lista
		;nu se tin duplicate
		((= (CAR a)(CAR b)) (cons(CAR l1) (interclasare(CDR a)(CDR b))))
		;daca primul el din prima lista e mai mare decat primul din a doua 
		(t(cons(CAR b)(interclasare a(CDR b))))
	)
)


(defun traverse (tree)
	(traversemax (cdr tree) 0 0 () )
)

(defun lungime (lista)
	(cond
		((null lista) 0)
		(t (+ 1 (lungime (cdr lista) ) ) )
	)
)

(defun traversemax (children level levelmax lista)
	(if children
		(and
			(incf level)
			(if (>= (lungime (mapcar 'car children)) (lungime lista))
				(traversemax (apply 'append(mapcar 'cdr children)) level level (mapcar 'car children))
			(traversemax (apply 'append(mapcar 'cdr children)) level levelmax lista)
			)
		)
		(list levelmax lista)
	)
)


(defun adancime (tree)
	(cauta (cdr tree) 1)
)

(defun cauta (tree depth)
	(cond
		((null tree) depth)
		(t (cauta (apply 'append(mapcar 'cdr tree)) (+ 1 depth) )	)
	)
)
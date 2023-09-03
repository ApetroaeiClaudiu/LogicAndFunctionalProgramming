#include "Lista.h"
#include <iostream>

using namespace std;


PNod creare_rec() {
	TElem x;
	cout << "x=";
	cin >> x;
	if (x == 0)
		return NULL;
	else {
		PNod p = new Nod();
		p->e = x;
		p->urm = creare_rec();
		return p;
	}
}

Lista creare() {
	Lista l;
	l._prim = creare_rec();
	return l;
}

void tipar_rec(PNod p) {
	if (p != NULL) {
		cout << p->e << " ";
		tipar_rec(p->urm);
	}
}

void tipar(Lista l) {
	tipar_rec(l._prim);
}

void distruge_rec(PNod p) {
	if (p != NULL) {
		distruge_rec(p->urm);
		delete p;
	}
}

void distruge(Lista l) {
	//se elibereaza memoria alocata nodurilor listei
	distruge_rec(l._prim);
}




bool vida(Lista l) {
	if (l._prim == NULL) {
		return true;
	}
	return false;
}

TElem primElem(Lista l) {
	return l._prim->e;
}

void adaugaInainte(TElem e, Lista l) {
	PNod nou = new Nod();
	nou->e = e;
	nou->urm = l._prim;
	l._prim = nou;
}

Lista sublista(Lista l) {
	Lista aux;
	aux._prim = l._prim->urm;
	//PNod n = l._prim->urm;
	//while (n->urm != NULL) {
		//adaugaInainte(n->e,aux);
	//}
	return aux;
}

bool exista(TElem x, Lista l) {
	if (vida(l) == true) {
		return false;
	}
	if (primElem(l) == x) {
		return true;
	}
	return exista(x, sublista(l));
}

bool multime(Lista l) {
	if (vida(l)==true) {
		return true;
	}
	if (exista(primElem(l),sublista(l))==true) {
		return false;
	}
	else {
		return multime(sublista(l));
	}
}

int nrElemDistincte(Lista l) {
	if (vida(l) == true) {
		return 0;
	}
	if (exista(primElem(l), sublista(l)) == false) {
		return 1 + nrElemDistincte(sublista(l));
	}
	else {
		return nrElemDistincte(sublista(l));
	}
}
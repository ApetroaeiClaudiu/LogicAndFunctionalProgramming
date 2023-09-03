#ifndef LISTA_H
#define LISTA_H


//tip de data generic (pentru moment este intreg)
typedef int TElem;

//referire a structurii Nod;
struct Nod;

//se defineste tipul PNod ca fiind adresa unui Nod
typedef Nod *PNod;

typedef struct Nod {
	TElem e;
	PNod urm;
};

typedef struct {
	//prim este adresa primului Nod din lista
	PNod _prim;
} Lista;

//operatii pe lista - INTERFATA

//crearea unei liste din valori citite pana la 0
Lista creare();
//tiparirea elementelor unei liste
void tipar(Lista l);
// destructorul listei
void distruge(Lista l);

bool multime(Lista l);

bool exista(TElem x,Lista l);

Lista sublista(Lista l);

void adaugaInainte(TElem e, Lista l);

bool vida(Lista l);

TElem primElem(Lista l);

int nrElemDistincte(Lista l);


//creeazaListaVida() = > lista vida;

#endif



// r1 - 5
// p1 - 11
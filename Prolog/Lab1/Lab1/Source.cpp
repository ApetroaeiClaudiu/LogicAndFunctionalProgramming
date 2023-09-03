#include "Lista.h"
#include <iostream>
using namespace std;

int main()
{
	Lista l;
	l = creare();
	
	cout << nrElemDistincte(l) << endl;
	if (multime(l) == true) {
		cout << "da" << endl;
	}
	else {
		cout << "nu" << endl;
	}
	
	//tipar(l);

	distruge(l);
}
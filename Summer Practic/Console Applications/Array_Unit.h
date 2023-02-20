#pragma once
#include <vector>
#include <iomanip>
#include <iostream>



using namespace std;



void Show_Matrix(const vector<vector<double>>& a) {

	cout << "\n";

	for (unsigned short i = 0; i < a.size(); i++) {

		cout << "\t";

		for (unsigned short j = 0; j < a[i].size(); j++) {

			cout << setw(10) << setprecision(3) << a[i][j];

		}

		cout << endl;
	}

	cout << "\n";

}



// Creating random matrix
void Random_Matrix(vector<vector<double>>& a) {

	srand(time(nullptr));

	for (unsigned short i = 0; i < a.size(); i++) {

		a[i].resize(a.size());

		for (unsigned short j = 0; j < a[i].size(); j++) {

			a[i][j] = (rand() % 20) - 10;

			a[i][j] /= (rand() % 3) + 1;

		}

	}

}

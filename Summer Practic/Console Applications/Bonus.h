#pragma once
#include <iostream>
#include <vector>
#include "Array_Unit.h"



using namespace std;




//	Task 548:



//	Input:
void Task_458_input(unsigned int& n, unsigned int& m) {

	cout << "Input n:\n";

	cin >> n;

	cout << "Input m:\n";

	cin >> m;

}


//	A(n, m):
unsigned int Task_458_A(const unsigned int& n, const unsigned int& m) {

	if (n == 0) {

		return m + 1;

	}
	else if (n != 0 && m == 0) {

		Task_458_A(n - 1, 1);

	}
	else {

		Task_458_A(n - 1, Task_458_A(n, m - 1));

	}

}


//	Output:
void Task_458_output(const unsigned int& A) {

	cout << "Result [A(n, m)]:\t" << A << endl;

}




//	Task 692 (a):



//	Input:
vector<vector<double>> Task_692_a_input(unsigned int& n) {

	cout << "Input n:\n";

	cin >> n;

	vector<vector<double>> a(n);

	Random_Matrix(a);

	cout << "Matrix:\n";

	Show_Matrix(a);

	return a;

}


//	Find max:
double Task_692_Max(const vector<vector<double>>& a) {

	double max = -1 * pow(99, 99);

	for (unsigned short i = 0; i < a.size(); i++) {

		for (unsigned short j = i; j < a[i].size(); j++) {

			if (max < a[i][j]) {

				max = a[i][j];

			}

		}

	}

	return max;

}

//	Output:
void Task_692_output(const vector<vector<double>>& a) {

	cout << "Max:\t" << Task_692_Max(a) << endl;

}
#pragma once
#include <exception>
#include <vector>
#include <iomanip>
#include <iostream>
#include <string>
#include <list>
#include <iterator>
#include <Windows.h>
#include "Bonus.h"
#include "Array_Unit.h"
#include <fstream>




using namespace std;




// Razvetvlenia
// Task 58 (a):
void Task_58_a() {

	double a, f;


	cout << "Input a:\n";

	cin >> a;

	if (a < 0) {

		f = a;

	}
	else {

		f = -1 * pow(a, 2);

	}

	cout << "\nf(a):\t" << f;


}



// Zelochislennaya arifmetica
// Task 72 (b):
void Task_72_b() {

	double a, f;

	cout << "Input a:\n";

	cin >> a;

	if (a > 1) {

		while (a > 1) {

			a -= 2;

		}

	}

	if (a < -1) {

		while (a < -1) {

			a += 2;

		}

	}

	if (a <= 0) {

		f = a + 1;

	}

	else {

		f = sqrt(1 - pow(a, 2));

	}


	cout << "\nf(a):\t" << f << endl;


}



// Loops
// Task 88 (g):
void Task_88_g() {

	unsigned n, nn, st;

	cout << "Input n (n > 0):\n";

	cin >> n;

	if (n == 0) {

		cout << "\n\t„N„u„{„€„‚„u„{„„„~„€„u „x„~„p„‰„u„~„y„u! - n = 0\n";

		return; 

	}

	else {

		st = 0;

		nn = n;

		while (n > 0) {

			n /= 10;

			st++;

		}

		n = nn;

		n += pow(10, st);

		n = n * 10 + 1;

	}

	cout << "\nResult:\t" << n << endl;

}



// Arrays 
// Task 204:
void Task_204() {


	unsigned n;

	float min = pow(99, 99), max = 0;

	cout << "Input n (n > 2):\n";

	cin >> n;

	float* a = new float[n];

	cout << "Input a (a >= 0) (Using Enter):\n";

	cout << "(if a < 0 then a = 0)\n";

	for (int i = 0; i < n; i++) {

		cin >> a[i];

		if (a[i] < min) {

			min = a[i];

		}

		if (a[i] > max) {

			max = a[i];

		}

		if (a < 0) {

			a = 0;

		}

	}

	
	for (int i = 0; i < n; i++) {

		if (a[i] == min) {

			a[i] = -1;

			break;

		}

	}


	for (int i = 0; i < n; i++) {

		if (a[i] == max) {

			a[i] = -1;

			break;

		}

	}

	int j = 0;

	float* r = new float[n - 2];


	for (int i = 0; i < n; i++) {

		if (a[i] != -1) {

			r[j] = a[i];

			j++;

		}

	}

	float sum = 0;

	for (int j = 0; j < n - 2; j++) {

		sum += r[j];

	}

	cout << "\nResult:\t" << sum / (n - 2) << endl;

}



// Lists:
// Task 136 (a):
void Task_136_a() {

	unsigned n;

	cout << "Input n:\n";

	cin >> n;

	list <float> a;

	cout << "Input a (Using Enter):\n";

	float temp;

	for (int i = 0; i < n; i++) {

		cin >> temp;

		a.push_back(temp);

	}

	float sum = 0;

	for (int i = 0; i < n; i++) {

		sum += a.back();

		a.pop_back();

	}

	cout << "\nResult:\t" << sum << endl;

}


// Task 551 (v):				// „N„u „‚„p„q„€„„„p„u„„! „T„w„p„ƒ...
void Task_551_v() {								

	unsigned n;

	cout << "Input n:\n";

	cin >> n;

	list <char> s;

	list <char> ts, s0;

	string w1, w2;

	cout << "Input s (Using Enter):\n";

	char temp;

	int ind;

	for (int i = 0; i < n; i++) {				// „P„€„|„…„‰„p„u„} „ƒ„p„}„… „„€„ƒ„|„u„t„€„r„p„„„u„|„„~„€„ƒ„„„

		cin >> temp;

		s.push_back(temp);

	}

	if (s.back() == ' ' && s.front() == ' ') {	// „T„q„y„‚„p„u„} „„‚„€„q„u„|„ „r „~„p„‰„p„|„u, „u„ƒ„|„y „€„~„y „u„ƒ„„„

		s.pop_front();

		s.pop_back();

	}

	ts = s;										// "„R„€„x„‚„p„~„‘„u„}" „ƒ„|„€„r„€

	while (s.front() != ' ') {					// „P„€„|„…„‰„p„u„} „„u„‚„r„€„u „ƒ„|„€„r„€

		w1.push_back(s.front());

		s.pop_front();

	}

	while (s.back() != ' ') {					// „P„€„|„…„‰„p„u„} „„€„ƒ„|„u„t„~„u„u „ƒ„|„€„r„€

		w2.push_back(s.back());

		s.pop_back();

	}

	s = ts;										// "„H„p„s„‚„…„w„p„u„}" „ƒ„|„€„r„€

	ts.clear();									// „X„y„ƒ„„„y„} „t„|„‘ „q„…„t„…„‹„u„z „‚„p„q„€„„„

	if (n > 1 && w1 == w2) {					// „B„„„€„|„~„‘„u„} „x„p„t„p„~„y„u „„€ „…„ƒ„|„€„r„y„ „x„p„t„p„~„y„‘

		while (!w1.empty()) {					// „T„t„p„|„‘„u„} 1-„€„u „ƒ„|„€„r„€

			s.pop_front();

			w1.pop_back();

		}
			

		while (!w2.empty()) {					// „T„t„p„|„‘„u„} 2-„€„u „ƒ„|„€„r„€

			s.pop_back();

			w2.pop_back();

		}

		while (!s.empty()) {					// „P„u„‚„u„r„€„‚„p„‰„y„r„p„u„} „ƒ„|„€„r„€

			ts.push_back(s.back());

			s.pop_back();

		}

		s = ts;									// „I„x „r„‚„u„}„u„~„~„€„s„€ „r „€„ƒ„~„€„r„~„€„u

		ts.clear();								// „X„y„ƒ„„„y„} „t„|„‘ „q„…„t„…„‹„u„z „‚„p„q„€„„„

	}

	while (!s.empty()) {

		if (s.front() != ' ') {

			ts.push_back(s.front());

			s.pop_front();

		}
		else {

			ts.push_back(s.front());

			while (s.front() == ' ') {

				s.pop_front();

			}

		}

		s = ts;

	}

	cout << "\nResult:\n";

	ts = s;

	w1.clear();

	while (!ts.empty()) {

		w1.push_back(ts.front());

		ts.pop_front();

	}

	cout << w1 << endl;

}



// Functions:
// Task 458:			(**)
void Task_458() {

	unsigned int n, m;			// „O„q„Œ„‘„r„|„‘„u„} „„u„‚„u„}„u„~„~„„u

	Task_458_input(n, m);		// „B„r„€„t/„I„~„y„ˆ„y„p„|„y„x„p„ˆ„y„‘ „„u„‚„u„}„u„~„~„„‡

	Task_458_output(Task_458_A(n, m));		// „P„€„t„ƒ„‰„v„„ „y „r„„r„€„t

}


// Task 692 (a):		(**)
void Task_692_a() {

	unsigned int n;				// „O„q„Œ„‘„r„|„‘„u„} „„u„‚„u„}„u„~„~„…„

	Task_692_output(Task_692_a_input(n));

}



// Files:
// Task 482:			(***)
void Task_482() {		

	string temp;

	fstream f, g;

	f.open("f.txt");

	g.open("g.txt");

	while (!f.eof()) {

		getline(f, temp);

		for (int i = 0; i < temp.size(); i++) {

			temp[i] = tolower(temp[i]);

		}

		g << temp << endl;

	}

	f.close();
	
	g.close();

}



// Task 497:			(***)	// „N„u „‚„p„q„€„„„p„u„„! „T„w„p„ƒ...
void Task_497() {

	fstream f, g, temp;

	char t1, t2;

	string SB;			// Saving Box

	f.open("ff.txt");

	g.open("g.txt");

	temp.open("temp.txt");

	t1 = 'N';			// "„O„q„~„…„|„‘„u„}" „x„~„p„‰„u„~„y„‘	

	t2 = 'E';


	// „H„t„u„ƒ„ „q„…„t„u„„ „„‚„€„y„ƒ„‡„€„t„y„„„ „r„y„t„€„y„x„}„u„~„u„~„y„u „~„p„‰„p„|„„~„€„s„€ „„„u„{„ƒ„„„p „r „~„p„‰„p„|„„~„€„} „†„p„z„|„u


	while (!f.eof()) {			// „T„q„y„‚„p„u„} "„|„y„Š„~„y„u" „„‚„€„q„u„|„, „x„p„„y„ƒ„„r„p„‘ „‚„u„x„…„|„„„„p„„ „r„€ „r„‚„u„}„u„~„~„„z „†„p„z„| "temp"

		f >> t1;

		if (t1 == ' ') {

			temp << t1;			

			while (t1 == ' ') {

				f >> t1;

			}

		}
		else {

			temp << t1;

		}

	}


	while (!temp.eof()) {		// „T„q„y„‚„p„u„} „€„t„~„€„q„…„{„r„u„~„~„„u „ƒ„|„€„r„p, „‚„p„q„€„„„p„‘ „…„w„u „ƒ „†„p„z„|„€„} "temp"

		temp >> t1;

		t2 = t1;				// C„€„‡„‚„p„~„‘„u„} 1-„„z „ƒ„y„}„r„€„| „t„|„‘ „t„p„|„„~„u„z„Š„u„s„€ „ƒ„‚„p„r„~„u„~„y„‘

		while (t1 != ' ') {

			SB.push_back(t1);	// „V„‚„p„~„y„} „ƒ„|„€„r„€, „‰„„„€„q„ „„€„ƒ„|„u „u„s„€ „t„€„q„p„r„y„„„ „y„|„y „~„u „t„€„q„p„r„y„„„ „r „y„„„€„s„€„r„„z „†„p„z„|

			temp >> t1;

			if (t1 != t2 || t1 == ' ') {		// „E„ƒ„|„y „ƒ„|„€„r„€ „~„u„€„t„~„€„q„…„{„r„u„~„~„€„u („R„„t„p „r„‡„€„t„‘„„ „ƒ„|„€„r„p, „ƒ„€„ƒ„„„€„‘„‹„y„u „y„x „€„t„~„€„z „q„…„{„r„)

				SB.clear();		// „S„€ „}„ "„‰„y„ƒ„„„y„}" „ƒ„|„€„r„€, „‰„„„€„q„, „t„€„q„p„r„|„‘„‘ „„…„ƒ„„„€„u „ƒ„|„€„r„€, „~„u „t„|„€„q„p„r„|„‘„„„ „~„y„{„p„{„y„‡ „ƒ„|„€„r

			}

		}

		for (int i = 0; i < SB.length(); i++) {

			g << SB[i];

		}

	}



}




// „B„ƒ„u „x„p„t„p„~„y„‘:
void Tasks() {

	cout << "\n\n\tTask 58 (a):\n\n";

	Task_58_a();

	cout << "\n\n\tTask 72 (b):\n\n";

	Task_72_b();

	cout << "\n\n\tTask 88 (g):\n\n";

	Task_88_g();

	cout << "\n\n\tTask 204:\n\n";

	Task_204();

	cout << "\n\n\tTask 136 (a):\n\n";

	Task_136_a();

	cout << "\n\n\tTask 551 (v):\n\nUnder development!";

	//Task_551_v();

	cout << "\n\n\tTask 458:\n\n";

	Task_458();

	cout << "\n\n\tTask 692 (a):\n\n";

	Task_692_a();

	cout << "\n\n\tTask 482:\n\n";

	Task_482();

	cout << "\n\n\tTask 497:\n\nUnder development!";

	//Task_497();

}
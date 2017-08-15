dt.exe : decision_tree.o
	g++ -std=c++11 -o dt.exe decision_tree.o

decision_tree.o : decision_tree.cpp
	g++ -std=c++11 -c -o decision_tree.o decision_tree.cpp


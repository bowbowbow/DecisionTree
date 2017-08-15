Decision Tree Assignment
==================

C++ Implementation of Decision Tree Algorithm

To run the implementation 
=========================

1. Keep project files in one folder.

2. compile using command `make`.
> To compile without using the makefile, type the following command.
>
> `g++ -std=c++11 decision_tree.cpp -o dt.exe`
> 
> (Note that -std=c++11 option is must be given in g++.)

3. Run using following command.
> ./dt.exe [dt_train.txt] [dt_test.txt] [dt_result.txt]


Summary of the algorithm
============

This algorithm is used for automatic decision tree generation.

> **Input**:
> 1. Data partition, D, which is a set of training tuples and their associated class labels. attribute_list.
> 2. the set of candidate attributes
> 3. Attribute_selection_method, a procedure to determine the splitting criterion that "best" partitions the data tuples into individual classes. This criterion consists of a splitting_attribute and, possibly, either a split-point or splitting subset.
> 
> **Output**: A decision tree

**Basic Algorithm (a greedy algorithm)**
- tree is constructed in a top-down, recursive, divide-and-conquer manner
- At start, all the training examples are at the root
- Attributes are categorical (Note that if continuous-valued, they are discretized in advance)
- Test attributes are selected on the basis of a heuristic or statistical measure

**Conditions for stopping partitioning**
- All samples for a given node belong to the same class
- There are no remaining attributes for further partitioning - majority voting is employed for classifying the leaf
- There are no sample left

**Attribute Selection Measure : Information GainRatio**

$GainRatio(A) = \frac {Gain(A)}{SplitInfo(A)} $

$SplitInfo_{A}(D) = - \sum _{ j=1 }^{ v } \frac { \left| { D }_{ j } \right|  }{ \left| D \right|  } log_{2}(\frac { \left| { D }_{ j } \right|  }{ \left| D \right|  })$

$Gain(A) = info(D) - info_{A}(D)$

$info_{A}(D) = \sum _{ j=1 }^{ v } \frac { \left| { D }_{ j } \right|  }{ \left| D \right|  } info({ D }_{ j })$

$info(D) = - \sum _{ i=1 }^{ m }{ { p }_{ i }{ log }_{ 2 }({ p }_{ i }) } $

$p_{i} = \frac { \left| { C }_{ i, D } \right|  }{ \left| D \right|  }  $


Any other specification of the implementation and testing
============

- Note that I use c++11, not c++. therefore -std=c++11 option is must be given in g++.

- Since the test code uploaded to Hanyang Portal is for Windows, I added checker class for using in Unix. 

- `self test result `
> **gain**
> Accuracy: 91.0405%(315/346)
>
> **gain ratio**
> Accuracy: 91.9075%(318/346)
>
> **estimated error pruning with gain ratio**
> Accuracy: 67.9191%(235/346)
>
> **simple pre-pruning rule based on majority heuristic with gain ratio** 
> Aaccuracy: 92.1965%(319/346)

About input file
============

**Input file format for `a training set`**

[attribute_name_1]`\t`[attribute_name_2]`\n`...[attribute_name_n]

[attribute_1]`\t`[attribute_2]`\t`...[attribute_n]`\n` 

[attribute_1]`\t`[attribute_2]`\t`...[attribute_n]`\n` 

- n-1 attribute values of the corresponding tuple
- All the attributes are categorical (not continuous-valued)
- [attribute_n]: a class label that the corresponding tuple belongs to

**Input file format for `a test set`**

[attribute_name_1]`\t`[attribute_name_2]`\n`...[attribute_name_n-1]

[attribute_1]`\t`[attribute_2]`\t`...[attribute_n-1]`\n` 

[attribute_1]`\t`[attribute_2]`\t`...[attribute_n-1]`\n` 

- n-1 attribute values of the corresponding tuple
- All the attributes are categorical (not continuous-valued)

About output file
============

**output file format**

[attribute_name_1]`\t`[attribute_name_2]`\n`...[attribute_name_n]

[attribute_1]`\t`[attribute_2]`\t`...[attribute_n]`\n` 

[attribute_1]`\t`[attribute_2]`\t`...[attribute_n]`\n` 

- [attribute_1] ~ [attribute_n-1]: given attribute values in the test set
- [attribute_n]: a class label predicted by your model for the corresponding tuple



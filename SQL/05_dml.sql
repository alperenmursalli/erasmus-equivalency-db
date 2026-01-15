INSERT INTO SEMESTER VALUES
(1, 1, 'Fall'),
(2, 1, 'Spring'),
(3, 2, 'Fall'),
(4, 2, 'Spring'),
(5, 3, 'Fall'),
(6, 3, 'Spring'),
(7, 4, 'Fall'),
(8, 4, 'Spring');

select *
from semester;

INSERT INTO university (uni_id, uni_name, erasmus_code, location, web_address) VALUES
(1, 'Hacettepe Üniversitesi', 'TR ANKARA03', 'Ankara, Türkiye', 'https://www.hacettepe.edu.tr'),
(2, 'Ege Üniversitesi', 'TR IZMIR01', 'İzmir, Türkiye', 'https://www.ege.edu.tr'),
(3, 'İzmir Ekonomi Üniversitesi', 'TR IZMIR06', 'İzmir, Türkiye', 'https://www.ieu.edu.tr');

select *
from university;

INSERT INTO department (
  dept_id,
  uni_id,
  dept_name,
  dept_type,
  location,
  standart_duration,
  maximum_duration,
  instruction_language,
  quota
) VALUES
(1, 1, 'Yapay Zeka Mühendisliği', 'Mühendislik', 'Ankara Beytepe', 4, 7, 'English', 45),
(2, 2, 'Bilgisayar Mühendisliği', 'Bilgisayar ve Bilişim', 'İzmir Bornova', 4, 7, 'English', 120),
(3, 3, 'Yazılım Mühendisliği', 'Mühendislik', 'İzmir Balçova', 4, 7, 'English', 82);


select *
from department;

INSERT INTO course (
  course_id,
  dept_id,
  semester_num,
  course_code,
  course_name,
  course_type,
  course_level,
  course_description,
  course_goal,
  teaching_method,
  teoric_hours,
  lab_hours,
  acts,
  course_lang
) VALUES

(11, 1, 2, 'BBM201', 'Data Structures',
 'Mandatory', 'Undergraduate',
 'Memory and time complexity, storage of special matrices, stack, queue, single and double concatenated lists, binary trees and graphs',
 'Presenting accurate and reliable concepts in programming, designing appropriate data structures for a problem, comparing algorithms',
 'Face-to-Face', 3, 0, 5.0, 'English');

UPDATE course
SET semester_num = 3
WHERE course_id = 11;



 INSERT INTO faculty_members (faculty_id, firstname, lastname)
VALUES (1, 'Adnan', 'Özsoy');

INSERT INTO lecturer (faculty_id, title)
VALUES (1, 'Doçent');

INSERT INTO instructor (faculty_id)
VALUES (1);

INSERT INTO section (
  section_id,
  course_id,
  instructor_id,
  coord_id
) VALUES (  1,  11,  1,  NULL);

INSERT INTO course_topics VALUES
(11, 1,  'Basic concepts of data structures', NULL),
(11, 2,  'Performance analysis, memory and time complexity', NULL),
(11, 3,  'Implementation of multidimensional arrays', NULL),
(11, 4,  'Lower/upper triangular, sparse and band matrices', NULL),
(11, 5,  'Stacks and queues', NULL),
(11, 6,  'Evaluation of arithmetic and logical expressions', NULL),
(11, 7,  'Array-based linked lists', NULL),
(11, 8,  'Midterm exam', NULL),
(11, 9,  'Linked list applications (stack, queue, hash table)', NULL),
(11,10,  'Doubly linked lists', NULL),
(11,11,  'Binary trees', NULL),
(11,12,  'Graph representations', NULL),
(11,13,  'Midterm exam', NULL),
(11,14,  'Examples of data structures', NULL),
(11,15,  'Preparation for the final exam', NULL),
(11,16,  'Final exam', NULL);

INSERT INTO learning_outcomes VALUES
(11, 1, 'Understand the fundamentals of data structures'),
(11, 2, 'Define memory and time complexity of basic algorithms'),
(11, 3, 'Learn fundamental concepts of recursive algorithms'),
(11, 4, 'Gain expertise in storing matrices (triangular, band, sparse)'),
(11, 5, 'Know how to use stacks, queues, and linked lists'),
(11, 6, 'Design effective algorithms for expression evaluation'),
(11, 7, 'Implement array-based and pointer-based linked lists'),
(11, 8, 'Learn binary tree and graph data structures');

INSERT INTO course_resources VALUES
(11, 'Fundamentals of Data Structures in C', 'Textbook'),
(11, 'Fundamentals of Data Structures in C++', 'Textbook'),
(11, 'Problem Solving and Program Design in C', 'Textbook'),
(11, 'Data Structures and Algorithm Analysis in C++', 'Textbook');

INSERT INTO course_activities VALUES
(11, 'Midterm Exam', 'Exam', 52.00, 40,2),
(11, 'Homework Assignments', 'Homework', 8.00,8,4),
(11, 'Final Exam', 'Final', 40.00, 24,1);



INSERT INTO faculty_members (faculty_id, firstname, lastname)
VALUES (202, 'Nursel', 'Koyuncu'),
(203, 'Hatice', 'Işık');


INSERT INTO lecturer (faculty_id, title)
VALUES (202, 'Prof. Dr.');

INSERT INTO instructor (faculty_id)
VALUES (202);

INSERT INTO assistant (faculty_id)
VALUES (203);


INSERT INTO course (
  course_id,
  dept_id,
  semester_num,
  course_code,
  course_name,
  course_type,
  course_level,
  course_description,
  course_goal,
  teaching_method,
  teoric_hours,
  lab_hours,
  acts,
  course_lang
) VALUES (
  12,
  2,
  3,
  'IST292',
  'Statistics',
  'Mandatory',
  'Undergraduate',
  'Definition, purpose and importance of statistics; statistical data, summarization and analysis of data.',
  'To provide students with knowledge on basic statistical concepts, data collection, summarization and analysis.',
  'Face-to-Face',
  3,
  0,
  5,
  'English'
);

update course
set dept_id=1
where course_id=12;
INSERT INTO section (
  section_id,
  course_id,
  instructor_id,
  coord_id
) VALUES (
  2002,
  12,
  202,
  NULL
);

INSERT INTO assist (faculty_id,section_id)
VALUES(203,2002);


INSERT INTO course_topics VALUES
(12, 1, 'Introduction to Statistics', 'Definition, scope and historical development of statistics'),
(12, 2, 'Data and Data Collection', 'Types of data, frequency tables and graphs'),
(12, 3, 'Measures of Central Tendency and Dispersion', 'Location and variation measures'),
(12, 4, 'Probability and Probability Distributions', 'Random variables and expectation'),
(12, 5, 'Discrete and Continuous Probability Distributions', 'Applications'),
(12, 6, 'Sampling Distributions', 'Central Limit Theorem'),
(12, 7, 'Midterm Exam', NULL),
(12, 8, 'Statistical Hypothesis Testing', 'Tests for means and variances'),
(12, 9, 'Tests for Two Populations', 'Mean and variance comparisons'),
(12,10, 'Contingency Tables and Chi-Square Analysis', 'RxC tables'),
(12,11, 'Simple Linear Regression and Correlation', 'Estimation and interpretation'),
(12,12, 'Regression Inference and Correlation', 'Applications'),
(12,13, 'One-Way Analysis of Variance (ANOVA)', 'Homogeneity tests'),
(12,14, 'Exam Preparation', NULL),
(12,15, 'Final Exam', NULL);


INSERT INTO learning_outcomes VALUES
(12, 1, 'Define the concept and purpose of statistics'),
(12, 2, 'Define fundamental statistical concepts'),
(12, 3, 'Interpret frequency distributions and graphs'),
(12, 4, 'Use measures of central tendency'),
(12, 5, 'Use measures of dispersion'),
(12, 6, 'Interpret probability'),
(12, 7, 'Interpret probability distributions'),
(12, 8, 'Perform statistical analysis');

INSERT INTO course_resources VALUES
(12, 'Introduction to Statistical Methods', 'Textbook'),
(12, 'Statistical Methods and Data Analysis', 'Textbook'),
(12, 'Probability and Statistics for Engineers', 'Textbook'),
(12, 'Course Lecture Notes', 'Notes');


INSERT INTO course_activities VALUES
(12, 'Midterm Exam', 'Exam', 40.00, 1, 40),
(12, 'Homework', 'Homework', 10.00, 5, 25),
(12, 'Final Exam', 'Final', 50.00, 1, 29);


select * 
from course_topics;


INSERT INTO faculty_members (faculty_id, firstname, lastname)
VALUES (204, 'Pınar', 'Duygulu Şahin');

INSERT INTO lecturer (faculty_id, title)
VALUES (204, 'Professor');

INSERT INTO instructor (faculty_id)
VALUES (204);


INSERT INTO course (
  course_id,
  dept_id,
  semester_num,
  course_code,
  course_name,
  course_type,
  course_level,
  course_description,
  course_goal,
  teaching_method,
  teoric_hours,
  lab_hours,
  acts,
  course_lang
) VALUES (
  13,
  1,
  4,
  'AIN211',
  'Principles of Artificial Intelligence',
  'Mandatory',
  'Undergraduate',
  'Introduction to the main concepts and methods of artificial intelligence and real-life AI applications. Topics include intelligent agents, search algorithms, logical agents, knowledge representation, planning, uncertainty, probabilistic reasoning, Bayesian networks, reinforcement learning, perception, robotics and computer vision.',
  'To introduce the fundamental concepts and methods of artificial intelligence and provide students with the background required to develop autonomous intelligent systems.',
  'Face-to-Face',
  3,
  2,
  6,
  'English'
);

INSERT INTO section (
  section_id,
  course_id,
  instructor_id,
  coord_id
) VALUES (
  2003,
  13,
  204,
  NULL
);


INSERT INTO course_topics VALUES
(13, 1,  'Introduction to artificial intelligence and history, intelligent agents', NULL),
(13, 2,  'Problem solving by search and uninformed search algorithms', NULL),
(13, 3,  'Heuristic search algorithms', NULL),
(13, 4,  'Constraint satisfaction problems', NULL),
(13, 5,  'Adversarial search and games', NULL),
(13, 6,  'Logical agents', NULL),
(13, 7,  'Midterm exam', NULL),
(13, 8,  'First-order logic', NULL),
(13, 9,  'Knowledge representation and logical reasoning', NULL),
(13,10,  'Planning', NULL),
(13,11,  'Uncertainty and probabilistic reasoning', NULL),
(13,12,  'Bayesian networks', NULL),
(13,13,  'Reinforcement learning', NULL),
(13,14,  'Perception, robotics and fundamentals of computer vision', NULL),
(13,15,  'Preparation for the final exam', NULL),
(13,16,  'Final exam', NULL);

INSERT INTO learning_outcomes VALUES
(13, 1, 'Gain knowledge about the fundamentals of artificial intelligence'),
(13, 2, 'Analyze and implement solutions for various artificial intelligence problems'),
(13, 3, 'Understand the core concepts required for developing intelligent systems');


INSERT INTO course_resources VALUES
(13, 'Artificial Intelligence: A Modern Approach (AIMA), 3rd Edition – Russell & Norvig', 'Textbook');

INSERT INTO course_activities VALUES
(13, 'Midterm Exam', 'Exam', 30.00, 18,1),
(13, 'Homework', 'Homework', 30.00, 75, 1),
(13, 'Final Exam', 'Final', 40.00, 25, 1);

-- prerequisites for courses 13, 14, 15 are added later, after all three exist
INSERT INTO course (
  course_id,
  dept_id,
  semester_num,
  course_code,
  course_name,
  course_type,
  course_level,
  course_description,
  course_goal,
  teaching_method,
  teoric_hours,
  lab_hours,
  acts,
  course_lang
) VALUES (
  14,
  1,
  1,
  'BBM101',
  'Introduction to Programming I',
  'Mandatory',
  'Undergraduate',
  'An introduction to the fundamentals of computer science and programming. The course covers abstract problem solving, control flow, functions, lists, file operations, basic data structures, recursion and memory management using Python and C.',
  'To provide students with the ability to solve programming problems using abstract concepts and to develop and implement algorithms of moderate complexity.',
  'Face-to-Face',
  3,
  0,
  6,
  'English'
);

INSERT INTO faculty_members (faculty_id, firstname, lastname)
VALUES (205, 'Fuat', 'Akal');

INSERT INTO lecturer (faculty_id, title)
VALUES (205, 'Professor');

INSERT INTO instructor (faculty_id)
VALUES (205);


INSERT INTO section (
  section_id,
  course_id,
  instructor_id,
  coord_id
) VALUES (
  2004,
  14,
  205,
  NULL
);


INSERT INTO course_topics VALUES
(14, 1,  'What is computation?', NULL),
(14, 2,  'Binary representations and Von Neumann architecture', NULL),
(14, 3,  'Introduction to Python, control flow and functions', NULL),
(14, 4,  'Strings, lists, file operations, sets and dictionaries', NULL),
(14, 5,  'Midterm Exam I', NULL),
(14, 6,  'List concept and visualization', NULL),
(14, 7,  'Recursion', NULL),
(14, 8,  'Sorting algorithms', NULL),
(14, 9,  'Debugging, exceptions and testing', NULL),
(14,10,  'Development strategies, function design, algorithmic efficiency', NULL),
(14,11,  'C for Python programmers', NULL),
(14,12,  'Midterm Exam II', NULL),
(14,13,  'Pointers in C', NULL),
(14,14,  'Pointers in C (continued)', NULL),
(14,15,  'Preparation for the final exam', NULL),
(14,16,  'Final exam', NULL);


INSERT INTO learning_outcomes VALUES
(14, 1, 'Learn the fundamentals of computer programming and algorithmic problem solving'),
(14, 2, 'Develop and implement algorithms of moderate complexity');


INSERT INTO course_resources VALUES
(14, 'Think Python (2nd Edition) – Allen B. Downey', 'Textbook'),
(14, 'Introduction to Computation and Programming Using Python – John V. Guttag', 'Textbook'),
(14, 'C How to Program (8th Edition) – Deitel & Deitel', 'Textbook'),
(14, 'The C Programming Language (2nd Edition) – Kernighan & Ritchie', 'Textbook'),
(14, 'Practical C Programming (3rd Edition) – Steve Oualline', 'Textbook');


INSERT INTO course_activities VALUES
(14, 'Midterm Exam I', 'Exam', 30.00, 1, NULL),
(14, 'Midterm Exam II', 'Exam', 30.00, 1, NULL),
(14, 'Final Exam', 'Final', 40.00, 1, NULL);

-- prerequisites for 14,15 will be inserted together after course 15

select *
from faculty_members;

select *
from course;





INSERT INTO course (
  course_id,
  dept_id,
  semester_num,
  course_code,
  course_name,
  course_type,
  course_level,
  course_description,
  course_goal,
  teaching_method,
  teoric_hours,
  lab_hours,
  acts,
  course_lang
) VALUES (
  15,
  1,
  1,
  'BBM103',
  'Introduction to Programming Laboratory I',
  'Mandatory',
  'Undergraduate',
  'An introductory laboratory course to computer programming and computer science fundamentals. Topics include flow control, functions, lists, file operations, basic data structures, function design, recursion and memory management using Python and C.',
  'To provide students with the skills required to solve programming problems using abstract concepts and to develop and implement algorithms of moderate complexity.',
  'Face-to-Face',
  0,
  2,
  4,
  'English'
);


INSERT INTO section (
  section_id,
  course_id,
  instructor_id,
  coord_id
) VALUES (
  1011,
  15,
  205,
  NULL
);

INSERT INTO course_topics VALUES
(15, 1,  'Introduction to Computer Programming', NULL),
(15, 2,  'Flowcharts', NULL),
(15, 3,  'Introduction to the Laboratory Environment', NULL),
(15, 4,  'Introduction to Programming with C, Sequential Structures', NULL),
(15, 5,  'Data Types, Variable Declarations and Operators', NULL),
(15, 6,  'Selection Structures', NULL),
(15, 7,  'Iterative Structures and Loops', NULL),
(15, 8,  'Functions', NULL),
(15, 9,  'Arrays', NULL),
(15,10,  'Midterm Exam', NULL),
(15,11,  'Pointers', NULL),
(15,12,  'File Operations', NULL),
(15,13,  'Strings', NULL),
(15,14,  'Recursive Programming', NULL),
(15,15,  'Preparation for the Final Exam', NULL),
(15,16,  'Final Exam', NULL);


INSERT INTO learning_outcomes VALUES
(15, 1, 'Learn the fundamentals of computer programming and algorithmic problem solving'),
(15, 2, 'Develop and implement algorithms of moderate complexity');

INSERT INTO course_resources VALUES
(15, 'Think Python (2nd Edition) – Allen B. Downey', 'Textbook'),
(15, 'Introduction to Computation and Programming Using Python (2nd Edition) – John V. Guttag', 'Textbook'),
(15, 'C How to Program (8th Edition) – Deitel & Deitel', 'Textbook'),
(15, 'The C Programming Language (2nd Edition) – Kernighan & Ritchie', 'Textbook'),
(15, 'Practical C Programming (3rd Edition) – Steve Oualline', 'Textbook');


INSERT INTO course_activities VALUES
(15, 'Midterm Exam', 'Exam', 25.00, 50, 8),
(15, 'Homework', 'Homework', 65.00, 20, 5),
(15, 'Attendance', 'Attendance', 10.00,10 , 1);


-- now that courses 13, 14, 15 all exist, insert their prerequisites
INSERT INTO prerequisites VALUES
(13, 14),
(13, 15),
(14, 15),
(15, 14);


select *
from student;


INSERT INTO student VALUES
(1, 'Serdar',   'Imanov',   2, 1),
(2, 'Alperen',  'Mursallı', 1, 3),
(3, 'Ahmet',    'Yıldız',   1, 2),
(4, 'Mehmet',   'Kaya',     3, 2),
(5, 'Elif',     'Demir',    3, 1);



-- enrollment / enrolls test data will be inserted later, after equivalency is populated

INSERT INTO course (
course_id,
dept_id,
semester_num,
course_code,
course_name,
course_type,
course_level,
course_description,
course_goal,
teaching_method,
teoric_hours,
lab_hours,
acts,
course_lang
) VALUES (
21,
2,
3,
'501002042010',
'DATA STRUCTURES',
'Mandatory',
'First Cycle',
'Stack, Queues, Lists, Recursion, Trees (Binary Trees, Balanced Trees, Heaps, Huffman Encoding Tree), Comparison of Algorithms, Sorting and Search, Graphs (Representation, Traversals, Shortest Path, Minimum Spanning Tree, ...)',
'The objective of the course is to give detailed information about Data Structures concepts and to give ability to use suitable data structures efficiently for solving problems. To show data organization and manipulation concepts are useful in problem solving.',
'Face to Face',
3.00,
0.00,
5.00,
'English'
);

update course
set course_level='Undergraduate'
where course_id=21;

INSERT INTO faculty_members (
faculty_id,
firstname,
lastname
) VALUES (
201,
'Aybars',
'UĞUR'
);

INSERT INTO lecturer (
faculty_id,
title
) VALUES (
201,
'Prof. Dr.'
);

INSERT INTO instructor (
faculty_id
) VALUES (
201
);

INSERT INTO section (
section_id,
course_id,
instructor_id,
coord_id
) VALUES (
2001,
21,
201,
NULL
);

INSERT INTO course_topics (
course_id,
week_number,
topic_name,
topic_brief
) VALUES 
(21, 1, 'Introduction to Data Structures', 'The importance of Data, Structure and Algorithm concepts. Comparison of C, C++, Java, Python, C# languages and places in software development area.'),
(21, 2, 'Introduction to C#/Java Programming Language', 'Introducing C# Software Development Tools. Basic Concepts in C#. Writing application in C#. Examples.'),
(21, 3, 'Object-oriented programming in C#', 'Vector Examples. Simple Graphical User Interface (GUI) Design. Application Development including Classes, Data Structures and Methods.'),
(21, 4, 'Stack, Queues and Linked Lists in Object-Oriented View', 'Stack Definitions and Operations. Queue Definitions and Operations; Designing and using a Queue. Some Operations on Lists and Definitions; Linked Lists; Priority Queues; Implementation of Stack and Queues based on Linked Lists.'),
(21, 5, 'Recursion in C#', 'Iteration and Recursion, Factorial Function, Fibonacci numbers, Binary Search, Hanoi Towers, Recursion chain.'),
(21, 6, 'Trees', 'Definitions, Binary Trees and Traversals, Binary Search Trees, Insertion and Delete Operations. Example Questions and Solutions.'),
(21, 7, 'Trees (continued)', 'Definitions, Binary Trees and Traversals, Binary Search Trees, Insertion and Delete Operations. Example Questions and Solutions.'),
(21, 8, 'Midterm exam', 'Midterm evaluation.'),
(21, 9, 'Comparison of Algorithms', 'Algorithm Complexity and Analysis of Time Complexity, Efficiencies of Sorting Algorithms.'),
(21, 10, 'Graphs 1', 'Graph Definitions and Applications. Representation, Adjacency Matrix, Graph Traversals, Depth-First Traversal, Breadth-First Traversal.'),
(21, 11, 'Graphs 2', 'Shortest Path Algorithms (Dijkstra''s, Floyd-Warshall), Minimum Spanning Tree (MST) Algorithms (Prim''s, Kruskal''s).'),
(21, 12, 'Balanced Trees and Heaps', 'Balanced Trees (AVL Trees, B-Tree, B+ Tree, ...), Trie, Heap. AVL Tree - Insertion.'),
(21, 13, 'Hash Table and Dynamic Programming', 'Hash Table. C# Collections: Stack, ArrayList, Hashtable, sort, binarySearch. Dynamic Programming.'),
(21, 14, 'Advanced Problems', 'Advanced and state-of-the-art problem examples and applications, NP-Complete Problems.'),
(21, 15, 'Topological Sorting and Final Review', 'Topological Sorting, Huffman Encoding Tree, Evaluation of the Course.'),
(21, 16, 'Final Exam', 'Final Examination.');

INSERT INTO learning_outcomes (
course_id,
outcome_number,
outcome_text
) VALUES 
(21, 1, 'To be able to comprehend and use basic concepts, data types, structures and commands in an object-oriented and new programming language. Ability to express their solutions in an object-oriented programming language.'),
(21, 2, 'Ability to produce different, effective and quick solutions to problems using data structures.'),
(21, 3, 'Organizing data in computer programs for different forms and structures. Designing data structures efficiently in software development. Writing efficient algorithms by choosing suitable data structures.'),
(21, 4, 'To use data structures provided by the software development environments.'),
(21, 5, 'Being able to write programs containing Data Structures. In this context, to be able to prepare projects and to present as project reports in written form.'),
(21, 6, 'To contribute the problem solutions in group studies.'),
(21, 7, 'To use data structures concepts in state-of-the-art problems.'),
(21, 8, 'Being able to represent linear data structures, and make add, delete, search, sort and traverse operations.'),
(21, 9, 'To be able to represent Tree and Graph data structures, and perform operations such as adding and deleting, searching and traversing on them.');

INSERT INTO course_resources (
course_id,
resource_name,
resource_type
) VALUES 
(21, 'Lafore, R., "Data Structures and Algorithms in Java", Second Edition, Sams Publishing, (2003)', 'Textbook'),
(21, 'Goodrich, M.T., Tamassia, R., "Data Structures and Algorithms in Java 6th Edition", Wiley, 2014', 'Recommended'),
(21, 'Drozdek, A., "Data Structures and Algorithms in Java 4th Edition", Cengage Learning Asia, 2013', 'Recommended'),
(21, 'Weiss, M.A., "Data Structures and Problem Solving Using Java (Fourth Edition)", Addison-Wesley, 2010', 'Recommended');

INSERT INTO course_activities VALUES
(21, 'Midterm Exam', 'Exam', 20, 17,1),
(21, 'Homework Assignments', 'Homework', 20,24,4),
(21, 'Final Exam', 'Final', 60, 23,1);

select *
from course;



INSERT INTO course (
course_id,
dept_id,
semester_num,
course_code,
course_name,
course_type,
course_level,
course_description,
course_goal,
teaching_method,
teoric_hours,
lab_hours,
acts,
course_lang
) VALUES (
22,
2,
5,
'501003222023',
'INTRODUCTION TO DATABASES',
'Mandatory',
'Undergraduate',
'Introduction to Databases, Relational Data Model and SQL, Conceptual Modeling and Database Design, Database Normalization Theory, Query Processing, Query Optimization and Database Tuning, Transaction Processing and Concurrency Control, New Generation Database Applications',
'The aim of the course is to let the students to know and understand database concept, to learn the concepts of relational model, to learn and use SQL statements to realize the conceptual modeling, to iterate the conceptual model to relational model using database modeling principles, to learn database normalization theory and its effect to database design, to learn and apply query processing, optimization and database tuning, to realize the importance of the concepts of transaction processing and of concurrency control and their position in database applications, to comprehend new generation database technologies.',
'Face to Face',
3.00,
0.00,
6.00,
'English'
);

INSERT INTO faculty_members (
faculty_id,
firstname,
lastname
) VALUES (
102,
'Murat Osman',
'ÜNALIR'
);

INSERT INTO lecturer (
faculty_id,
title
) VALUES (
102,
'Prof. Dr.'
);

INSERT INTO instructor (
faculty_id
) VALUES (
102
);

INSERT INTO section (
section_id,
course_id,
instructor_id,
coord_id
) VALUES (
1002,
22,
102,
NULL
);

INSERT INTO course_topics (
course_id,
week_number,
topic_name,
topic_brief
) VALUES 
(22, 1, 'Database and Database Users Database System Concepts and Architecture', 'Problem solving Chapter 1-2'),
(22, 2, 'Relational Data Model and Relational Database Constraints', 'Problem solving Chapter 3'),
(22, 3, 'Basic SQL', 'Problem solving Chapter 4'),
(22, 4, 'Advanced SQL: Complex Queries, Triggers, Views, Schema Update', 'Problem solving Chapter 5'),
(22, 5, 'Relational Algebra and Relational Calculus', 'Problem solving Chapter 6'),
(22, 6, 'Data Modeling with ER', 'Problem solving Chapter 7'),
(22, 7, 'EER Modeling', 'Problem solving Chapter 8'),
(22, 8, 'Midterm Exam', 'Midterm'),
(22, 9, 'Relational Database Design from ER and EER using Relational Mapping Practical Database Design Methodology and UML Diagrams', 'Problem solving Chapter 9-10'),
(22, 10, 'Fundamentals of Functional Dependency and Normalization', 'Problem solving Chapter 15'),
(22, 11, 'Relational Database Design Algorithms and Advanced Dependencies', 'Problem solving Chapter 16'),
(22, 12, 'Algorithms for Query Processing and Optimization Physical Database Design and Tuning', 'Problem solving Chapter 19-20'),
(22, 13, 'Introduction to Transaction Processing and Theory', 'Problem solving Chapter 21'),
(22, 14, 'Concurrency Control Techniques', 'Problem solving Chapter 22'),
(22, 15, 'Introduction to Information Retrieval and Web Crawling', 'Problem solving Chapter 27'),
(22, 16, 'Final Exam', 'Final');

INSERT INTO learning_outcomes (
course_id,
outcome_number,
outcome_text
) VALUES 
(22, 1, 'To explain the concept of database.'),
(22, 2, 'To list the components of database architecture.'),
(22, 3, 'To describe the concepts of relational model and to use them and to give their examples.'),
(22, 4, 'To apply relational database operations.'),
(22, 5, 'To explain relationship type, relationship set, role and structural constraints and to specify the differences among them.'),
(22, 6, 'To use notational details related to ER diagrams.'),
(22, 7, 'To list the rules and constraints of normal forms.'),
(22, 8, 'To apply selectivity and cost computing in query optimization.');

INSERT INTO course_resources (
course_id,
resource_name,
resource_type
) VALUES 
(22, 'Fundamentals of Database Systems: Global Edition, 6/E Ramez Elmasri ve Shamkrant Navathe 2011, ISBN: 0132144980', 'Textbook');

INSERT INTO course_activities (
course_id,
activity_name,
activity_type,
weight,
count,
workload
) VALUES 
(22, 'Midterm', 'Exam', 35, 24 , 1),
(22, 'Final', 'Exam', 30, 30 , 1),
(22, 'Project', 'Project', 35, 42 , 1);

select *
from course;


INSERT INTO course (
course_id,
dept_id,
semester_num,
course_code,
course_name,
course_type,
course_level,
course_description,
course_goal,
teaching_method,
teoric_hours,
lab_hours,
acts,
course_lang
) VALUES (
23,
2,
5,
'501003602022',
'Artificial Intelligence Methods',
'Mandatory',
'Undergraduate',
'Artificial Intelligence (AI), Search Algorithms, Breadth-First Search, Depth-First Search, Depth Limited Search, Iterative Deepening Search, A Algorithm, Hill Climbing, Simulated Annealing; Optimization Methods; Metaheuristics; Genetic Algorithms; Machine Learning Methods; Application Areas: Al In Image Processing, Al in Computer Games.',
'The goal of the course is to introduce the students to the major topics in Al and to keep up with recent developments. To teach the fundemantal methods and algorithms; To make students develop projects in Artificial Intelligence and Application Areas.',
'Face to Face',
3.00,
0.00,
5.00,
'English'
);

INSERT INTO faculty_members (
faculty_id,
firstname,
lastname
) VALUES (
211,
'Aybars',
'UĞUR'
);

INSERT INTO lecturer (
faculty_id,
title
) VALUES (
211,
'Prof. Dr.'
);

INSERT INTO instructor (
faculty_id
) VALUES (
211
);

INSERT INTO section (
section_id,
course_id,
instructor_id,
coord_id
) VALUES (
2101,
23,
211,
NULL
);

INSERT INTO course_topics (
course_id,
week_number,
topic_name,
topic_brief
) VALUES 
(23, 1, 'Introduction to Artificial Intelligence', 'Introduction to Artificial Intelligence.'),
(23, 2, 'Definition and Importance of Al', 'Goals, Topics, Application Areas, Research Areas, Al Languages.'),
(23, 3, 'Search Methods I', 'Uninformed (Blind) Search, BFS (Breadth-First Search), DFS (Depth-First Search), Depth Limited Search, Iterative Deepening Search.'),
(23, 4, 'Search Methods II', 'Informed (Heuristic) Search (Best First Search, A*) and Heuristics; Local Search (Hill Climbing and Simulated Annealing).'),
(23, 5, 'Optimization Methods', 'Optimization Methods, Metaheuristics and Genetic Algorithms.'),
(23, 6, 'Machine Learning (ML)', 'ML in Python and Matlab Environments, ML Libraries, Software, Application Areas, Job Opportunities.'),
(23, 7, 'Application Areas I', 'Image Processing and Object Recognition.'),
(23, 8, 'Application Areas II', 'Computer Graphics, Computer Games and Al.'),
(23, 9, 'Midterm Exam', 'Midterm Exam'),
(23, 10, 'Other Topics and Methods', 'Other Topics and Methods.'),
(23, 11, 'Presentations', 'Presentations'),
(23, 12, 'Presentations', 'Presentations'),
(23, 13, 'Presentations', 'Presentations'),
(23, 14, 'Presentations', 'Presentations'),
(23, 15, 'Presentations', 'Presentations'),
(23, 16, 'Final Exam', 'Final Exam');

INSERT INTO learning_outcomes (
course_id,
outcome_number,
outcome_text
) VALUES 
(23, 1, 'To learn basic concepts and techniques of Artificial Intelligence, and to gain ability to apply. To recognize the role of Artificial Intelligence in computer engineering and computer science.'),
(23, 2, 'To introduce and to learn ability to use popular Artificial Intelligence Tools. To enable to develop Artificial Intelligence projects in recent programming platforms (like Python, Java and C#) after learning basic knowledge.'),
(23, 3, 'To learn developing Al programs. To learn how to make machines and software intelligent.'),
(23, 4, 'To do research in state-of-the-art subjects of Al area; preparing and doing presentation. To gain experience in reading papers in Al.'),
(23, 5, 'Ability to understand, write and use Uninformed Search, Heuristic Search, Local Search Methods and Genetic Algorithms to solve problems.'),
(23, 6, 'Being able to express the differences of Machine Learning paradigms and using machine learning methods to solve problems such as classification, prediction and clustering.');

INSERT INTO course_resources (
course_id,
resource_name,
resource_type
) VALUES 
(23, 'Prof. Dr. Çetin Elmas, 2011, "Yapay Zeka Uygulamaları", 2. Baskı, Seçkin Yayıncılık, 425 s.', 'Textbook'),
(23, 'Russell, S.J. And Norvig, P., "Artificial Intelligence: A Modern Approach, Fourth Edition", Pearson, 2020. (AIMA)', 'Reference');

INSERT INTO course_activities (
course_id,
activity_name,
activity_type,
weight,
count,
workload
) VALUES 
(23, 'Midterm', 'Exam', 24, 22, 1),
(23, 'Final', 'Exam', 36, 32, 1),
(23, 'Project', 'Project',40, 36, 2);

select *
from course;

INSERT INTO course (
course_id,
dept_id,
semester_num,
course_code,
course_name,
course_type,
course_level,
course_description,
course_goal,
teaching_method,
teoric_hours,
lab_hours,
acts,
course_lang
) VALUES (
24,
2,
5,
'501003522015',
'Analyis of algorithms',
'Mandatory',
'Undergraduate',
'Basic definitions and data structures. Introduction to algorithms analysis. Complexity of time and space. Standard algorithm design techniques: Divide-and-Conquer method, dynamic programming, Branch-and-Bound, back-step-throwing, Iterative Improvement etc. methods. Basic algorithms; sorting and searching algorithms, graph algorithms. Introduction to complexity classes. Introduction to NP-hard and NP-Complete Problems',
'This course teaches students to use the fundamental algorithms and algorithm design techniques in designing solutions to real-life problems. The purposes of this course, students (i) to design new algorithms for a problem using methods discussed in the course, (ii) to analyze an algorithm according to various performance criteria such as memory usage and running time, (iii) to choose the most appropriate algorithm for the problem to be solved (iv) to teach the knowledge and skills for an efficient way to apply an algorithm',
'Face to Face',
3.00,
0.00,
5.00,
'English'
);

INSERT INTO faculty_members (
faculty_id,
firstname,
lastname
) VALUES (
212,
'Hasan',
'BULUT'
);

INSERT INTO lecturer (
faculty_id,
title
) VALUES (
212,
'Assoc. Prof. Dr.'
);

INSERT INTO instructor (
faculty_id
) VALUES (
212
);

INSERT INTO section (
section_id,
course_id,
instructor_id,
coord_id
) VALUES (
2102,
24,
212,
NULL
);

INSERT INTO course_topics (
course_id,
week_number,
topic_name,
topic_brief
) VALUES 
(24, 1, 'Basics of Algorithm Analysis', 'Analysis Framework: Ο, Θ, Ω notations Mathematical Analysis: recursion and non-recursion algorithms'),
(24, 2, 'Basics of Algorithm Analysis', 'Analysis Framework: Ο, Θ, Ω notations Mathematical Analysis: recursion and non-recursion algorithms'),
(24, 3, 'Brute Force', 'Brute Force Algorithm Consumer search method'),
(24, 4, 'Divide and Conquer', 'Divide and Conquer: Merge Sort Quick Sort, Binary Search'),
(24, 5, 'Decrease and Conquer', 'One-to-Decrease: Insertion Sort, DFS/BFS, topological sorting Fixed-to-Decrease, variable-size reduction'),
(24, 6, 'Transform and Conquer', 'Simplification Example: Gaussian Elimination, Balanced Search Trees Change Presentation: Horner''s rule and the binary exponent Problem Reduction'),
(24, 7, 'Space and Time Trade-off', 'Space/Time Trade-off: Sequence matching, Hashing, B-Trees'),
(24, 8, 'Midterm exam', 'Midterm exam'),
(24, 9, 'Dynamic Programming', 'Binomial Coefficients, Warshall and Floyd Algorithm, Knapsack Problem'),
(24, 10, 'Dynamic Programming', 'Binomial Coefficients, Warshall and Floyd Algorithm, Knapsack Problem'),
(24, 11, 'Greedy Technique', 'Ambitious Algorithms: Prim and Kruskal algorithms, Dijkstra''s Algorithm, Huffman Trees'),
(24, 12, 'Ambitious Technique', 'Ambitious Algorithms: Prim and Kruskal algorithms, Dijkstra''s Algorithm, Huffman Trees'),
(24, 13, 'Iterative Improvement', 'Iterative Improvement: Simplex Method, Maximum Flow, Maximum Matching, Stable Marriage Problem'),
(24, 14, 'Limitations of Algorithm Power', 'Sub-limit arguments, P, NP and NP-complete problems, Numerical Algorithms'),
(24, 15, 'Coping with the Limitations of Algorithm Power', 'Back-step-throwing, Branch-and-bound, Non-Linear Equations Approximation Algorithms for NP-hard problems, genetic algorithms'),
(24, 16, 'Final Exam', 'Final Exam');

INSERT INTO learning_outcomes (
course_id,
outcome_number,
outcome_text
) VALUES 
(24, 1, 'To use the mathematical information necessary for the algorithm analysis'),
(24, 2, 'To analyze spatial and temporal complexity of algorithms'),
(24, 3, 'To increase performance making changes based on spatial and temporal complexity of algorithms'),
(24, 4, 'To understand the algorithm design techniques'),
(24, 5, 'To design algorithms for new problems by algorithm design techniques'),
(24, 6, 'To select the most suitable algorithmic technique for the problem to be solved'),
(24, 7, 'To divide a problem to sub-problems');

INSERT INTO course_resources (
course_id,
resource_name,
resource_type
) VALUES 
(24, 'Introduction to the Design & Analysis of Algorithms, Anany Levitin, Addison Wesley; 2 edition, 2006 ISBN-10: 0321358287 ISBN-13: 978-0321358288', 'Textbook'),
(24, 'Algorithm Design, Jon Kleinberg, Éva Tardos, Addison Wesley; 2006; ISBN10-: 0321372913 ISBN-13:9780321372918', 'Reference'),
(24, 'Introduction to Algorithms, Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein, The MIT Press 2nd edition, 2001 ISBN-10: 0262032937 ISBN-13: 978-0262032933', 'Reference');

INSERT INTO course_activities (
course_id,
activity_name,
activity_type,
weight,
count,
workload
) VALUES 
(24, 'Midterm Examination', 'Exam', 40.00, 22, 1),
(24, 'Final Examination', 'Exam', 60.00, 32, 1);

select *
from course;

INSERT INTO course (
course_id,
dept_id,
semester_num,
course_code,
course_name,
course_type,
course_level,
course_description,
course_goal,
teaching_method,
teoric_hours,
lab_hours,
acts,
course_lang
) VALUES (
25,
2,
1,
'501001272023',
'Fundamentals of computer science',
'Mandatory',
'Undergraduate',
'An overview of computer science. Data storage. Data representation and manipulation. Operating systems. Computer networks, WWW, and Internet. Algorithms. Programming languages. Introduction to object oriented software development. Software engineering. Database systems. Artificial intelligence. Computer Security.',
'The objective of this course is to supply making students coming from secondary education with different levels of computer literacy to understand the basic concepts of computer science in a right manner, making the whole class to reach the same level about the basic information and making students to recognize the lessons, in which they will see during the three years following, at the introduction level and to recognize the links between them.',
'Face to Face',
3.00,
0.00,
5.00,
'English'
);

INSERT INTO faculty_members (
faculty_id,
firstname,
lastname
) VALUES (
213,
'Özgü',
'CAN'
);

INSERT INTO lecturer (
faculty_id,
title
) VALUES (
213,
'Assoc. Prof. Dr.'
);

INSERT INTO instructor (
faculty_id
) VALUES (
213
);

INSERT INTO section (
section_id,
course_id,
instructor_id,
coord_id
) VALUES (
2103,
25,
213,
NULL
);

INSERT INTO course_topics (
course_id,
week_number,
topic_name,
topic_brief
) VALUES 
(25, 1, 'Introduction to Computer Science', 'An Overview of the Course'),
(25, 2, 'An Overview of Computer Science', 'Definition of computer science. The topics that the computer science covers. Computer History.'),
(25, 3, 'Data Storage', 'Data representation. Primary and secondary storage.'),
(25, 4, 'Data manipulation', 'Parts of CPU. Machine language and machine cycle. Program execution. Arithmetic and logic instructions. Main memory and communication of CPU with other devices. Other machine architectures.'),
(25, 5, 'Operating Systems', 'Introduction to the theory of operating systems and basic concepts.'),
(25, 6, 'Computer Networks, WWW and Internet', 'Network fundamentals. Basic concepts related with WWW and Internet.'),
(25, 7, 'Algorithms', 'Basic concepts. Algorithm representation. Iterative structures. Recursive structures. Efficiency.'),
(25, 8, 'Midterm exam', 'Midterm exam'),
(25, 9, 'Programming Languages', 'Historical perspective. Basic concepts. Procedural units. Concurrent and declarative programming.'),
(25, 10, 'Introduction to Object Oriented Software Development', 'Introducing the basic concepts of object oriented analysis and design. Introducing the basic concepts and structures of object oriented programming. Examples for constructing classes and objects using Java programming language. Implementing inheritance using Java.'),
(25, 11, 'Software Engineering', 'The software engineering discipline. Software engineering life cycle. Software engineering methodologies. Modularity. Tools. Software testing. Quality assurance. Documentation. Human-machine interface. Software ownership and liability.'),
(25, 12, 'Database Systems', 'Basic concepts. Relational model and SQL. Data warehouse and data mining, Defining database tables using a relational database management system. The practice of data definition and constructing SQL queries.'),
(25, 13, 'Artificial Intelligence', 'Intelligence and machines. Perception. Reasoning. Knowledge representation. Artificial neural networks. Robotics.'),
(25, 14, 'Security', 'Information Security Computer Security, Network Security, Privacy'),
(25, 15, 'Computer Ethics', 'Computer Ethics'),
(25, 16, 'Final Exam', 'Final Exam');

INSERT INTO learning_outcomes (
course_id,
outcome_number,
outcome_text
) VALUES 
(25, 1, 'To describe the basic concepts related with hardware and data representations.'),
(25, 2, 'To describe the basic concepts related with operating systems.'),
(25, 3, 'To describe basic concepts related with computer networks, WWW, and Internet.'),
(25, 4, 'To describe the basic concepts related with algorithms and programming languages.'),
(25, 5, 'To comprehend program development processes and programming methodologies/paradigms.'),
(25, 6, 'To describe the basic concepts related with software engineering.'),
(25, 7, 'To describe the basic concepts related with relational database systems.'),
(25, 8, 'To employ a relational database management system for gaining the ability of constructing database tables and SQL queries.'),
(25, 9, 'To describe the basic concepts related with artificial intelligence.'),
(25, 10, 'To describe the fundamental concepts of computer security'),
(25, 11, 'To recognize code of ethics for computer professionals.');

INSERT INTO course_resources (
course_id,
resource_name,
resource_type
) VALUES 
(25, 'Brookshear, J. G., "Computer Science: An Overview", 13th edition, Pearson Education Inc., 2020.', 'Textbook');

INSERT INTO course_activities (
course_id,
activity_name,
activity_type,
weight,
count,
workload
) VALUES 
(25, 'Midterm', 'Exam', 40, 32, 1),
(25, 'Final', 'Exam', 60, 42, 1);

INSERT INTO course (
    course_id, dept_id, semester_num, course_code, course_name, 
    course_type, course_level, course_description, course_goal, 
    teaching_method, teoric_hours, lab_hours, acts, course_lang
) VALUES (
    31, 3, 3, 'CE 221', 'Data Structures and Algorithms I', 
    'Required', 'Undergraduate', 
    'Algorithm analysis, linear data structures, trees, hashing, priority queues, sorting, and graph algorithms.', 
    'The objective of this course is to teach students the notion of an abstract data type (ADT) which is central to the design and analysis of computer algorithms.', 
    'Face-To-Face', 3, 2, 7, 'English'
);


INSERT INTO faculty_members (faculty_id, firstname, lastname) VALUES 
    (301, 'Cem', 'Evrendilek'),
    (302, 'Kaya', 'Oğuz'),
    (303, 'Çağlar', 'Durmaz'),
    (304, 'Melek Büşra', 'Temuçin');

INSERT INTO lecturer (faculty_id, title) VALUES 
    (301, 'Prof. Dr.'), 
    (302, 'Dr.'), 
    (303, 'Dr.');

INSERT INTO assistant (faculty_id) VALUES 
    (304);

INSERT INTO instructor (faculty_id) VALUES 
    (301), 
    (302), 
    (303);

INSERT INTO coordinator (faculty_id) VALUES 
    (301);

INSERT INTO section (section_id, course_id, instructor_id, coord_id) VALUES 
    (3001, 31, 301, 301),
    (3002, 31, 302, 301),
    (3003, 31, 303, 301);

INSERT INTO assist (faculty_id, section_id) VALUES 
    (304, 3001);

INSERT INTO course_topics (course_id, week_number, topic_name, topic_brief) VALUES 
    (31, 1, 'Introduction: Mathematics Review and Recursion', 'Algorithm Analysis in Java, Ch. 1.1-1.3'),
    (31, 2, 'Algorithm Analysis', 'Basic concepts, runtimes, Big-Oh notations. Ch. 2.1-2.3'),
    (31, 3, 'Algorithm Analysis and Linear Data Structures', 'Linked Lists. Ch. 2.4, 3.1-3.5'),
    (31, 4, 'Linear Data Structures', 'Linked Lists, Stacks, Stack Applications. Ch. 3.5, 3.6'),
    (31, 5, 'Linear Data Structures and Trees', 'Queues and Binary trees. Ch. 3.7, 4.1, 4.2'),
    (31, 6, 'Trees (Binary search trees)', 'Ch. 4.3'),
    (31, 7, 'Trees (AVL Trees)', 'Ch. 4.4'),
    (31, 8, 'Midterm', 'Midterm Examination'),
    (31, 9, 'Hashing', 'Ch. 5.1-5.5'),
    (31, 10, 'Priority Queues: Binary Heaps', 'Ch. 6.1-6.3'),
    (31, 11, 'Sorting (Part 1)', 'Insertion Sort, Shellsort, Heapsort. Ch. 7.1-7.5'),
    (31, 12, 'Sorting (Part 2)', 'Mergesort, Quicksort. Ch. 7.6, 7.7'),
    (31, 13, 'Graph Algorithms (Part 1)', 'Definitions, Representation, Topological Sort. Ch. 9.1-9.2'),
    (31, 14, 'Graph Algorithms (Part 2)', 'Shortest Path Algorithms. Ch. 9.3'),
    (31, 15, 'Semester Review', 'Review of semester topics'),
    (31, 16, 'Final Exam', 'Final Examination');

INSERT INTO learning_outcomes (course_id, outcome_number, outcome_text) VALUES 
    (31, 1, 'Will be able to analyze the loop structures of either recursive or non-recursive algorithms to express their asymptotic running times using big-Oh notation.'),
    (31, 2, 'Will be able to assess the relative advantages of using array or linked list implementations versus hashing in efficiently solving search problems.'),
    (31, 3, 'Will be able to develop efficient computer programs running in O(log n) per searching, insertion and/or deletion of data items by employing correct variants of tree data structures.'),
    (31, 4, 'Will be able to select the right sorting algorithm for efficient applications requiring an order on data items.'),
    (31, 5, 'Will be able to describe the usage of various data structures.'),
    (31, 6, 'Will be able to explain the operations for maintaining common data structures.'),
    (31, 7, 'Will be able to devise appropriate data structures for solving specific computing problems.'),
    (31, 8, 'Will be able to use various graph algorithms to design solutions to simple computing problems.');

INSERT INTO course_resources (course_id, resource_name, resource_type) VALUES 
    (31, 'M. A. Weiss. Data Structures and Algorithm Analysis in Java. 3/e. Pearson. 2012.', 'Textbook'),
    (31, 'R. Sedgewick. K. Wayne. Algorithms. 4/e. Addison-Wesley Professional. 2011.', 'Recommended');

INSERT INTO course_activities (course_id, activity_name, activity_type, weight, count, workload) VALUES 
     (31, 'Laboratories / Application', 'Laboratory', 40, 1, 32),   
    (31, 'Midterm Exam', 'Exam', 20, 1, 24),
    (31, 'Final Exam', 'Exam', 40, 1, 25);



INSERT INTO course (
    course_id, dept_id, semester_num, course_code, course_name, 
    course_type, course_level, course_description, course_goal, 
    teaching_method, teoric_hours, lab_hours, acts, course_lang
) VALUES (
    32, 3, 1, 'SE 115', 'Introduction to Programming I', 
    'Mandatory', 'Undergraduate', 
    'This course introduces the students to the fundamental concepts of programming using Java programming language.', 
    'This course will introduce the basic elements of structural programming. Java programming language will be used in code applications. Topics include the concept of type, main types, expressions, standard functions, input/output statements, control structures, selection statements, repetition statements, functions, modularity in programming, global and local variables, dynamic variables, and arrays.', 
    'Face-To-Face', 2, 2, 6, 'English'
);

INSERT INTO faculty_members (faculty_id, firstname, lastname) VALUES 
    (305, 'Erdem', 'Okur'),
    (306, 'Hüseyin', 'Akcan'),
    (307, 'Hande', 'Aka Uymaz'),
    (308, 'Kutluhan', 'Erol'),
    (309, 'Serhat', 'Uzunbayır'),
    (310, 'Senem', 'Kumova Metin'),
    (311, 'Tugay', 'Direk'),
    (312, 'Çınar', 'Gedizlioğlu'),
    (314, 'Deniz Eren', 'Terziler'),
    (315, 'Semih', 'Yağcı');

INSERT INTO lecturer (faculty_id, title) VALUES 
    (305, 'Dr.'), 
    (306, 'Prof. Dr'),
    (307, 'Dr.'),
    (308, 'Dr.'),
    (309, 'Dr.'),
    (310, 'Prof. Dr.');

INSERT INTO assistant (faculty_id) VALUES 
    (311), (312), (314), (315);

select * from assistant;

INSERT INTO instructor (faculty_id) VALUES 
    (305), (306), (307), (308), (309), (310);

INSERT INTO coordinator (faculty_id) VALUES 
    (305);

/* Section IDs start from 3004 to continue from previous course (CE 221 used 3001-3003) */
INSERT INTO section (section_id, course_id, instructor_id, coord_id) VALUES 
    (3004, 32, 305, 305),
    (3005, 32, 306, 305),
    (3006, 32, 307, 305),
    (3007, 32, 308, 305),
    (3008, 32, 309, 305),
    (3009, 32, 310, 305);

/* Distributing assistants to sections */
INSERT INTO assist (faculty_id, section_id) VALUES 
    (311, 3004),
    (312, 3005),
    (304, 3006),
    (314, 3007),
    (315, 3008);

INSERT INTO course_topics (course_id, week_number, topic_name, topic_brief) VALUES 
    (32, 1, 'Introduction', 'Deitel Chapters 1 and 2'),
    (32, 2, 'Variables', 'Deitel Chapter 2'),
    (32, 3, 'Control', 'Deitel Chapters 4 and 5'),
    (32, 4, 'Loop', 'Deitel Chapters 4 and 5'),
    (32, 5, 'Functions', 'Deitel Chapter 6'),
    (32, 6, 'Recursion', 'Deitel Chapter 18'),
    (32, 7, 'Arrays', 'Deitel Chapter 7'),
    (32, 8, 'Midterm', 'Midterm Exam'),
    (32, 9, 'Arrays II', 'Deitel Chapter 7'),
    (32, 10, 'Introduction to Classes', 'Deitel Chapter 3'),
    (32, 11, 'Introduction to Classes II', 'Deitel Chapter 3'),
    (32, 12, 'Text Processing', 'Deitel Chapter 14'),
    (32, 13, 'File I/O', 'Deitel Chapter 15'),
    (32, 14, 'Algorithms', 'Deitel Chapters 4 and 19'),
    (32, 15, 'Exercises', 'General Review and Exercises'),
    (32, 16, 'Review of the Semester', 'Semester Review');

INSERT INTO learning_outcomes (course_id, outcome_number, outcome_text) VALUES 
    (32, 1, 'Will be able to define the fundamental concepts in programming'),
    (32, 2, 'Will be able to write, compile and debug programs in Java language'),
    (32, 3, 'Will be able to use control structures (decision and loop statements) in Java codes'),
    (32, 4, 'Will be able to design functions in Java codes'),
    (32, 5, 'Will be able to use arrays in Java codes'),
    (32, 6, 'Will be able to define classes in Java codes');

INSERT INTO course_resources (course_id, resource_name, resource_type) VALUES 
    (32, 'Java How to Program 10/e (Early Objects) Global Edition, Paul Deitel, Harvey Deitel, Pearson', 'Textbook'),
    (32, 'Introduction to Programming Using Java v.7 David J. Eck', 'Recommended'),
    (32, 'Evan Jones, Adam Marcus and Eugene Wu, 6.092 Introduction to Programming in Java, MIT OpenCourseWare', 'Recommended'),
    (32, 'zyBook Java Early Objects', 'Recommended');

INSERT INTO course_activities (course_id, activity_name, activity_type, weight, count, workload) VALUES 
    
    (32, 'Quizzes ', 'Exam', 15, 3, 6),
    (32, 'Project', 'Project', 20, 1, 25),
    (32, 'Midterm Exam', 'Exam', 25, 1, 10),
    (32, 'Final Exam', 'Exam', 40, 1, 15);



INSERT INTO course (
    course_id, dept_id, semester_num, course_code, course_name, 
    course_type, course_level, course_description, course_goal, 
    teaching_method, teoric_hours, lab_hours, acts, course_lang
) VALUES (
    33, 3, 2, 'SE 116', 'Introduction to Programming II', 
    'Mandatory', 'Undergraduate', 
    'This course covers the fundamental concepts of object-oriented programming using Java programming language.', 
    'This course aims to provide the students with general principles underlying the practice of object-oriented programming using Java programming language. In this course, the students will learn the main concepts of object-oriented programming including classes, objects, data members, methods, inheritance, and polymorphism. Object-oriented programming techniques such as implementation of inheritance and polymorphism using abstract classes will also be covered.', 
    'Face-To-Face', 2, 2, 6, 'English'
);




INSERT INTO section (section_id, course_id, instructor_id, coord_id) VALUES 
    (3010, 33, 305, 305),
    (3011, 33, 306, 305),
    (3012, 33, 303, 305),
    (3013, 33, 307, 305),
    (3014, 33, 308, 305);


INSERT INTO assist (faculty_id, section_id) VALUES 
    (311, 3010),
    (312, 3011),
    (304, 3012),
    (315, 3013);


INSERT INTO course_topics (course_id, week_number, topic_name, topic_brief) VALUES 
    (33, 1, 'Introduction to Object Oriented Programming', 'OO Design Principles (Abstraction, Encapsulation, Modularity), Classes. Deitel Ch 3, 8'),
    (33, 2, 'Thinking in Objects', 'Deitel Ch 3, 8'),
    (33, 3, 'Java Collections Framework', 'Deitel Ch 16'),
    (33, 4, 'Extending Classes (Inheritance)', 'The Object Class, Annotations, Packages, Nested Classes. Deitel Ch 9'),
    (33, 5, 'Polymorphism', 'Deitel Ch 10'),
    (33, 6, 'Interfaces and Abstract Classes', 'Deitel Ch 10'),
    (33, 7, 'Exceptions', 'Deitel Ch 11'),
    (33, 8, 'Midterm exam', 'Midterm Examination'),
    (33, 9, 'Streams, Buffers, Serialization', 'Deitel Ch 15'),
    (33, 10, 'Text Processing with Regular Expressions', 'Deitel Ch 14'),
    (33, 11, 'Generic Classes and Methods', 'Deitel Ch 20'),
    (33, 12, 'Best Practices I', 'Effective Java'),
    (33, 13, 'Best Practices II', 'Effective Java'),
    (33, 14, 'Project Presentations', 'Student Project Presentations'),
    (33, 15, 'Review of the Semester', 'General Review'),
    (33, 16, 'Final Exam', 'Final Examination');


INSERT INTO learning_outcomes (course_id, outcome_number, outcome_text) VALUES 
    (33, 1, 'Define classes in Java programming language.'),
    (33, 2, 'Define the features of object-oriented programming languages.'),
    (33, 3, 'Develop programs in Java programming language using objects.'),
    (33, 4, 'Use inheritance technique in class designs with Java programming language.'),
    (33, 5, 'Implement polymorphism concept in Java programming language.');


INSERT INTO course_resources (course_id, resource_name, resource_type) VALUES 
    (33, 'Java How to Program 10/e (Early Objects) Global Edition, Paul Deitel and Harvey Deitel, Pearson', 'Textbook'),
    (33, 'Effective Java Third Edition, Joshua Bloch, Addison-Wesley', 'Recommended'),
    (33, 'Available Java tutorials on the Web (such as https://www.tutorialspoint.com/java)', 'Recommended');


INSERT INTO course_activities (course_id, activity_name, activity_type, weight, count, workload) VALUES 
    (33, 'Laboratories / Application', 'Laboratory', 10, 1, 32),
    (33, 'Project', 'Project', 20, 1, 25),
    (33, 'Midterm Exam', 'Exam', 30, 1, 9),
    (33, 'Final Exam', 'Exam', 40, 1, 12);


INSERT INTO prerequisites (offer_course_id, preq_course_id) VALUES (33, 32);

select * from course;


INSERT INTO course (
    course_id, dept_id, semester_num, course_code, course_name, 
    course_type, course_level, course_description, course_goal, 
    teaching_method, teoric_hours, lab_hours, acts, course_lang
) VALUES (
    34, 3, 3, 'CE 215', 'Discrete Mathematics for Computer Science', 
    'Mandatory', 'Undergraduate', 
    'Topics include Boolean algebra, logic, set theory, relations and functions, graph theory, counting, combinatorics, and basic probability theory.', 
    'This course seeks to place on solid foundations the most common structures of computer science, to illustrate proof techniques, to provide the background for an introductory course in computational theory, and to introduce basic concepts of probability theory.', 
    'Face-To-Face/Online', 3, 0, 6, 'English'
);

INSERT INTO faculty_members (faculty_id, firstname, lastname) VALUES 
    (325, 'Okan', 'Yaman');         


INSERT INTO lecturer (faculty_id, title) VALUES 
    (325, 'Dr.');
 

INSERT INTO instructor (faculty_id) VALUES 
    (325);

INSERT INTO coordinator (faculty_id) VALUES 
    (325);


INSERT INTO section (section_id, course_id, instructor_id, coord_id) VALUES 
    (3015, 34, 325, 325), 
    (3016, 34, 303, 325), 
    (3017, 34, 308, 325); 


INSERT INTO assist (faculty_id, section_id) VALUES 
    (312, 3015);


INSERT INTO course_topics (course_id, week_number, topic_name, topic_brief) VALUES 
    (34, 1, 'Logic: Propositional Logic', 'Rosen, Chapter 1, Sections 1.1-1.3'),
    (34, 2, 'Logic: Predicate Logic', 'Rosen, Chapter 1, Sections 1.4, 1.5'),
    (34, 3, 'Logic: Logic and Proofs', 'Rosen, Chapter 1, Sections 1.6-1.8'),
    (34, 4, 'Sets, Functions', 'Rosen, Chapter 2, Sections 2.1-2.3'),
    (34, 5, 'Sequences and Sums', 'Rosen, Chapter 2, Section 2.4, 2.5'),
    (34, 6, 'Number Theory: Divisibility', 'Rosen, Chapter 4, Sections 4.1, 4.2'),
    (34, 7, 'Review / Midterm', 'Review and Midterm Examination'),
    (34, 8, 'Number Theory: Primes', 'Rosen, Chapter 4, Sections 4.3-4.5'),
    (34, 9, 'Mathematical Induction', 'Rosen, Chapter 5, Sections 5.1, 5.2'),
    (34, 10, 'Counting', 'Rosen, Chapter 6, Sections 6.1-6.4; Chapter 8, Section 8.5'),
    (34, 11, 'Advanced Counting Techniques', 'Rosen, Chapter 8, Sections 8.1, 8.2'),
    (34, 12, 'Advanced Counting Techniques II', 'Rosen, Chapter 8, Sections 8.3-8.5'),
    (34, 13, 'Relations', 'Rosen, Chapter 9, Sections 9.1, 9.3, 9.5, 9.6'),
    (34, 14, 'Graphs', 'Rosen, Chapter 10, Sections 10.1 - 10.8'),
    (34, 15, 'Semester Review', 'General Review'),
    (34, 16, 'Final Exam', 'Final Examination');


INSERT INTO learning_outcomes (course_id, outcome_number, outcome_text) VALUES 
    (34, 1, 'State a logical argument'),
    (34, 2, 'Practically use fundamental mathematical notation and concepts'),
    (34, 3, 'Practice basic concepts of mathematical proof (direct proof, proof by contradiction, mathematical induction)'),
    (34, 4, 'Solve elementary combinatorial and counting problems'),
    (34, 5, 'Identify the relations between sets and the properties of these relations');


INSERT INTO course_resources (course_id, resource_name, resource_type) VALUES 
    (34, 'Discrete Mathematics and Its Applications. Kenneth H. Rosen. 8th edition. McGraw Hill. 2018.', 'Textbook'),
    (34, 'Discrete and combinatorial mathematics: an applied introduction. R.P. Grimaldi. Fifth Edition.', 'Recommended'),
    (34, 'Discrete Mathematics for Computer Scientists. J.K. Truss. 2nd edition. Pearson. 1999.', 'Recommended');


INSERT INTO course_activities (course_id, activity_name, activity_type, weight, count, workload) VALUES 
    
    (34, 'Quizzes ', 'Exam', 10, 5, 5),
    (34, 'Midterm Exam', 'Exam', 40, 1, 40),
    (34, 'Final Exam', 'Exam', 50, 1, 45);



INSERT INTO course (
    course_id, dept_id, semester_num, course_code, course_name, 
    course_type, course_level, course_description, course_goal, 
    teaching_method, teoric_hours, lab_hours, acts, course_lang
) VALUES (
    35, 3, 4, 'CE 223', 'Database Systems', 
    'Mandatory', 'Undergraduate', 
    'Topics related to both database design and database programming are covered.', 
    'The goal of this course is to give basic knowledge of database systems to a student who intends to be a computer or software engineer. It provides a comprehensive introduction to relational data model and entity relationship data model as a design tool. Functional and multivalued dependencies in the context of normalization process are described in detail for designing relational database schema. SQL database language and system aspects of SQL such as transaction management, indexing, constraints, triggers and authorization are studied in detail.', 
    'Face-To-Face', 3, 2, 7, 'English'
);


INSERT INTO faculty_members (faculty_id, firstname, lastname) VALUES 
    (329, 'Turhan', 'Tunalı');

INSERT INTO lecturer(faculty_id, title) VALUES 
    (329, 'Prof. Dr.');

    


INSERT INTO instructor (faculty_id) VALUES 
    (329);

INSERT INTO coordinator (faculty_id) VALUES 
    (329);


INSERT INTO section (section_id, course_id, instructor_id, coord_id) VALUES 
    (3018, 35, 329, 329);


INSERT INTO assist (faculty_id, section_id) VALUES 
    (311, 3018);


INSERT INTO course_topics (course_id, week_number, topic_name, topic_brief) VALUES 
    (35, 1, 'Introduction to Database Systems', 'Relational Data Model, Semi Structured Data Model. Ullman Ch 1, 2, 11'),
    (35, 2, 'Entity-Relationship Data Model', 'Ullman Ch 4.1-4.6'),
    (35, 3, 'Introduction to Relational Databases', 'Functional Dependencies. Ullman Ch 2.4, 3.1-3.5'),
    (35, 4, 'Design of Relational Databases', 'Multivalued Dependencies. Ullman Ch 3.6, 3.7'),
    (35, 5, 'Functional Dependencies and Multivalued Dependencies Revisited', 'Ullman Ch 2.4, 3.1-3.7'),
    (35, 6, 'Introduction to SQL (Part 1)', 'Ullman Ch 6.1-6.4'),
    (35, 7, 'Introduction to SQL (Part II)', 'Ullman Ch 5.2, 6.4, 6.5'),
    (35, 8, 'Midterm', 'Midterm Examination'),
    (35, 9, 'Constraints and Triggers', 'Ullman Ch 7'),
    (35, 10, 'SQL Programming: Embedded SQL, PSM (PL/SQL)', 'Ullman Ch 9.3, 9.4'),
    (35, 11, 'SQL Programming: CLI, JDBC, PHP/PEAR', 'Ullman Ch 9.1, 9.2, 9.5-9.7'),
    (35, 12, 'Transactions, Views, Indexes', 'Ullman Ch 6.6, 8.1-8.5'),
    (35, 13, 'SQL Authorization', 'Ullman Ch 10.1'),
    (35, 14, 'Logical Query Languages (Datalog) and SQL Recursion', 'Ullman Ch 5.3, 5.4, 10.2'),
    (35, 15, 'Review of the Semester', 'General Review'),
    (35, 16, 'Final Exam', 'Final Examination');


INSERT INTO learning_outcomes (course_id, outcome_number, outcome_text) VALUES 
    (35, 1, 'Identify and define all the information needed in the design of a database schema specific to a database application'),
    (35, 2, 'Create conceptual and physical database designs for a management information system by drawing the E/R diagram and performing the normalization of relations'),
    (35, 3, 'Understand the core terms, concepts, and tools of relational database management systems'),
    (35, 4, 'Query a database using SQL'),
    (35, 5, 'Implement database applications by properly managing concurrent transactions'),
    (35, 6, 'Finetune a database design to improve the performance of applications by the use of beneficial indexes and additional data structures');


INSERT INTO course_resources (course_id, resource_name, resource_type) VALUES 
    (35, 'J. D. Ullman. J. Widom. A First Course In Database Systems. 3/e. Prentice Hall. 2008', 'Textbook'),
    (35, 'Silberschatz et. al. Database System Concepts. 4th ed. McGrawHill. 2002.', 'Recommended');


INSERT INTO course_activities (course_id, activity_name, activity_type, weight, count, workload) VALUES 
    
    (35, 'Quizzes ', 'Exam', 15, 1, 15),
    (35, 'Midterm Exam', 'Exam', 30, 1, 21),
    (35, 'Final Exam', 'Exam', 40, 1, 28);


INSERT INTO prerequisites (offer_course_id, preq_course_id) VALUES (35, 34);


INSERT INTO course (
    course_id, dept_id, semester_num, course_code, course_name, 
    course_type, course_level, course_description, course_goal, 
    teaching_method, teoric_hours, lab_hours, acts, course_lang
) VALUES (
    36, 3, 4, 'MATH 240', 'Probability for Engineers', 
    'Required', 'Undergraduate', 
    'In this course some important theorems about probability are investigated. In addition, applications of random variables and their probability distributions are discussed.', 
    'This course aims to introduce students the theory of probability and its applications to engineering problems.', 
    'Face-To-Face', 3, 0, 6, 'English'
);

select *
from course;

INSERT INTO faculty_members (faculty_id, firstname, lastname) VALUES 
    (332, 'Cemal Murat', 'Özkut'),      
    (333, 'Gözde', 'Navruz Uysal');     


INSERT INTO lecturer (faculty_id, title) VALUES 
    (332, 'Dr.');

INSERT INTO assistant (faculty_id) VALUES 
    (333);

INSERT INTO instructor (faculty_id) VALUES 
    (332);

INSERT INTO coordinator (faculty_id) VALUES 
    (332);


INSERT INTO section (section_id, course_id, instructor_id, coord_id) VALUES 
    (3021, 35, 332, 332);

INSERT INTO assist (faculty_id, section_id) VALUES 
    (333, 3021);

INSERT INTO course_topics (course_id, week_number, topic_name, topic_brief) VALUES 
    (36, 1, 'Sample space and events', 'Montgomery & Runger, Ch. 2, pp. 18-23'),
    (36, 2, 'Events and counting sample points', 'Montgomery & Runger, Ch. 2, pp. 21-26'),
    (36, 3, 'Counting sample points, probability of an event and additive rules', 'Montgomery & Runger, Ch. 2, pp. 23-31'),
    (36, 4, 'Additive rules, conditional probability of an event', 'Montgomery & Runger, Ch. 2, pp. 29-38'),
    (36, 5, 'Bayes rule', 'Montgomery & Runger, Ch. 2, pp. 39-40'),
    (36, 6, 'Concept of random variable and discrete random variable', 'Montgomery & Runger, Ch. 2 & 3, pp. 40-43'),
    (36, 7, 'Discrete probability distributions, expected value and variance of discrete random variable', 'Montgomery & Runger, Ch. 3, pp. 43-49'),
    (36, 8, 'Uniform, Binomial, Negative Binomial, Hypergeometric, Poisson distributions', 'Vaccine efficacy, epidemics, communicable diseases, traffic accidents, environmental pollution. Montgomery & Runger, Ch. 3, pp. 49-65'),
    (36, 9, 'Midterm Exam', 'Midterm Examination'),
    (36, 10, 'Continuous probability distributions, expected value and variance of continuous random variable', 'Montgomery & Runger, Ch. 4, pp. 67-72'),
    (36, 11, 'Uniform, Normal, areas under the normal curve, applications of the normal dist. and exponential distribution', 'Montgomery & Runger, Ch. 4, pp. 73-86'),
    (36, 12, 'Joint probability distributions', 'Montgomery & Runger, Ch. 5, pp. 100-113'),
    (36, 13, 'Joint probability distributions, variance and covariance', 'Montgomery & Runger, Ch. 5, pp. 100-113'),
    (36, 14, 'Multinomial distributions, linear functions of random variables, moment-generating functions', 'Montgomery & Runger, Ch. 5, pp. 113-114, 117-120, 121-124'),
    (36, 15, 'Semester review', 'General Review'),
    (36, 16, 'Final Exam', 'Final Examination');


INSERT INTO learning_outcomes (course_id, outcome_number, outcome_text) VALUES 
    (36, 1, 'Use fundamental concepts such as sample space, events and counting techniques.'),
    (36, 2, 'Use conditional probability, the total probability rule and Bayes theorem.'),
    (36, 3, 'Compute discrete and continuous random variables.'),
    (36, 4, 'Investigate the advantages of joint probability distributions and apply discrete and continuous distributions.'),
    (36, 5, 'Examine the relationship between two random variables.'),
    (36, 6, 'Find mean and variance of random variables.');
INSERT INTO course_resources (course_id, resource_name, resource_type) VALUES 
    (36, 'Douglas C. Montgomery, George C. Runger. Applied Statistics and Probability for Engineers, 7th Ed. Wiley 2018. ISBN: 978-1-119-40036-3', 'Textbook'),
    (36, 'Ronald E. Walpole, Raymond H. Myers, Sharon L. Myers, Keying Ye. Probability and Statistics for Engineers and Scientists, 9th Edition. Pearson 2017.', 'Recommended');

INSERT INTO course_activities (course_id, activity_name, activity_type, weight, count, workload) VALUES 
    
    (36, 'Quizzes', 'Exam', 10, 2, 20),
    (36, 'Midterm Exam', 'Exam', 40, 1, 30),
    (36, 'Final Exam', 'Exam', 50, 1, 40);

INSERT INTO prerequisites (offer_course_id, preq_course_id) VALUES 
    (31, 33); 
-- After all courses and equivalency are populated, insert enrollment/enrolls data

INSERT INTO equivalency (home_course_id,host_course_id,match_ratio)
SELECT
  c1.course_id,
  c2.course_id,
  r.ratio
FROM course AS c1
JOIN department AS d1 ON d1.dept_id = c1.dept_id
JOIN department AS d2 ON d2.uni_id <> d1.uni_id
JOIN course AS c2 ON c2.dept_id = d2.dept_id
 -- lateral ile c2ye erişip parametre olarka kullanbiliyoz
CROSS JOIN LATERAL (SELECT compute_course_similarity_full(c1.course_id, c2.course_id) AS ratio) as r
WHERE c1.course_id < c2.course_id

UNION ALL

SELECT
  c2.course_id,
  c1.course_id,
  r.ratio
FROM course c1
JOIN department d1 ON d1.dept_id = c1.dept_id
JOIN department d2 ON d2.uni_id <> d1.uni_id
JOIN course c2 ON c2.dept_id = d2.dept_id
CROSS JOIN LATERAL (SELECT compute_course_similarity_full(c1.course_id, c2.course_id) AS ratio) as r
WHERE c1.course_id < c2.course_id;

INSERT INTO enrollment (enrollment_id,home_course_id, host_course_id) VALUES
(1,11, 21),
(2,23, 13),
(3,33, 14),
(4,21, 31),
(5,32, 14),
(6,14, 32),
(7,31, 24),
(8,31, 11),
(9,15, 33),
(10,35, 22),
(11,21,11),
(12,13,23),
(13,14,33),
(14,24,31),
(15,22,35);

INSERT INTO enrollment (enrollment_id,home_course_id) VALUES
(101,25);

INSERT INTO enrolls VALUES
(1,2),
(2,9),
(1,11),
(2,13),
(3,1),
(4,10),
(5,8),
(5,3);



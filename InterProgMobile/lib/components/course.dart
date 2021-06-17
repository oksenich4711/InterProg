import 'package:flutter/material.dart';
class Course {
  final String name;
  final String image;
  final String description;
  final double numOfHours;
  final double numOfStars;
  final int numOfPeople;
  final bool certificate;
  final Color colorOfText;

  Course(this.name, this.image, this.description, this.numOfHours,
      this.numOfStars, this.numOfPeople, this.certificate, this.colorOfText);
}

List<Course> courses = coursesData
    .map((item) => Course(
        item['name'],
        item['image'],
        item['description'],
        item['numOfHours'],
        item['numOfStars'],
        item['numOfPeople'],
        item['certificate'],
        item['color']))
    .toList();

var coursesData = [
  {
    "name": "UX Design",
    'image': "assets/image/course1.png",
    'description': "The focus of this course is to introduce the learner to User Experience (UX) Design.\n" +
        "User Experience design is design that is user centered. The goal is to design artifacts that allow" +
        " the users to meet their needs in the most effective efficient and satisfying manner. The course " +
        "introduces the novice to a cycle of discovery and evaluation and a set of techniques that meet " +
        "the user's needs.",
    "numOfHours": 13.5,
    'numOfStars': 4.8,
    'numOfPeople': 16900,
    'certificate': true,
    'color': Color(0xFF0D1333)
  },
  {
    "name": "Cryptography",
    'image': "assets/image/course2.png",
    'description': "Cryptography is an indispensable tool for protecting information in computer systems. " +
  "In this course you will learn the inner workings of cryptographic systems and how to correctly use them " +
  "in real-world applications. The course begins with a detailed discussion of how two parties who have a " +
  "shared secret key can communicate securely when a powerful adversary eavesdrops and tampers with traffic. " +
  "We will examine many deployed protocols and analyze mistakes in existing systems. The second half of the " +
  "course discusses public-key techniques that let two parties generate a shared secret key. Throughout the " +
  "course participants will be exposed to many exciting open problems in the field and work on fun (optional) " +
  "programming projects. In a second course (Crypto II) we will cover more advanced cryptographic tasks such as " +
  "zero-knowledge, privacy mechanisms, and other forms of encryption.",
    "numOfHours": 19.0,
    'numOfStars': 4.4,
    'numOfPeople': 10395,
    'certificate': true,
    'color': Color(0xFF0D1333)
  },
  {
    "name": "Program. The Fundamentals",
    'image': "assets/image/course3.png",
    'description': "Behind every mouse click and touch-screen tap, there is a computer program that " +
        "makes things happen. This course introduces the fundamental building blocks of programming and teaches " +
        "you how to write fun and useful programs using the Python language.",
    "numOfHours": 7.5,
    'numOfStars': 4.7,
    'numOfPeople': 39562,
    'certificate': false,
    'color': Color(0xFFF5F4EF)
  },
  {
    "name": "Cyber Security",
    'image': "assets/image/course5.png",
    'description': "In this course you will explore information security through some introductory material " +
  "and gain an appreciation of the scope and context around the subject. This includes a brief introduction " +
  "to cryptography, security management and network and computer security that allows you to begin the journey " +
  "into the study of information security and develop your appreciation of some key information security concepts.",
    "numOfHours": 21.0,
    'numOfStars': 4.6,
    'numOfPeople': 12578,
    'certificate': true,
    'color': Color(0xFFF5F4EF)
  },
  {
    "name": "C++ for Beginners",
    'image': "assets/image/course2.png",
    'description': "This Specialization is intended for all programming enthusiasts, as well as beginners, " +
  "computer and other scientists, and artificial intelligence enthusiasts seeking to develop their programming " +
  "skills in the foundational languages of C and C++. Through the four courses — two in C, and two in C++ — " +
  "you will cover the basics of programming in C and move on to the more advanced C++ semantics and syntax, " +
  "which will prepare you to apply these skills to a number of higher-level problems using AI algorithms and " +
  "Monte Carlo evaluation in complex games.",
    "numOfHours": 13.5,
    'numOfStars': 4.7,
    'numOfPeople': 19206,
    'certificate': true,
    'color': Color(0xFF0D1333)
  },
];

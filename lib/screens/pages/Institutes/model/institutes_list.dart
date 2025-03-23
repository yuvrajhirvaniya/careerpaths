// ignore_for_file: non_constant_identifier_names, camel_case_types

import '../../../../api/instituteController.dart';
import '../../../../model/institute_model.dart';

class Institute {
  final int institute_id;
  final List<Images> gallery;
  final double rating;
  final String name;
  final String address;
  final String city;
  final String contactNumber;
  final String email;
  final String information;
  final List<Faculty> facultyProfile;
  final List<String> courseList;
  final List<Fee> feeStructure;
  List<StudentReviews>? reviews;
  bool isTopInstitute;
  bool isFavInstitute;

  Institute({
    required this.institute_id,
    required this.gallery,
    required this.rating,
    required this.name,
    required this.address,
    required this.city,
    required this.contactNumber,
    required this.email,
    required this.information,
    required this.facultyProfile,
    required this.courseList,
    required this.feeStructure,
    this.reviews,
    this.isTopInstitute = false,
    this.isFavInstitute = false,
  });
}

class StudentReviews {
  final String photo;
  final String name;
  final String rateing;
  final String text;
  final String date;

  StudentReviews({
    required this.photo,
    required this.name,
    required this.rateing,
    required this.text,
    required this.date,
  });
}

class Images {
  final String placeName;
  final String photo;

  Images({
    required this.placeName,
    required this.photo,
  });
}

class Faculty {
  final String f_image;
  final String name;
  final String experience;
  final String qualification;
  final String designation;
  final String department;

  Faculty({
    required this.f_image,
    required this.name,
    required this.experience,
    required this.qualification,
    required this.designation,
    required this.department,
  });
}

class Fee {
  final String course;
  final double fees;
  final String Percentage_of_Students_Placed;
  final String eligibility;
  final String duration;
  final List<Cast> cutoffs;

  Fee({
    required this.course,
    required this.fees,
    required this.Percentage_of_Students_Placed,
    required this.eligibility,
    required this.duration,
    required this.cutoffs,
  });
}

class Cast {
  final String cast;
  final List<Cutoffs_data> data;
  Cast({
    required this.cast,
    required this.data,
  });
}

class Cutoffs_data {
  final String year;
  final String value;
  Cutoffs_data({required this.year, required this.value});
}

//constructor data come
List<Institute> institutes = [
  //institute 1st
  Institute(
    institute_id: 01,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.9,
    name: 'L. D. College Of Engineering',
    address: 'Opp. Gujarat University',
    city: 'Ahmedabad',
    contactNumber: '079-26306752',
    email: 'ldce-abad-dte@gujarat.gov.in',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
          f_image: 'assets/profile.jpeg',
          name: 'David Chen',
          experience: '5 Years',
          qualification: 'M.S. in Mechanical Engineering',
          designation: 'Lecturer',
          department: 'Electrical'),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "1"),
              Cutoffs_data(year: "2019", value: "2"),
              Cutoffs_data(year: "2020", value: "3"),
              Cutoffs_data(year: "2021", value: "4"),
              Cutoffs_data(year: "2021", value: "5"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "6"),
              Cutoffs_data(year: "2019", value: "7"),
              Cutoffs_data(year: "2020", value: "8"),
              Cutoffs_data(year: "2021", value: "9"),
              Cutoffs_data(year: "2021", value: "10"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "11"),
              Cutoffs_data(year: "2019", value: "12"),
              Cutoffs_data(year: "2020", value: "13"),
              Cutoffs_data(year: "2021", value: "14"),
              Cutoffs_data(year: "2021", value: "15"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "16"),
              Cutoffs_data(year: "2019", value: "17"),
              Cutoffs_data(year: "2020", value: "18"),
              Cutoffs_data(year: "2021", value: "19"),
              Cutoffs_data(year: "2021", value: "20"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "21"),
              Cutoffs_data(year: "2019", value: "22"),
              Cutoffs_data(year: "2020", value: "23"),
              Cutoffs_data(year: "2021", value: "24"),
              Cutoffs_data(year: "2021", value: "25"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "26"),
              Cutoffs_data(year: "2019", value: "27"),
              Cutoffs_data(year: "2020", value: "28"),
              Cutoffs_data(year: "2021", value: "29"),
              Cutoffs_data(year: "2021", value: "30"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "31"),
              Cutoffs_data(year: "2019", value: "32"),
              Cutoffs_data(year: "2020", value: "33"),
              Cutoffs_data(year: "2021", value: "34"),
              Cutoffs_data(year: "2021", value: "35"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "36"),
              Cutoffs_data(year: "2019", value: "37"),
              Cutoffs_data(year: "2020", value: "38"),
              Cutoffs_data(year: "2021", value: "39"),
              Cutoffs_data(year: "2021", value: "40"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "41"),
              Cutoffs_data(year: "2019", value: "42"),
              Cutoffs_data(year: "2020", value: "43"),
              Cutoffs_data(year: "2021", value: "44"),
              Cutoffs_data(year: "2021", value: "45"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "46"),
              Cutoffs_data(year: "2019", value: "47"),
              Cutoffs_data(year: "2020", value: "49"),
              Cutoffs_data(year: "2021", value: "50"),
              Cutoffs_data(year: "2021", value: "51"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "52"),
              Cutoffs_data(year: "2019", value: "53"),
              Cutoffs_data(year: "2020", value: "54"),
              Cutoffs_data(year: "2021", value: "55"),
              Cutoffs_data(year: "2021", value: "56"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "57"),
              Cutoffs_data(year: "2019", value: "58"),
              Cutoffs_data(year: "2020", value: "59"),
              Cutoffs_data(year: "2021", value: "60"),
              Cutoffs_data(year: "2021", value: "61"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "62"),
              Cutoffs_data(year: "2019", value: "63"),
              Cutoffs_data(year: "2020", value: "64"),
              Cutoffs_data(year: "2021", value: "65"),
              Cutoffs_data(year: "2021", value: "66"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "67"),
              Cutoffs_data(year: "2019", value: "68"),
              Cutoffs_data(year: "2020", value: "69"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "71"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "72"),
              Cutoffs_data(year: "2019", value: "73"),
              Cutoffs_data(year: "2020", value: "74"),
              Cutoffs_data(year: "2021", value: "75"),
              Cutoffs_data(year: "2021", value: "76"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "77"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "79"),
              Cutoffs_data(year: "2021", value: "81"),
              Cutoffs_data(year: "2021", value: "82"),
            ],
          ),
        ],
      ),
    ],
    reviews: [
      StudentReviews(
        photo: "assets/profile.jpg",
        name: "Rahul Gupta",
        rateing: "4.5",
        text:
            "This Institute is a fantastic place for higher education. The faculty is knowledgeable and experienced, and the facilities are modern and well-maintained. The institute provides a great learning environment for students across all departments. Highly recommended.",
        date: "02/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile1.jpg",
        name: "Priya Singh",
        rateing: "4.3",
        text:
            "This Institute is a great place for professional development. The institute offers a wide range of courses and training programs, designed to help individuals enhance their skills and knowledge. The faculty members are highly experienced, and the institute provides excellent facilities and resources to support learning. Overall, I would highly recommend this Institute to anyone looking to advance their career or professional development.",
        date: "25/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile.jpeg",
        name: "Rajesh Kumar",
        rateing: "4.8",
        text:
            "This Institute is an excellent choice for higher education. The institute offers a diverse range of academic programs, taught by knowledgeable and experienced faculty members. The facilities are modern and well-equipped, providing a comfortable and conducive environment for learning. I highly recommend this Institute to anyone looking for quality education and a great learning experience.",
        date: "08/04/2023",
      ),
      StudentReviews(
        photo: "assets/profile2.jpg",
        name: "Anjali Patel",
        rateing: "4.9",
        text:
            "This Institute is a top-notch institution. The faculty members are highly qualified and experienced, and the facilities are excellent. Highly recommended for anyone seeking quality education.",
        date: "16/04/2023",
      ),
    ],
    isTopInstitute: true,
  ),

  //institute 2nd
  Institute(
    institute_id: 02,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.5,
    name: 'C.U.Shah Polytechnic College',
    address: 'Ahemdabad Road, Wadhwan',
    city: 'Surendranagar',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        duration: "5 years",
        eligibility: '10th or 12th',
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    reviews: [
      StudentReviews(
        photo: "assets/profile.jpg",
        name: "Rahul Gupta",
        rateing: "4.5",
        text:
            "This Institute is a fantastic place for higher education. The faculty is knowledgeable and experienced, and the facilities are modern and well-maintained. The institute provides a great learning environment for students across all departments. Highly recommended.",
        date: "02/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile1.jpg",
        name: "Priya Singh",
        rateing: "4.3",
        text:
            "This Institute is a great place for professional development. The institute offers a wide range of courses and training programs, designed to help individuals enhance their skills and knowledge. The faculty members are highly experienced, and the institute provides excellent facilities and resources to support learning. Overall, I would highly recommend this Institute to anyone looking to advance their career or professional development.",
        date: "25/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile.jpeg",
        name: "Rajesh Kumar",
        rateing: "4.8",
        text:
            "This Institute is an excellent choice for higher education. The institute offers a diverse range of academic programs, taught by knowledgeable and experienced faculty members. The facilities are modern and well-equipped, providing a comfortable and conducive environment for learning. I highly recommend this Institute to anyone looking for quality education and a great learning experience.",
        date: "08/04/2023",
      ),
      StudentReviews(
        photo: "assets/profile2.jpg",
        name: "Anjali Patel",
        rateing: "4.9",
        text:
            "This Institute is a top-notch institution. The faculty members are highly qualified and experienced, and the facilities are excellent. Highly recommended for anyone seeking quality education.",
        date: "16/04/2023",
      ),
    ],
    isTopInstitute: true,
  ),

  //institute 3rd
  Institute(
    institute_id: 03,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.5,
    name: 'Vishwakarma Government Engineering College',
    address: '1234 Main St, City, State 12345',
    city: 'Surendranagar',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    reviews: [
      StudentReviews(
        photo: "assets/profile.jpg",
        name: "Rahul Gupta",
        rateing: "4.5",
        text:
            "This Institute is a fantastic place for higher education. The faculty is knowledgeable and experienced, and the facilities are modern and well-maintained. The institute provides a great learning environment for students across all departments. Highly recommended.",
        date: "02/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile1.jpg",
        name: "Priya Singh",
        rateing: "4.3",
        text:
            "This Institute is a great place for professional development. The institute offers a wide range of courses and training programs, designed to help individuals enhance their skills and knowledge. The faculty members are highly experienced, and the institute provides excellent facilities and resources to support learning. Overall, I would highly recommend this Institute to anyone looking to advance their career or professional development.",
        date: "25/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile.jpeg",
        name: "Rajesh Kumar",
        rateing: "4.8",
        text:
            "This Institute is an excellent choice for higher education. The institute offers a diverse range of academic programs, taught by knowledgeable and experienced faculty members. The facilities are modern and well-equipped, providing a comfortable and conducive environment for learning. I highly recommend this Institute to anyone looking for quality education and a great learning experience.",
        date: "08/04/2023",
      ),
      StudentReviews(
        photo: "assets/profile2.jpg",
        name: "Anjali Patel",
        rateing: "4.9",
        text:
            "This Institute is a top-notch institution. The faculty members are highly qualified and experienced, and the facilities are excellent. Highly recommended for anyone seeking quality education.",
        date: "16/04/2023",
      ),
    ],
  ),

  //institute 4th
  Institute(
    institute_id: 04,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.5,
    name: 'C.U.Shah Polytechnic College',
    address: 'Ahemdabad Road, Wadhwan',
    city: 'Surendranagar',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    reviews: [
      StudentReviews(
        photo: "assets/profile.jpg",
        name: "Rahul Gupta",
        rateing: "4.5",
        text:
            "This Institute is a fantastic place for higher education. The faculty is knowledgeable and experienced, and the facilities are modern and well-maintained. The institute provides a great learning environment for students across all departments. Highly recommended.",
        date: "02/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile1.jpg",
        name: "Priya Singh",
        rateing: "4.3",
        text:
            "This Institute is a great place for professional development. The institute offers a wide range of courses and training programs, designed to help individuals enhance their skills and knowledge. The faculty members are highly experienced, and the institute provides excellent facilities and resources to support learning. Overall, I would highly recommend this Institute to anyone looking to advance their career or professional development.",
        date: "25/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile.jpeg",
        name: "Rajesh Kumar",
        rateing: "4.8",
        text:
            "This Institute is an excellent choice for higher education. The institute offers a diverse range of academic programs, taught by knowledgeable and experienced faculty members. The facilities are modern and well-equipped, providing a comfortable and conducive environment for learning. I highly recommend this Institute to anyone looking for quality education and a great learning experience.",
        date: "08/04/2023",
      ),
      StudentReviews(
        photo: "assets/profile2.jpg",
        name: "Anjali Patel",
        rateing: "4.9",
        text:
            "This Institute is a top-notch institution. The faculty members are highly qualified and experienced, and the facilities are excellent. Highly recommended for anyone seeking quality education.",
        date: "16/04/2023",
      ),
    ],
    isTopInstitute: true,
  ),

  //institute 5th
  Institute(
    institute_id: 05,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.5,
    name: 'C.U.Shah Polytechnic College',
    address: 'Ahemdabad Road, Wadhwan',
    city: 'Surendranagar',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    reviews: [],
    isTopInstitute: true,
  ),

  //institute 6th
  Institute(
    institute_id: 06,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.5,
    name: 'C.U.Shah Polytechnic College',
    address: 'Ahemdabad Road, Wadhwan',
    city: 'Surendranagar',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    reviews: [
      StudentReviews(
        photo: "assets/profile.jpg",
        name: "Rahul Gupta",
        rateing: "4.5",
        text:
            "This Institute is a fantastic place for higher education. The faculty is knowledgeable and experienced, and the facilities are modern and well-maintained. The institute provides a great learning environment for students across all departments. Highly recommended.",
        date: "02/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile1.jpg",
        name: "Priya Singh",
        rateing: "4.3",
        text:
            "This Institute is a great place for professional development. The institute offers a wide range of courses and training programs, designed to help individuals enhance their skills and knowledge. The faculty members are highly experienced, and the institute provides excellent facilities and resources to support learning. Overall, I would highly recommend this Institute to anyone looking to advance their career or professional development.",
        date: "25/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile.jpeg",
        name: "Rajesh Kumar",
        rateing: "4.8",
        text:
            "This Institute is an excellent choice for higher education. The institute offers a diverse range of academic programs, taught by knowledgeable and experienced faculty members. The facilities are modern and well-equipped, providing a comfortable and conducive environment for learning. I highly recommend this Institute to anyone looking for quality education and a great learning experience.",
        date: "08/04/2023",
      ),
      StudentReviews(
        photo: "assets/profile2.jpg",
        name: "Anjali Patel",
        rateing: "4.9",
        text:
            "This Institute is a top-notch institution. The faculty members are highly qualified and experienced, and the facilities are excellent. Highly recommended for anyone seeking quality education.",
        date: "16/04/2023",
      ),
    ],
    isTopInstitute: true,
  ),

  //institute 7th
  Institute(
    institute_id: 07,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.5,
    name: 'C.U.Shah Polytechnic College',
    address: 'Ahemdabad Road, Wadhwan',
    city: 'Surendranagar',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    isTopInstitute: true,
  ),

  //institute 8th
  Institute(
    institute_id: 08,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.5,
    name: 'C.U.Shah Polytechnic College',
    address: 'Ahemdabad Road, Wadhwan',
    city: 'Surendranagar',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    reviews: [
      StudentReviews(
        photo: "assets/profile.jpg",
        name: "Rahul Gupta",
        rateing: "4.5",
        text:
            "This Institute is a fantastic place for higher education. The faculty is knowledgeable and experienced, and the facilities are modern and well-maintained. The institute provides a great learning environment for students across all departments. Highly recommended.",
        date: "02/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile1.jpg",
        name: "Priya Singh",
        rateing: "4.3",
        text:
            "This Institute is a great place for professional development. The institute offers a wide range of courses and training programs, designed to help individuals enhance their skills and knowledge. The faculty members are highly experienced, and the institute provides excellent facilities and resources to support learning. Overall, I would highly recommend this Institute to anyone looking to advance their career or professional development.",
        date: "25/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile.jpeg",
        name: "Rajesh Kumar",
        rateing: "4.8",
        text:
            "This Institute is an excellent choice for higher education. The institute offers a diverse range of academic programs, taught by knowledgeable and experienced faculty members. The facilities are modern and well-equipped, providing a comfortable and conducive environment for learning. I highly recommend this Institute to anyone looking for quality education and a great learning experience.",
        date: "08/04/2023",
      ),
      StudentReviews(
        photo: "assets/profile2.jpg",
        name: "Anjali Patel",
        rateing: "4.9",
        text:
            "This Institute is a top-notch institution. The faculty members are highly qualified and experienced, and the facilities are excellent. Highly recommended for anyone seeking quality education.",
        date: "16/04/2023",
      ),
    ],
    isTopInstitute: true,
  ),

  //institute 9th
  Institute(
    institute_id: 09,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.5,
    name: 'C.U.Shah Polytechnic College',
    address: 'Ahemdabad Road, Wadhwan',
    city: 'Surendranagar',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    isTopInstitute: true,
  ),

  //institute 10th
  Institute(
    institute_id: 10,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.5,
    name: 'C.U.Shah Polytechnic College',
    address: 'Ahemdabad Road, Wadhwan',
    city: 'Surendranagar',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    reviews: [
      StudentReviews(
        photo: "assets/profile.jpg",
        name: "Rahul Gupta",
        rateing: "4.5",
        text:
            "This Institute is a fantastic place for higher education. The faculty is knowledgeable and experienced, and the facilities are modern and well-maintained. The institute provides a great learning environment for students across all departments. Highly recommended.",
        date: "02/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile1.jpg",
        name: "Priya Singh",
        rateing: "4.3",
        text:
            "This Institute is a great place for professional development. The institute offers a wide range of courses and training programs, designed to help individuals enhance their skills and knowledge. The faculty members are highly experienced, and the institute provides excellent facilities and resources to support learning. Overall, I would highly recommend this Institute to anyone looking to advance their career or professional development.",
        date: "25/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile.jpeg",
        name: "Rajesh Kumar",
        rateing: "4.8",
        text:
            "This Institute is an excellent choice for higher education. The institute offers a diverse range of academic programs, taught by knowledgeable and experienced faculty members. The facilities are modern and well-equipped, providing a comfortable and conducive environment for learning. I highly recommend this Institute to anyone looking for quality education and a great learning experience.",
        date: "08/04/2023",
      ),
      StudentReviews(
        photo: "assets/profile2.jpg",
        name: "Anjali Patel",
        rateing: "4.9",
        text:
            "This Institute is a top-notch institution. The faculty members are highly qualified and experienced, and the facilities are excellent. Highly recommended for anyone seeking quality education.",
        date: "16/04/2023",
      ),
    ],
  ),

  //institute 11th
  Institute(
    institute_id: 11,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.5,
    name: 'C.U.Shah Polytechnic College',
    address: 'Ahemdabad Road, Wadhwan',
    city: 'Surendranagar',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    reviews: [
      StudentReviews(
        photo: "assets/profile.jpg",
        name: "Rahul Gupta",
        rateing: "4.5",
        text:
            "This Institute is a fantastic place for higher education. The faculty is knowledgeable and experienced, and the facilities are modern and well-maintained. The institute provides a great learning environment for students across all departments. Highly recommended.",
        date: "02/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile1.jpg",
        name: "Priya Singh",
        rateing: "4.3",
        text:
            "This Institute is a great place for professional development. The institute offers a wide range of courses and training programs, designed to help individuals enhance their skills and knowledge. The faculty members are highly experienced, and the institute provides excellent facilities and resources to support learning. Overall, I would highly recommend this Institute to anyone looking to advance their career or professional development.",
        date: "25/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile.jpeg",
        name: "Rajesh Kumar",
        rateing: "4.8",
        text:
            "This Institute is an excellent choice for higher education. The institute offers a diverse range of academic programs, taught by knowledgeable and experienced faculty members. The facilities are modern and well-equipped, providing a comfortable and conducive environment for learning. I highly recommend this Institute to anyone looking for quality education and a great learning experience.",
        date: "08/04/2023",
      ),
      StudentReviews(
        photo: "assets/profile2.jpg",
        name: "Anjali Patel",
        rateing: "4.9",
        text:
            "This Institute is a top-notch institution. The faculty members are highly qualified and experienced, and the facilities are excellent. Highly recommended for anyone seeking quality education.",
        date: "16/04/2023",
      ),
    ],
    isTopInstitute: true,
  ),

  //institute 12th
  Institute(
    institute_id: 12,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.5,
    name: 'C.U.Shah Polytechnic College',
    address: 'Ahemdabad Road, Wadhwan',
    city: 'Surendranagar',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    reviews: [
      StudentReviews(
        photo: "assets/profile.jpg",
        name: "Rahul Gupta",
        rateing: "4.5",
        text:
            "This Institute is a fantastic place for higher education. The faculty is knowledgeable and experienced, and the facilities are modern and well-maintained. The institute provides a great learning environment for students across all departments. Highly recommended.",
        date: "02/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile1.jpg",
        name: "Priya Singh",
        rateing: "4.3",
        text:
            "This Institute is a great place for professional development. The institute offers a wide range of courses and training programs, designed to help individuals enhance their skills and knowledge. The faculty members are highly experienced, and the institute provides excellent facilities and resources to support learning. Overall, I would highly recommend this Institute to anyone looking to advance their career or professional development.",
        date: "25/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile.jpeg",
        name: "Rajesh Kumar",
        rateing: "4.8",
        text:
            "This Institute is an excellent choice for higher education. The institute offers a diverse range of academic programs, taught by knowledgeable and experienced faculty members. The facilities are modern and well-equipped, providing a comfortable and conducive environment for learning. I highly recommend this Institute to anyone looking for quality education and a great learning experience.",
        date: "08/04/2023",
      ),
      StudentReviews(
        photo: "assets/profile2.jpg",
        name: "Anjali Patel",
        rateing: "4.9",
        text:
            "This Institute is a top-notch institution. The faculty members are highly qualified and experienced, and the facilities are excellent. Highly recommended for anyone seeking quality education.",
        date: "16/04/2023",
      ),
    ],
    isTopInstitute: true,
  ),

  //institute 13th
  Institute(
    institute_id: 13,
    gallery: [
      Images(placeName: "Main Building", photo: 'assets/clg1.jpeg'),
      Images(placeName: "Playground", photo: 'assets/playground.jpg'),
      Images(
          placeName: "Computer Department",
          photo: 'assets/computer department.jpg'),
      Images(placeName: "Canteen", photo: 'assets/canteen.jpg'),
    ],
    rating: 4.7,
    name: 'JNV College',
    address: 'Modasa, Aravalli',
    city: 'modasa',
    contactNumber: '878787878787',
    email: 'Cushah@gmail.com',
    information:
        "It's a leading educational institution in the field of technology and engineering. Established in 1990, it has a long history of providing high-quality education to its students. The institute has state-of-the-art facilities and a highly qualified faculty to support the students in their academic and professional pursuits.",
    facultyProfile: [
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'John Doe',
        experience: '10 Years',
        qualification: 'Ph.D. in Computer Science',
        designation: 'H.O.D',
        department: 'Computer',
      ),
      Faculty(
        f_image: 'assets/profile.jpeg',
        name: 'David Chen',
        experience: '5 Years',
        qualification: 'M.S. in Mechanical Engineering',
        designation: 'Lecturer',
        department: 'Automobile',
      ),
    ],
    courseList: [
      'Computer Science',
      'Mechanical Engineering',
      'Electrical Engineering',
      'Civil Engineering',
    ],
    feeStructure: [
      Fee(
        course: 'Computer Science',
        fees: 10000,
        Percentage_of_Students_Placed: "10%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Mechanical Engineering',
        fees: 12000,
        Percentage_of_Students_Placed: "30%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Electrical Engineering',
        fees: 11000,
        Percentage_of_Students_Placed: "20%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
      Fee(
        course: 'Civil Engineering',
        fees: 9000,
        Percentage_of_Students_Placed: "40%",
        eligibility: '10th or 12th',
        duration: "5 years",
        cutoffs: [
          Cast(
            cast: "Open",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "SC/ST",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "OBC",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
          Cast(
            cast: "EWS",
            data: [
              Cutoffs_data(year: "2018", value: "80"),
              Cutoffs_data(year: "2019", value: "78"),
              Cutoffs_data(year: "2020", value: "75"),
              Cutoffs_data(year: "2021", value: "70"),
              Cutoffs_data(year: "2021", value: "68"),
            ],
          ),
        ],
      ),
    ],
    reviews: [
      StudentReviews(
        photo: "assets/profile.jpg",
        name: "Rahul Gupta",
        rateing: "4.5",
        text:
            "This Institute is a fantastic place for higher education. The faculty is knowledgeable and experienced, and the facilities are modern and well-maintained. The institute provides a great learning environment for students across all departments. Highly recommended.",
        date: "02/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile1.jpg",
        name: "Priya Singh",
        rateing: "4.3",
        text:
            "This Institute is a great place for professional development. The institute offers a wide range of courses and training programs, designed to help individuals enhance their skills and knowledge. The faculty members are highly experienced, and the institute provides excellent facilities and resources to support learning. Overall, I would highly recommend this Institute to anyone looking to advance their career or professional development.",
        date: "25/03/2023",
      ),
      StudentReviews(
        photo: "assets/profile.jpeg",
        name: "Rajesh Kumar",
        rateing: "4.8",
        text:
            "This Institute is an excellent choice for higher education. The institute offers a diverse range of academic programs, taught by knowledgeable and experienced faculty members. The facilities are modern and well-equipped, providing a comfortable and conducive environment for learning. I highly recommend this Institute to anyone looking for quality education and a great learning experience.",
        date: "08/04/2023",
      ),
      StudentReviews(
        photo: "assets/profile2.jpg",
        name: "Anjali Patel",
        rateing: "4.9",
        text:
            "This Institute is a top-notch institution. The faculty members are highly qualified and experienced, and the facilities are excellent. Highly recommended for anyone seeking quality education.",
        date: "16/04/2023",
      ),
    ],
    isTopInstitute: true,
  ),
];

// popular courses list data
class trending_course {
  final int course_id;
  final String image;
  final String name;
  final String information;
  final String qualification;
  final bool isPopular;
  trending_course({
    required this.course_id,
    required this.image,
    required this.name,
    required this.information,
    required this.qualification,
    this.isPopular = false,
  });
}

List<trending_course> courses = [
  trending_course(
    course_id: 01,
    image: 'assets/popular_courses/mba_img.jpeg',
    name: 'Master Of Business Administration',
    information:
        "MBA is a graduate-level business and management degree with a focus on leadership and managerial skills.",
    qualification: '12th',
    isPopular: true,
  ),
  trending_course(
    course_id: 02,
    image: 'assets/popular_courses/economics.jpeg',
    name: 'Bachelor of Economics',
    information:
        "A bachelor's degree in economics prepares graduates to enter the job market with desirable critical thinking and analytical skills. Because the field includes a diverse course of study, economics graduates can seek a career in a variety of areas, including business, finance, and banking.",
    qualification: '12th',
    isPopular: true,
  ),
  trending_course(
    course_id: 03,
    image: 'assets/popular_courses/accounting.jpeg',
    name: 'Accounting',
    information:
        'Accounting, which is often just called "accounting," is the process of measuring, processing, and sharing financial and other information about businesses and corporations. What is accounting? Accounting is the processor keeping the accounting books of the financial transactions of the company.',
    qualification: '12th',
    isPopular: true,
  ),
  trending_course(
    course_id: 04,
    image: 'assets/popular_courses/arts.jpeg',
    name: 'Arts',
    information:
        "Students bent towards fine arts like music , languages, painting, sociology , journalism , communication etc can choose the arts courses after 10th. Students can move on further to take up Bachelor's in education, literature, languages, mass media, communication, arts, design and more.",
    qualification: '10th',
    isPopular: true,
  ),
  trending_course(
    course_id: 05,
    image: 'assets/popular_courses/commerce.jpeg',
    name: 'Commerce',
    information:
        "The commerce stream offers management courses as well in various fields like Hotel Management, Event Management, media management, Fashion Management, Marketing Management, etc. Also, many companies like BPOs and KPOs only hire students with commerce backgrounds.",
    qualification: '10th',
    isPopular: true,
  ),
  trending_course(
    course_id: 06,
    image: 'assets/popular_courses/science.jpeg',
    name: 'Science',
    information:
        "Science is the most favourite and popular career option for the majority of the students and parents. Science stream offers many options such as medical, engineering, IT, and you can even opt for research roles. The main advantage of taking science stream is that it keeps your options open.",
    qualification: '10th',
    isPopular: true,
  ),
  trending_course(
    course_id: 07,
    image: 'assets/popular_courses/computer.jpeg',
    name: 'Diploma in Computer Engineering',
    information:
        "A Diploma in Computer Engineering program covers basic topics like computer programming, operating system, networking, database, etc.",
    qualification: '10th & 12th',
    isPopular: true,
  ),
  trending_course(
    course_id: 08,
    image: 'assets/popular_courses/Electrical.jpeg',
    name: 'Diploma in Electrical Engineering',
    information:
        "Diploma in Electrical Engineering is a 3 year skill-enabling engineering programme that students can pursue after completing class 10. The course deals with installation, maintenance, troubleshooting, magnetism, control systems, signal processing and telecommunications.",
    qualification: '10th & 12th',
    isPopular: true,
  ),
  trending_course(
    course_id: 09,
    image: 'assets/popular_courses/Automobile.jpeg',
    name: "Diploma in Automobile Engineering",
    information:
        "The course of Diploma in Automobile Engineering caters to train the students to design, develop, manufacture, and repair of automobiles.",
    qualification: '10th & 12th',
    isPopular: true,
  ),
  trending_course(
    course_id: 10,
    image: 'assets/popular_courses/civil.jpeg',
    name: 'Diploma in Civil Engineering',
    information:
        "Diploma in Civil Engineering is a 3 year course for students after completion of Class 10 that teaches students to plan, design, execute and maintain structural works like bridges, buildings, roads and other infrastructural projects.",
    qualification: '10th & 12th',
    isPopular: true,
  ),
];

//get the favorated items
class FavInstitute {
  final iController = InstituteApi();

  List<InstituteModel> institutelist = [];
  loadData() async {
    institutelist = await iController.getInstituteList();
  }

  List<InstituteModel> getFavoritedInsitute() {
    List<InstituteModel> _travelList = institutelist;
    return _travelList
        .where((element) => element.favouriteInstitute == "1")
        .toList();
  }
}

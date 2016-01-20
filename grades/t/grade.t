use strict;
use warnings;

use Test::More tests => 4;
use Test::DBIx::Class;

my $student_rs  = Schema->resultset('Student');
my $teacher_rs  = Schema->resultset('Teacher');
my $grade_rs    = Schema->resultset('Grade');
my $homework_rs = Schema->resultset('Homework');

my $student1 = $student_rs->create({});
my $student2 = $student_rs->create({});

my $homework1 = $homework_rs->create({name => 'A', max_points => 10});
my $homework2 = $homework_rs->create({name => 'B', max_points => 6});

my $teacher1 = $teacher_rs->create({floor => '2'});
my $teacher2 = $teacher_rs->create({floor => '1'});
my $teacher3 = $teacher_rs->create({floor => '0'});

my $grade_floor1 = $grade_rs->create({
    homework => $homework1,
    student  => $student1,
    teacher  => $teacher1,
    points   => 10,
});
my $grade_floor2 = $grade_rs->create({
    homework => $homework2,
    student  => $student1,
    teacher  => $teacher2,
    points   => 4,
});
my $grade_floor3 = $grade_rs->create({
    homework => $homework1,
    student  => $student2,
    teacher  => $teacher3,
    points   => 3,
});

$grade_rs->create({
    homework => $homework2,
    student  => $student1,
    teacher  => $teacher1,
    points   => 5,
});
$grade_rs->create({
    homework => $homework1,
    student  => $student2,
    teacher  => $teacher2,
    points   => 12,
});
$grade_rs->create({
    homework => $homework2,
    student  => $student2,
    teacher  => $teacher2,
    points   => 8,
});

my $max_grade = $grade_rs->max_points();
my $floor1 = $grade_floor1->floor_where_teacher();
my $floor2 = $grade_floor2->floor_where_teacher();
my $floor3 = $grade_floor3->floor_where_teacher();

cmp_ok($max_grade, '==', 12, 'max grade');
is($floor1, 2, "teacher's floors");
is($floor2, 1, "teacher's floors");
is($floor3, 0, "teacher's floors");


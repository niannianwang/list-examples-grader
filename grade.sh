# Step 1 - clone the student's repository

CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

# Step 2 - check the student's submission contains the ListExamples.java file
if [[ -f student-submission/ListExamples.java ]]
then 
    echo "file exists"
else
    echo "ListExamples.java does not exist"
    echo "Grade: 0"
    exit
fi

# Step 3 - put relevant file in grading-area folder
cp student-submission/ListExamples.java TestListExamples.java grading-area
cp -r lib grading-area

# Step 4 - complie java file
cd grading-area
javac -cp $CPATH ListExamples.java TestListExamples.java 2> compile-error.txt
# -cp followed by $CPATH tells java I am going to import $CPATH to help the compilation of later files
# writes the error messages to 2> compile-error.txt

echo "Exit code: $?"

# Step 5 - grade report
java TestListExamples.java 2> junit-output.txt
# write JUnit test output to a text file

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

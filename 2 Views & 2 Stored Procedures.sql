-- Sets the schema to the acme_trivia
USE acme_trivia;

-- Allows the user to view the Answer table
SELECT * FROM Answers;
-- Allows the user to view the Questions table
SELECT * FROM Questions;
-- Allows the user to view the trivia_game table
SELECT * FROM trivia_game;

-- Creates a view called Correct_Answers
create view Correct_Answers as
-- Adds answer_id, answer_text, and is_correct columns to the view from the table where each is_correct value is equal to 1
Select answer_id, answer_text, is_correct from Answers where is_correct=1;

-- Shows the Correct_Answers view
Select * from Correct_Answers;

-- Sets the delimiter to // instead of ;
DELIMITER //
-- Creates a stored procedure called TriviaScore
Create Procedure TriviaScore()
-- Declares the beggining of the procedure
begin
-- Calculates the percentage for the trivia game by taking the correct answers and diving it by the total amount of answers
Select (Sum(is_correct = 1) / (Sum(is_correct = 1) + Sum(is_correct = 0))) * 100 as trivia_score from Answers;
-- Shows the Correct_Answers view
Select * from Correct_Answers;
-- Declares the ending of the procedure
end //
-- Sets the delimiter back to ;
DELIMITER ;

-- Calls the stored procedure named TriviaScore
Call TriviaScore;

-- Creates a view called Wrong_Answers
create view Wrong_Answers as
-- Adds answer_id, answer_text, and is_correct to the view from the table where each is_correct value is equal to 0
Select answer_id, answer_text, is_correct from Answers where is_correct=0;

-- Sets the delimiter to // instead of ;
DELIMITER //
-- Creates a procedure called WrongAnswerAmount
Create Procedure WrongAnswerAmount()
-- Declares the beginning of the procedure
begin
-- Calculates the sum of rows where the is_correct value equals 0 and shows it as wrong_answers
Select Sum(is_correct = 0) as wrong_answers from Answers;
-- Calls the Wrong_Answers view
Select * from Wrong_Answers;
-- Declares the ending of the procedure
end //
-- Sets the delimiter back to ;
DELIMITER ;

-- Calls the stored procedure named WrongAnswerAmount
Call WrongAnswerAmount;
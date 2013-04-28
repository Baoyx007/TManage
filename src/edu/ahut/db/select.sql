delimiter $$
use tmanage$$

SELECT * FROM subject,teacher,student where  teacher.id=student.id;

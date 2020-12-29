CREATE TABLE BorrowRecords (
	record_id INT PRIMARY KEY auto_increment,
	user_id VARCHAR(13),
	book_id VARCHAR(13),
	lend_date DATE NOT NULL,
	due_date DATE NOT NULL,
	return_date DATE,
	state CHAR(1) DEFAULT('0'),
	FOREIGN KEY(book_id) REFERENCES book(book_id),
	FOREIGN KEY(user_id) REFERENCES user(user_id)
);

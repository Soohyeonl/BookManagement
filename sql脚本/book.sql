CREATE TABLE book (
  book_id varchar(13) PRIMARY KEY,
  book_name varchar(50) NOT NULL,
  price double NOT NULL,
  auther varchar(50) NOT NULL,
  book_kind varchar(50) NOT NULL,
  publisher varchar(50) NOT NULL,
  book_num int NOT NULL,
  description varchar(255) NOT NULL,
  now_num int NULL
);

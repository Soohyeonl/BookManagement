CREATE TABLE user (
  user_id varchar(13) PRIMARY KEY,
  user_name varchar(50) NOT NULL,
  user_pwd varchar(50) NOT NULL,
  user_phone varchar(11) NOT NULL,
  user_gender char(4) NOT NULL
);

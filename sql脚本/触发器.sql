 
delimiter $$
create trigger t_borrow_book_update after insert
    on BorrowRecords for each row
    begin
        update book set now_num = now_num - 1 where book_id = new.book_id;
    end $$
delimiter ;


delimiter $$
create trigger t_return_book_update after update 
    on BorrowRecords for each row
    begin
        update book set now_num = now_num + 1 where book_id = new.book_id;
    end $$
delimiter ;

drop trigger if exists check_valid_number;

delimiter $$
create trigger check_valid_number before insert on Patient
  for each row
  begin
    if new.number < 100000000 or new.number > 999999999 then
      call health_no_has_9_digits;
    end if;
end$$
delimiter ;

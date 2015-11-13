drop trigger if exists check_valid_connects;
drop trigger if exists check_valid_wears;

delimiter $$
create trigger check_valid_wears before insert on Wears
  for each row
  begin
    declare start_time timestamp;
    declare end_time timestamp;
    select start into start_time from Wears where patient = new.patient;
    select end into end_time from Wears where patient = new.patient;
    if start_time = new.start then
      call same_start_time();
    end if;
end$$
delimiter ;

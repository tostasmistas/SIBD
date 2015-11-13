drop trigger if exists check_valid_number;
drop trigger if exists check_valid_phonenum;
drop trigger if exists check_valid_snum;
drop trigger if exists check_valid_nut4code;

delimiter $$
create trigger check_valid_number before insert on Patient
  for each row
  begin
    if new.number < 100000000 or new.number > 999999999 then
      call health_num_has_9_digits;
    end if;
end$$
delimiter ;

delimiter $$
create trigger check_valid_phonenum before insert on PAN
  for each row
  begin
    if new.phone < 100000000 or new.phone > 999999999 then
      call phone_num_has_9_digits;
    end if;
end$$
delimiter ;

delimiter $$
create trigger check_valid_snum before insert on Device
  for each row
  begin
    if new.serialnum < 10000000 or new.serialnum > 99999999 then
      call serial_num_has_8_digits;
    end if;
end$$
delimiter ;

delimiter $$
create trigger check_valid_nut4code before insert on Municipality
  for each row
  begin
    if new.nut4code < 10000 or new.nut4code > 99999 then
      call digit_code_has_5_digits;
    end if;
end$$
delimiter ;

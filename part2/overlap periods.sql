drop trigger if exists check_valid_wears_patient;

delimiter $$
create trigger check_valid_wears_patient before insert on Wears
  for each row
  begin
    declare start_time timestamp;
    declare end_time timestamp;

    select start into start_time from Wears where patient = new.patient;
    select end into end_time from Wears where patient = new.patient;

    if ((new.start or new.end) between start_time and end_time) then
      call that_patient_has_a_PAN_in_that_period();
    end if;

    if (new.start < start_time and new.end > end_time) then
      call that_patient_has_a_PAN_in_that_period();
    end if;

end$$
delimiter ;

drop trigger if exists check_valid_wears_patient_u;
drop trigger if exists check_valid_wears_patient_i;

delimiter $$
create trigger check_valid_wears_patient_u before update on Wears
  for each row
  begin
    declare count_condition_1 integer;
    declare count_condition_2 integer;
    declare count_condition_3 integer;

    select count(*) into count_condition_1 from Wears where new.patient = patient and new.start between start and end;
    select count(*) into count_condition_2 from Wears where new.patient = patient and new.end between start and end;
    select count(*) into count_condition_3 from Wears where new.patient = patient and new.start < start and new.end > end;

    if (count_condition_1 or count_condition_2 or count_condition_3 >= 1) then
      call that_patient_has_a_PAN_in_that_period();
    end if;
end$$
delimiter ;

delimiter $$
create trigger check_valid_wears_patient_i before insert on Wears
  for each row
  begin
    declare count_condition_1 integer;
    declare count_condition_2 integer;
    declare count_condition_3 integer;

    select count(*) into count_condition_1 from Wears where new.patient = patient and new.start between start and end;
    select count(*) into count_condition_2 from Wears where new.patient = patient and new.end between start and end;
    select count(*) into count_condition_3 from Wears where new.patient = patient and new.start < start and new.end > end;

    if (count_condition_1 or count_condition_2 or count_condition_3 >= 1) then
      call that_patient_has_a_PAN_in_that_period();
    end if;
end$$
delimiter ;

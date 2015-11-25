drop trigger if exists check_valid_wears_u;
drop trigger if exists check_valid_wears_i;
drop trigger if exists check_valid_connects_u;
drop trigger if exists check_valid_connects_i;
drop trigger if exists check_valid_period_i;

delimiter $$
create trigger check_valid_period_i before insert on Period
  for each row
  begin
	#end tem de ser maior que start
    if new.start>new.end then 
		call period_not_valid();
	end if;
end$$
delimiter ;


delimiter $$
create trigger check_valid_wears_i before insert on Wears
  for each row
  begin
    declare count_patient_1 integer;
    declare count_patient_2 integer;
    declare count_patient_3 integer;
    declare count_pan_1 integer;
    declare count_pan_2 integer;
    declare count_pan_3 integer;

    select count(*) into count_patient_1 from Wears where new.patient = patient and new.start between start and end;
    select count(*) into count_patient_2 from Wears where new.patient = patient and new.end between start and end;
    select count(*) into count_patient_3 from Wears where new.patient = patient and new.start < start and new.end > end;
    
    select count(*) into count_pan_1 from Wears where new.pan = pan and new.start between start and end;
	select count(*) into count_pan_2 from Wears where new.pan = pan and new.end between start and end;
    select count(*) into count_pan_3 from Wears where new.pan = pan and new.start < start and new.end > end;
    
    if (count_patient_1 or count_patient_2 or count_patient_3 >= 1) then
      call that_patient_has_a_PAN_in_that_period();
    end if;
    if (count_pan_1 or count_pan_2 or count_pan_3 >= 1) then
      call another_patient_has_that_PAN_in_that_period();
    end if;
end$$
delimiter ;

delimiter $$
create trigger check_valid_connects_i before insert on Connects
  for each row
  begin
    declare count_condition_1 integer;
    declare count_condition_2 integer;
    declare count_condition_3 integer;

    select count(*) into count_condition_1 from Connects where new.snum = snum and new.manuf = manuf and new.start between start and end;
    select count(*) into count_condition_2 from Connects where new.snum = snum and new.manuf = manuf and new.end between start and end;
    select count(*) into count_condition_3 from Connects where new.snum = snum and new.manuf = manuf and new.start < start and new.end > end;

    if (count_condition_1 or count_condition_2 or count_condition_3 >= 1) then
      call that_device_is_connected_to_a_PAN_in_that_period();
    end if;
end$$
delimiter ;


delimiter $$
create trigger check_valid_wears_u before update on Wears
  for each row
  begin
    declare count_patient_1 integer;
    declare count_patient_2 integer;
    declare count_patient_3 integer;
    declare count_pan_1 integer;
    declare count_pan_2 integer;
    declare count_pan_3 integer;
    
		
        if(new.start<old.start and new.end<=old.end and new.end>=old.start) then
			select count(*) into count_patient_1 from Wears where new.patient = patient and new.start between start and end;
            select count(*) into count_pan_1 from Wears where new.pan = pan and new.start between start and end;
            if(count_patient_1<>0) then
				call that_patient_is_connected_to_a_PAN_in_that_period();
			end if;
            if (count_pan_1 <> 0) then
				call another_patient_has_that_PAN_in_that_period();
			end if;
		end if;
        
        if(new.start<old.start and new.end>old.end) then
			select count(*) into count_patient_1 from Wears where new.patient = patient and new.start between start and end;
			select count(*) into count_patient_2 from Wears where new.patient = patient and new.end between start and end;
			select count(*) into count_pan_1 from Wears where new.pan = pan and new.start between start and end;
			select count(*) into count_pan_2 from Wears where new.pan = pan and new.end between start and end;
		
            if (count_patient_1 or count_patient_2 >= 1) then 
				call that_patient_is_connected_to_a_PAN_in_that_period();
			end if;
            if (count_pan_1 or count_pan_2 >= 1) then
				call another_patient_has_that_PAN_in_that_period();
			end if;
		end if;
        
        if(new.start<old.start and new.end<old.start) then
			select count(*) into count_patient_1 from Wears where new.patient = patient and new.start between start and end;
			select count(*) into count_patient_2 from Wears where new.patient = patient and new.end between start and end;
			select count(*) into count_patient_3 from Wears where new.patient = patient and new.start < start and new.end > end;
			select count(*) into count_pan_1 from Wears where new.pan = pan and new.start between start and end;
			select count(*) into count_pan_2 from Wears where new.pan = pan and new.end between start and end;
			select count(*) into count_pan_3 from Wears where new.pan = pan and new.start < start and new.end > end;

			if (count_pan_1 or count_pan_2 or count_pan_3 >= 1) then
			  call another_patient_has_that_PAN_in_that_period();
			end if;
			if (count_patient_1 or count_patient_2 or count_patient_3 >= 1) then 
				call that_patient_is_connected_to_a_PAN_in_that_period();
            end if;
		end if;
        
        if(new.start>=old.start and new.start>old.end and new.end>old.end) then
			select count(*) into count_patient_1 from Wears where new.patient = patient and new.start between start and end;
			select count(*) into count_patient_2 from Wears where new.patient = patient and new.end between start and end;
			select count(*) into count_patient_3 from Wears where new.patient = patient and new.start < start and new.end > end;	
			select count(*) into count_pan_1 from Wears where new.pan = pan and new.start between start and end;
			select count(*) into count_pan_2 from Wears where new.pan = pan and new.end between start and end;
			select count(*) into count_pan_3 from Wears where new.pan = pan and new.start < start and new.end > end;

			if (count_pan_1 or count_pan_2 or count_pan_3 >= 1) then
			  call another_patient_has_that_PAN_in_that_period();
			end if;
			if (count_patient_1 or count_patient_2 or count_patient_3 >= 1) then 
				call that_patient_is_connected_to_a_PAN_in_that_period();
            end if;
		end if;
        
        if(new.start>=old.start and new.start<=old.end and new.end>old.end) then
			select count(*) into count_patient_2 from Wears where new.patient = patient and new.end between start and end;
            select count(*) into count_pan_2 from Wears where new.pan = pan and new.end between start and end;
			if (count_pan_2 <> 0) then
				call another_patient_has_that_PAN_in_that_period();
			end if;
			if(count_patient_2<>0) then
				call that_patient_is_connected_to_a_PAN_in_that_period();
			end if;
		end if;
        
        if (new.start=old.start and new.start=old.start) then
			select count(*) into count_pan_1 from Wears where new.pan = pan and new.start between start and end;
			select count(*) into count_pan_2 from Wears where new.pan = pan and new.end between start and end;
			select count(*) into count_pan_3 from Wears where new.pan = pan and new.start < start and new.end > end;

			if (count_pan_1 or count_pan_2 or count_pan_3 >= 1) then
			  call another_patient_has_that_PAN_in_that_period();
			end if;
		end if;
end$$
delimiter ;

delimiter $$
create trigger check_valid_connects_u before update on Connects
  for each row
  begin
    declare count_condition_1 integer;
    declare count_condition_2 integer;
    declare count_condition_3 integer;
    
		
        if(new.start<old.start and new.end<=old.end and new.end>=old.start) then
			select count(*) into count_condition_1 from Connects where new.snum = snum and new.manuf = manuf and new.start between start and end;
			if(count_condition_1<>0) then
				call that_device_is_connected_to_a_PAN_in_that_period();
			end if;
		end if;
        
        if(new.start<old.start and new.end>old.end) then
			select count(*) into count_condition_1 from Connects where new.snum = snum and new.manuf = manuf and new.start between start and end;
			select count(*) into count_condition_2 from Connects where new.snum = snum and new.manuf = manuf and new.end between start and end;
   
            if (count_condition_1 or count_condition_2 >= 1) then 
				call that_device_is_connected_to_a_PAN_in_that_period();
			end if;

		end if;
        
        if(new.start<old.start and new.end<old.start) then
			select count(*) into count_condition_1 from Connects where new.snum = snum and new.manuf = manuf and new.start between start and end;
			select count(*) into count_condition_2 from Connects where new.snum = snum and new.manuf = manuf and new.end between start and end;
			select count(*) into count_condition_3 from Connects where new.snum = snum and new.manuf = manuf and new.start < start and new.end > end;

    
			if (count_condition_1 or count_condition2 or count_condition_3 >= 1) then 
				call that_device_is_connected_to_a_PAN_in_that_period();
            end if;
		end if;
        
        if(new.start>=old.start and new.start>old.end and new.end>old.end) then
			select count(*) into count_condition_1 from Connects where new.snum = snum and new.manuf = manuf and new.start between start and end;
			select count(*) into count_condition_2 from Connects where new.snum = snum and new.manuf = manuf and new.end between start and end;
			select count(*) into count_condition_3 from Connects where new.snum = snum and new.manuf = manuf and new.start < start and new.end > end;

    
			if (count_condition_1 or count_condition_2 or count_condition_3 >= 1) then
				call that_device_is_connected_to_a_PAN_in_that_period();
            end if;
		end if;
        
        if(new.start>=old.start and new.start<=old.end and new.end>old.end) then
			select count(*) into count_condition_2 from Connects where new.snum = snum and new.manuf = manuf and new.end between start and end;
			
			if(count_condition_2<>0) then
				call that_device_is_connected_to_a_PAN_in_that_period();
			end if;
		end if;
end$$
delimiter ;



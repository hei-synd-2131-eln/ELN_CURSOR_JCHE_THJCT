--
-- VHDL Architecture Cursor_test.Consigne_vitesse_tester.arch_name
--
-- Created:
--          by - Julie.UNKNOWN (LAPTOP-J400VU4F)
--          at - 23:05:54 08.12.2021
--
-- using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
--
ARCHITECTURE consigne_vitesse_tester1 OF Consigne_vitesse_tester IS
constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0/clockFrequency * 1 sec;
  signal sClock: std_uLogic := '1';
  signal position_int: unsigned(15 downto 0) := (others => '0');
  
BEGIN

reset <= '1', '0' after 10*clockPeriod;

  sClock <= not sClock after clockPeriod/2;
  clock <= transport sClock after clockPeriod*9/10;
  
  start_0 <= '1', '0' after 12*clockPeriod;

  
  
  process
 

begin
accel<='1';
decel<='0';
pos<='0';
wait for 20*clockPeriod;
 for i in 0 to 2000 loop  
   report "i=" & integer'image(i);
    
	if (i>1000) then
	accel<='0';
	decel<='1';
	else
	accel<='1';
	decel<='0';
	end if;
	
	pos <= '1';
	position_int<=position_int+4;
	  wait for 5*clockPeriod;
	pos <='0';
	position_int<=position_int+4;
	wait for 5*clockPeriod;
   
     end loop;
	 

	 
	 
	 wait;
	 end process;

END ARCHITECTURE consigne_vitesse_tester1;


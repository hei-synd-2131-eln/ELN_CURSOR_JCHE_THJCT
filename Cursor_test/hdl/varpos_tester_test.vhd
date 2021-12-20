--
-- VHDL Architecture Cursor_test.varpos_tester.test
--
-- Created:
--          by - Julie.UNKNOWN (LAPTOP-J400VU4F)
--          at - 20:14:39 20.12.2021
--
-- using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
--
ARCHITECTURE test OF varpos_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0/clockFrequency * 1 sec;
  signal sClock: std_uLogic := '1';
  
  
BEGIN

  reset <= '1', '0' after 2*clockPeriod;
  sClock <= not sClock after clockPeriod/2;
  clock <= transport sClock after clockPeriod*9/10;
    -- test sequence
  --
  process
  begin
  
   pos <= '0';

    wait for 5 us;

 pos <= '1';

    wait for 5 us;


 pos <= '0';

    wait for 10 us;

 pos <= '1';

    wait for 10 us;
	
	 pos <= '0';

    wait for 10 us;
  end process;
  

END ARCHITECTURE test;


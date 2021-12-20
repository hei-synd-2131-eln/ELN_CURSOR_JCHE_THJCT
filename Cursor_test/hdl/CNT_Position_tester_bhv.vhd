--
-- VHDL Architecture Cursor_test.CNT_Position_tester.bhv
--
-- Created:
--          by - theo.UNKNOWN (LAPTOP-I9J0I4RD)
--          at - 13:22:35 17.12.2021
--
-- using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
--
ARCHITECTURE bhv OF CNT_Position_tester IS
constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0/clockFrequency * 1 sec;
  signal sClock: std_uLogic := '1';
  
BEGIN
   ------------------------------------------------------------------------------
  -- clock and reset
  --
  reset <= '1', '0' after 2*clockPeriod;

  sClock <= not sClock after clockPeriod/2;
  clock <= transport sClock after clockPeriod*9/10;


  ------------------------------------------------------------------------------
  -- test sequence
  --
  process
  begin
	Reset_CNT <= '0';
	encoderA_Sync <= '0';
	decod_dir <= '1';
  
  for i in 0 to 100 loop
  report "i=" & integer'image(i);
  encoderA_Sync <= '1';
  wait for 2*clockPeriod;
  encoderA_Sync <= '0';
  wait for 2*clockPeriod;
  end loop;
  
  Reset_CNT <= '1';
  wait for 2*clockPeriod;
  Reset_CNT <= '0';
  
  for i in 0 to 100 loop
  report "i=" & integer'image(i);
  encoderA_Sync <= '1';
  wait for 2*clockPeriod;
  encoderA_Sync <= '0';
  wait for 2*clockPeriod;
  end loop;
  
  decod_dir <= '0';
  
  for i in 0 to 100 loop
  report "i=" & integer'image(i);
  encoderA_Sync <= '1';
  wait for 2*clockPeriod;
  encoderA_Sync <= '0';
  wait for 2*clockPeriod;
  end loop;
  
  wait;

end process;
END ARCHITECTURE bhv;


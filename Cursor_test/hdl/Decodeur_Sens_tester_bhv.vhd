--
-- VHDL Architecture Cursor_test.Decodeur_Sens_tester.bhv
--
-- Created:
--          by - theo.UNKNOWN (LAPTOP-I9J0I4RD)
--          at - 13:41:12 14.12.2021
--
-- using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
--
ARCHITECTURE bhv OF Decodeur_Sens_tester IS
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

  
  for i in 0 to 200 loop
  report "i=" & integer'image(i);
  
  encoderA_Sync <= '1';
  wait for 5*clockPeriod;
  encoderB_Sync <= '1';
  wait for 5*clockPeriod;
  encoderA_Sync <= '0';
  wait for 5*clockPeriod;
  encoderB_Sync <= '0';
  wait for 5*clockPeriod;
  end loop;
  wait;

end process;
END ARCHITECTURE bhv;


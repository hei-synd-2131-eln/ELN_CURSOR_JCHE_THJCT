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
  
BEGIN

reset <= '1', '0' after 10*clockPeriod;

  sClock <= not sClock after clockPeriod/2;
  clock <= transport sClock after clockPeriod*9/10;
  
  start_0 <= '1', '0' after 12*clockPeriod;
  decel<='1';
  
--  wait for 0.1ms;
  
--  start_o <= '1', '0' after 1*clockPeriod;
--  decel<='1';
--  wait;
  


END ARCHITECTURE consigne_vitesse_tester1;


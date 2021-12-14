--
-- VHDL Architecture Cursor_test.compteur_10bit_tester.test_cnt
--
-- Created:
--          by - Julie.UNKNOWN (LAPTOP-J400VU4F)
--          at - 14:26:44 06.12.2021
--
-- using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
--
ARCHITECTURE test_cnt OF compteur_10bit_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0/clockFrequency * 1 sec;
  signal sClock: std_uLogic := '1';


BEGIN

  reset <= '1', '0' after 2*clockPeriod;

  sClock <= not sClock after clockPeriod/2;
  clock <= transport sClock after clockPeriod*9/10;



END ARCHITECTURE test_cnt;


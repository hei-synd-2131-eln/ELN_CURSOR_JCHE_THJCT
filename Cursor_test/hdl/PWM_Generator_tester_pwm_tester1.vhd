--
-- VHDL Architecture Cursor_test.PWM_Generator_tester.pwm_tester1
--
-- Created:
--          by - Julie.UNKNOWN (LAPTOP-J400VU4F)
--          at - 15:40:46 06.12.2021
--
-- using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
--
ARCHITECTURE pwm_tester1 OF PWM_Generator_tester IS

constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0/clockFrequency * 1 sec;
  signal sClock: std_uLogic := '1';
  
BEGIN
reset <= '1', '0' after 10*clockPeriod;

  sClock <= not sClock after clockPeriod/2;
  clock <= transport sClock after clockPeriod*9/10;
  consigne_vitesse<=to_unsigned(500,10);

END ARCHITECTURE pwm_tester1;



--
-- VHDL Architecture Cursor_test.FSM_tester.arch_name
--
-- Created:
--          by - theo.UNKNOWN (LAPTOP-I9J0I4RD)
--          at - 13:54:21 07.12.2021
--
-- using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
--
ARCHITECTURE arch_name OF FSM_tester IS
	constant clockFrequency: real := 66.0E6;
	constant clockPeriod: time := 1.0/clockFrequency * 1 sec;
	
	constant buttonsPulseWidth : time := 100 us;

	constant pulsesPerTurn: integer := 2000;
	constant pwmReadBitNb: positive :=8;
	constant pwmLowpassAddBitNb: positive :=8;
	constant voltageToSpeedBitNb: positive := 8;
	
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

    restart_Sync <= '0';
    go1_Sync <= '0';
    go2_Sync <= '0';
    button4_Sync <= '0';

    sensor1_Sync <= '0';
    sensor2_Sync <= '0';

    wait for 0.1 ms;
    
     ----------------------------------------------------------------------------
                                                    -- restart
    restart_Sync <= '1', '0' after buttonsPulseWidth;
    wait for 0.25 ms;
    sensor1_Sync <= '1', '0' after buttonsPulseWidth;
	
	
    wait for 0.25 ms;

    ----------------------------------------------------------------------------
                                                  -- advance to first stop point
    go1_Sync <= '1', '0' after buttonsPulseWidth;
    wait for 2 ms;

    ----------------------------------------------------------------------------
                                                 -- advance to second stop point
    go2_Sync <= '1', '0' after buttonsPulseWidth;
    wait for 2 ms;

    ----------------------------------------------------------------------------
                                                  -- go back to first stop point
    go1_Sync <= '1', '0' after buttonsPulseWidth;
    wait for 2 ms;

    ----------------------------------------------------------------------------
                                              -- back to start with sensor reset
    restart_Sync <= '1', '0' after buttonsPulseWidth;
    wait for 0.5 ms;
    sensor1_Sync <= '1', '0' after buttonsPulseWidth;
    wait for 0.5 ms;

    ----------------------------------------------------------------------------
                                                 -- advance to second stop point
    go2_Sync <= '1', '0' after buttonsPulseWidth;
    wait for 3 ms;

    ----------------------------------------------------------------------------
                                              -- back to start with counter stop
    restart_Sync <= '1', '0' after buttonsPulseWidth;
    wait for 2 ms;
    sensor1_Sync <= '1', '0' after buttonsPulseWidth;
    wait for 1 ms;

    wait;
  end process;
	
END ARCHITECTURE arch_name;


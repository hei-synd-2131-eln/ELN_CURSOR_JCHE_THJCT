--
-- VHDL Architecture Cursor_test.positionCounter_tester.test
--
-- Created:
--          by - zas.UNKNOWN (ZASE60F)
--          at - 10:59:46 12/ 6/2021
--
-- using Mentor Graphics HDL Designer(TM) 2019.4 (Build 4)
--
ARCHITECTURE test OF positionCounter_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0/clockFrequency * 1 sec;
  signal sClock: std_uLogic := '1';

  signal testMode_int: std_uLogic;
  
  constant buttonsPulseWidth : time := 100 us;
  constant positionBitNb : integer := 17;
  constant pulsesPerTurn: integer := 2000;
  
  signal stepCount: unsigned(10 downto 0);
  signal position_int: signed(positionBitNb-1 downto 0) := (others => '0');
 
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

    testMode_int <= '1';
    
	clear <= '0';
    
    wait for 0.1 ms;
    
    ----------------------------------------------------------------------------
                                                    -- restart
    clear <= '1', '0' after buttonsPulseWidth;
    wait for 0.25 ms;
    
    ----------------------------------------------------------------------------
                                                               -- quit test mode
    testMode_int <= '0';

    ----------------------------------------------------------------------------
                                                  -- advance to first stop point
    clear <= '1', '0' after buttonsPulseWidth;
    wait for 2 ms;

    wait;
  end process;

  --testMode <= testMode_int;
  
  ------------------------------------------------------------------------------
  -- motor feedback
  --
  count: process (sClock)
  begin
    if testMode_int = '0' then
      position_int <= position_int + 1;
    else
      position_int <= position_int + 1 * 5;
    end if;
  end process count;

  stepCount <= resize(shift_right(unsigned(position_int), position_int'length-stepCount'length), stepCount'length);

  encoderA <= stepCount(1);
  encoderB <= not stepCount(1) xor stepCount(0);
  encoderI <= '1' when stepCount = pulsesPerTurn-1 else '0';

END test;



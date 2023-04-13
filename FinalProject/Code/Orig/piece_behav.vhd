----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2023 12:52:48 PM
-- Design Name: 
-- Module Name: piece_behav - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity piece_behav is
  Port (
    v_sync : IN STD_LOGIC;
    pixel_row : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    pixel_col : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    bat_x : IN STD_LOGIC_VECTOR (10 DOWNTO 0); -- current bat x position
    serve : IN STD_LOGIC; -- initiates serve
    red : OUT STD_LOGIC;
    green : OUT STD_LOGIC;
    blue : OUT STD_LOGIC
   );
end piece_behav;

architecture Behavioral of piece_behav is
    Constant sq_size : integer := 5;
    
    Signal sq_on : std_logic;
    SIGNAL sq_x : STD_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(400, 11);
    SIGNAL sq_y : STD_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(580, 11);
    SIGNAL game_on : integer;
    -- The two lines above control the starting location of the piece
    -- Therefore we need to change the location to the middle of the top of the screen
    --      600
    --      |
    --      |
    --      |
    --       __________ 800
    --      0
    Signal sq_y_motion : STD_LOGIC_VECTOR(10 DOWNTO 0) := "000000001000";
    
    type coord is array (0 to 9, 0 to 14) of std_logic;
    signal board : coord := ("000000000000000", "000000000000000", 
    "000000000000000", "000000000000000", "000000000000000", "000000000000000", 
    "000000000000000", "000000000000000", "000000000000000", "000000000000000");  
    --initialize the game board as an array, each digit is 5 px
    --brute force piece rotation? lol i dont wanna do math :)
    type square is array (0 to 3, 0 to 3) of std_logic;
    signal square_p : square := ("0000", "0110", "0110", "0000");
    
    -- nested for loop, i and j, i multiplies by the pixel value of each position, 
    --change the color
    -- if loop to check to see what color it is based on the number in the array
    -- eg 1 is red, 2 is blue, etc
    
begin
    red <= NOT sq_on;
    green <= not sq_on;
    blue <= '1';
    
    pDraw : process (sq_x, sq_y, pixel_row, pixel_col) is
    Begin
    
        IF(game_on = 1) THEN
            --game turns on
            --create a new piece
            IF (board(0) /= "000000000000000" ) 
                then 
                game_on <= 0;
                --game ends
                
            ELSE 
                IF --Block in motion create a new block
                Else -- Continue game
                
                IF -- 
                -- create a new peiece rand number gen and set it to the top of the row
                -- every second (ish) move down one
                --if there is something in the array below it, then stop the movement of the 
                --piece else move down
                
                --
        ELSE 
            --game ends
    
        If (pixel_col >= sq_x - sq_size) AND (pixel_col <= sq_x + sq_size)
            AND (pixel_row >= sq_y - sq_size) AND (pixel_row <= sq_y + sq_size) THEN
                sq_on <= '1';
        else
            sq_on <= '0';
            
        END IF;

    End process;

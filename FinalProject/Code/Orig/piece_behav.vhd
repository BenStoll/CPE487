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
    
    type coord is array (0 to 14, 0 to 9) of std_logic; -- this is 15X 10 not 10X15 like it needs to be
    signal board : coord := ("0000000000", "0000000000", "0000000000", "0000000000", 
    "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", 
    "0000000000", "0000000000", "0000000000", "0000000000", "0000000000");  
    --initialize the game board as an array, each digit is 5 px
    --brute force piece rotation? lol i dont wanna do math :)
    type square is array (0 to 3, 0 to 3) of std_logic;
    signal square_p : square := ("0000000000", 
                                 "0000110000", 
                                 "0000110000", 
                                 "0000000000");
    
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
            --game is on and a new piece will be generated
            IF(new_piece = 0) -- if square piece is the randomly generate one
            Then
            board += square_p;
            
            IF(user input = right;)
            Then
            --boundary conditions check here
            for (int i = 9; i--; i>= 0)
                for (int j = 14; j--; j>= 0)
                    if (board(i,j) = 1; AND i /= 9)
                        Then 
                            board(i+1,j) = 1;
                            board(i,j) = 0;
            IF (movability = '1') -- have the piece numbers be 1 and the board be 2
            --then the mod of the piece and if it is 1 then the piece has a static block below it
            Then
             --add piece to game board
            Else
            --move piece down
                return 0;
                
            If (check_row = '1') -- check to see if the row can be removed
            then 
                --remove row 
            
            
            
            
            
            
            IF (board(0) /= "000000000000000" ) 
                then 
                game_on <= 0;
--game ends
--Block in motion create a new block
-- Continue game
-- 
-- create a new peiece rand number gen and set it to the top of the row
-- every second (ish) move down one
--if there is something in the array below it, then stop the movement of the 
--piece else move down
--
--game ends
        If (pixel_col >= sq_x - sq_size) AND (pixel_col <= sq_x + sq_size)
            AND (pixel_row >= sq_y - sq_size) AND (pixel_row <= sq_y + sq_size) THEN
                sq_on <= '1';
        else
            sq_on <= '0';
            
        END IF;

    End process;



end Behavioral;

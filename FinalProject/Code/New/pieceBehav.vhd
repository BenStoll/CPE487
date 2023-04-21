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
    --bat_x : IN STD_LOGIC_VECTOR (10 DOWNTO 0); -- current bat x position
    serve : IN STD_LOGIC; -- initiates serve
    red : OUT STD_LOGIC;
    green : OUT STD_LOGIC;
    blue : OUT STD_LOGIC
   );
end piece_behav;


architecture Behavioral of piece_behav is
    Constant size : integer := 5;
    Signal piece_on : std_logic;
    SIGNAL piece_x : STD_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(400, 11);
    SIGNAL piece_y : STD_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(580, 11);
    SIGNAL piece_speed : STD_LOGIC_VECTOR(10 downto 0) := "0000000000";
    SIGNAL game_on : STD_LOGIC;
    -- The two lines above control the starting location of the piece
    -- Therefore we need to change the location to the middle of the top of the screen
    --      600
    --      |
    --      |
    --      |
    --       __________ 800
    --      0
    Signal sq_y_motion : STD_LOGIC_VECTOR(4 downto 0) := "00000"; --(10 DOWNTO 0) := "000000001000";
    type coord is array (0 to 2) of std_logic_vector;
    --type coord is array (0 to 14, 0 to 9) of std_logic; -- this is 15X 10 not 10X15 like it needs to be
--    signal board : coord := ("0000000000", "0000000000", "0000000000", "0000000000", 
--    "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", "0000000000", 
--    "0000000000", "0000000000", "0000000000", "0000000000", "0000000000");  
    signal board : coord := ("0", "0", "0");
    
    --initialize the game board as an array, each digit is 5 px
    --brute force piece rotation? lol i dont wanna do math :)
    --type square is array (0 to 3, 0 to 3) of std_logic;
--    signal square_p : square := ("0000110000", 
--                                 "0000110000", 
--                                 "0000000000", 
--                                 "0000000000");
    
    -- nested for loop, i and j, i multiplies by the pixel value of each position, 
    --change the color
    -- if loop to check to see what color it is based on the number in the array
    -- eg 1 is red, 2 is blue, etc
    
begin
    red <= NOT piece_on;
    green <= not piece_on;
    blue <= '1';
    
    
    --Drawing the piece
    pDraw : PROCESS (piece_x, piece_y, pixel_row, pixel_col) is
        VARIABLE video_on : STD_LOGIC;
    Begin
        --serve can now be connectted to start the game
        IF (pixel_col >= piece_x - 399) AND (pixel_col <= piece_x + 399)
            AND (pixel_row >= piece_y - size) AND (pixel_row <= piece_y + size) THEN
            game_on <= '1';
        ELSE 
            game_on <= '0';
        END IF;
    END PROCESS;


    mPiece : PROCESS    --Moving the piece
                        --inputs would be inside this statement
    BEGIN
        WAIT UNTIL rising_edge(v_sync);
        IF piece_y + size >= 600 THEN --call check function If true then stop piece
    		--Stop piece speed = 0
		ELSIF piece_y <= size THEN -- else move piece down
			--not needed?
		END IF;
			 piece_y <= piece_y - size;-- compute next ball position

	END PROCESS;
	--in the case of the three row one col, the bottom would be adjusted each time


--game ends
--Block in motion create a new block
-- Continue game
-- create a new peiece rand number gen and set it to the top of the row
-- every second (ish) move down one
--if there is something in the array below it, then stop the movement of the 
--piece else move down
--game ends

--        If (pixel_col >= sq_x - sq_size) AND (pixel_col <= sq_x + sq_size)
--            AND (pixel_row >= sq_y - sq_size) AND (pixel_row <= sq_y + sq_size) THEN
--                sq_on <= '1';
--        else
--            sq_on <= '0';
--        END IF;




--  PIECE MOVEMENT CONTROL LOGIC
--    IF(game_on = 1) THEN
--            -- game is on and a new piece will be generated
--            -- IF(new_piece = 0) -- if square piece is the randomly generate one
--            board(0) <= board(0) + 1;
            
--            IF (board(0) = 3) Then
--                game_on <= 0; 
--            End If;
            
--            FOR i IN 0 to 2 loop 
--                IF (board(i) = 1 and i = 2) Then  -- THis is appending to board if at the bottom row
--                    board(i) <= board(i)+ 1;
                
--                ELSIF( board(i) + board(i + 1) = 3) Then -- checks if piece is below it
--                    -- if so add 
--                        board(i) <= board(i) + 1;
--                ELSE
--                    board(i) <= board(i) - 1; -- remove old piece location
--                    board(i+1) <= board(i+1) + 1; -- update new piece location
--                end IF;
--            END loop;
--        END IF;



END Behavioral;

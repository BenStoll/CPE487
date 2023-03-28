LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

--set where the piece is and therefore where the piece is not (background)
--start with the square and then use shifts to make two separate pieces that act as 1 piece
entity game_board_init is
    Port (
            v_sync      : IN std_logic;
            pixel_row   : IN std_logic;
            pixel_col   : IN std_logic;
            red         : IN std_logic;
            green       : IN std_logic;
            blue        : IN std_logic
    );
end game_board_init;

architecture Behavioral of game_board_init is
    constant block_w : integer := 5; -- block width should be 5 pixels
    constant block_h : integer := 5; -- block hieght should be 5 px
    --speed of the block (5px/var rate) for now keep constant
    constant block_speed : std_logic_vector (10 downto 0) := conv_std_logic_vector (6, 11);
    signal block_on : std_logic;
    signal game_on : std_logic := '0';
    --current block position
    signal block_x : std_logic_vector(10 downto 0) := conv_std_logic_vector (400, 11);
    signal block_y : std_logic_vector(10 downto 0) := conv_std_logic_vector (300, 11);
begin


end Behavioral;

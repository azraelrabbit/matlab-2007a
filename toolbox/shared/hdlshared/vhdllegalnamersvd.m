function str = vhdllegalnamersvd(strin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    str = vhdllegalname(strin);
    % 8 10
    % 9 10
    vhdlreservedwords = ' abs access after alias all and architecture array assert attribute begin block body buffer bus case component configuration constant disconnect downto else elsif end entity exit file for function generate generic group guarded if impure in inertial inout is label library linkage literal loop map mod nand new next nor not null of on open or others out package port postponed procedure process pure range record register reject rem report return rol ror select severity signal shared sla sll sra srl subtype then to transport type unaffected units until use variable wait when while with xnor xor real integer time std_ulogic std_ulogic_vector resolved std_logic std_logic_vector X01 X01Z UX01 UX01Z To_bit To_bitvector To_StdULogic To_StdLogicVector To_StdULogicVector To_X01 To_X01Z To_UX01 rising_edge falling_edge Is_X stdlogic_1d stdlogic_table resolution_table and_table or_table xor_table not_table logic_x01_table logic_x01z_table logic_ux01_table cvt_to_x01 cvt_to_x01z cvt_to_ux01 signed unsigned shift_left shift_right rotate_left rotate_right resize to_integer to_unsigned to_signed std_match TO_01 NAU NAS NO_WARNING ';
    % 11 29
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    if eq(isempty(findstr(horzcat(' ', lower(str), ' '), vhdlreservedwords)), 0.0)
        str = horzcat(str, hdlgetparameter('reserved_word_postfix'));
    end % if
end % function

function hdlcode = vhdltbcodercodeinit(this, node, level, nname, fp)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    comment_char = hdlgetparameter('comment_char');
    indentedcomment = horzcat('  ', comment_char, ' ');
    separatorline = horzcat(comment_char, ' ', mtimes('-', ones(1.0, minus(63.0, length(comment_char)))), '\n');
    % 10 11
    hdlcode = hdlcodeinit;
    createdate = datestr(now, 31.0);
    rcs_cvs_tag = hdlgetparameter('rcs_cvs_tag');
    package_suffix = hdlgetparameter('package_suffix');
    % 15 16
    [pathstr, fname, exten, vers] = fileparts(fullfile(this.CodeGenDirectory, horzcat(this.TestBenchName, this.TBFileNameSuffix)));
    % 17 18
    fp = strrep(pathstr, '\', '\\');
    dispname = strrep(fp, char(10.0), '_');
    % 20 22
    % 21 22
    hdlcode.entity_comment = horzcat(separatorline, comment_char, '\n', comment_char, ' Module: ', nname, '\n', comment_char, ' Simulink Path: ', dispname, '\n', comment_char, ' Created: ', createdate, '\n', comment_char, ' Hierarchy Level:', sprintf(' %d', level), '\n', comment_char, '\n', rcs_cvs_tag, comment_char, '\n', separatorline, hdlannotationcomments(node, level));
    % 23 36
    % 24 36
    % 25 36
    % 26 36
    % 27 36
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    hdlcode.package_comment = horzcat(separatorline, comment_char, '\n', comment_char, ' Module: ', nname, package_suffix, '\n', comment_char, ' Simulink Path: ', dispname, '\n', comment_char, ' Created: ', createdate, '\n', comment_char, ' Description: test bench package\n', comment_char, '\n', rcs_cvs_tag, comment_char, '\n', separatorline, hdlannotationcomments(node, level));
    % 37 49
    % 38 49
    % 39 49
    % 40 49
    % 41 49
    % 42 49
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    hdlcode.package_library = 'LIBRARY IEEE;\nUSE IEEE.std_logic_1164.all;\nUSE IEEE.numeric_std.ALL;\n';
    hdlcode.package_decl = horzcat('PACKAGE ', nname, '_pkg IS\n');
    hdlcode.package_end = horzcat('END ', nname, '_pkg;\n\n');
    hdlcode.package_functions = horzcat('\n', indentedcomment, 'Functions\n');
    hdlcode.package_procedure = horzcat('\n', indentedcomment, 'Procedures\n');
    hdlcode.package_typedefs = horzcat('\n', indentedcomment, 'Type Definitions\n');
    hdlcode.package_constants = horzcat('\n', indentedcomment, 'Constants\n');
    hdlcode.package_body = horzcat('PACKAGE BODY ', nname, '_pkg IS\n');
    % 57 59
    % 58 59
    hdlcode.arch_functions = horzcat(indentedcomment, 'Local Functions\n');
    hdlcode.arch_typedefs = horzcat(indentedcomment, 'Local Type Definitions\n');
    hdlcode.arch_constants = horzcat(indentedcomment, 'Constants\n');
    hdlcode.arch_signals = horzcat(indentedcomment, 'Signals\n');
    hdlcode.arch_body_blocks = horzcat('\n', indentedcomment, 'Block Statements\n');
    hdlcode.arch_body_output_assignments = horzcat(indentedcomment, 'Assignment Statements\n');
    hdlcode.arch_decl = horzcat('ARCHITECTURE rtl OF ', nname, ' IS\n');
    if eq(hdlgetparameter('split_entity_arch'), 1.0)
        hdlcode.arch_comment = hdlcode.entity_comment;
    else
        hdlcode.arch_comment = horzcat(separatorline, comment_char, ' Module Architecture: ', nname, '\n', separatorline);
        % 70 73
        % 71 73
        % 72 73
    end % if
    hdlcode.arch_end = 'END rtl;\n';
    hdlcode.arch_begin = '\n\nBEGIN\n';
    hdlcode.arch_body_component_instances = horzcat(indentedcomment, 'Component Instances\n');
    hdlcode.entity_library = 'LIBRARY IEEE;\nUSE IEEE.std_logic_1164.all;\nUSE IEEE.numeric_std.ALL;\n';
    % 78 80
    % 79 80
    hdlcode.entity_package = '';
    if eq(hdlgetparameter('vhdl_package_required'), 1.0)
        hdlcode.entity_package = horzcat(hdlcode.entity_package, 'USE work.', hdlgetparameter('vhdl_package_name'), '.ALL;\n');
    else
        hdlcode.entity_package = horzcat(hdlcode.entity_package, '\n');
    end % if
    % 86 87
    hdlcode.package_library = horzcat(hdlcode.package_library, hdlcode.entity_package, '\n');
    hdlcode.entity_package = horzcat(hdlcode.entity_package, 'USE work.', horzcat(nname, '_pkg'), '.ALL;\n\n');
    % 89 91
    % 90 91
    hdlcode.entity_decl = horzcat('ENTITY ', nname, ' IS\n');
    hdlcode.entity_end = horzcat('\nEND ', nname, ';\n\n\n');
    % 93 94
    hdlcode.arch_typedefs = horzcat(hdlcode.arch_typedefs, 'TYPE TBSTATE_TX IS (IDLE_TX, START_DataTX, FINISH_DataTX); \n', 'TYPE TBSTATE_RX IS (IDLE_RX, CHECK_DataRX, FINISH_DataRX); \n');
    % 95 97
    % 96 97
    hdlcode.arch_constants = horzcat(hdlcode.arch_constants, '  CONSTANT ', sprintf('%-32s', horzcat(this.ClockName, '_high')), ' : time := ', num2str(this.ForceClockHighTime), ' ns;\n', '  CONSTANT ', sprintf('%-32s', horzcat(this.ClockName, '_low')), ' : time := ', num2str(this.ForceClockLowTime), ' ns;\n', '  CONSTANT ', sprintf('%-32s', horzcat(this.ClockName, '_period')), ' : time := ', num2str(plus(this.ForceClockLowTime, this.ForceClockHighTime)), ' ns;\n', '  CONSTANT ', sprintf('%-32s', horzcat(this.ClockName, '_hold')), ' : time := ', num2str(this.ForceHoldTime), ' ns;\n', '  CONSTANT ', sprintf('%-32s', horzcat(this.ClockName, '_setup')), ' : time := ', num2str(this.ForceHoldTime), ' ns;\n', '  CONSTANT ', sprintf('%-32s', horzcat(this.ClockName, '2Q')), ' : time := ', num2str(this.ForceHoldTime), ' ns;\n', '  CONSTANT ', sprintf('%-32s', 'delay'), ' : time := ', num2str(this.ForceHoldTime), ' ns;\n\n');
    % 98 114
    % 99 114
    % 100 114
    % 101 114
    % 102 114
    % 103 114
    % 104 114
    % 105 114
    % 106 114
    % 107 114
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    % 113 114
    hdlcode.package_functions = horzcat(hdlcode.package_functions, '  FUNCTION to_integer( x : IN std_logic) RETURN integer;\n', '  FUNCTION to_hex( x : IN std_logic) RETURN string;\n', '  FUNCTION to_hex( x : IN std_logic_vector) RETURN string;\n', '  FUNCTION to_hex( x : IN bit_vector ) RETURN string;\n', '  FUNCTION to_hex( x : IN signed ) RETURN string;\n', '  FUNCTION to_hex( x : IN unsigned ) RETURN string;\n', '  FUNCTION to_hex( x : IN real ) RETURN string;\n');
    % 115 123
    % 116 123
    % 117 123
    % 118 123
    % 119 123
    % 120 123
    % 121 123
    % 122 123
    hdlcode.package_body = horzcat(hdlcode.package_body, '  FUNCTION to_integer( x : IN std_logic) RETURN integer IS\n', '    VARIABLE int: integer;\n', '  BEGIN\n', '    IF x = ''0'' THEN\n', '      int := 0;\n', '    ELSE\n', '      int := 1;\n', '    END IF;\n', '    RETURN int;\n', '  END;\n\n', '  FUNCTION to_hex( x : IN std_logic_vector) RETURN string IS\n', '    VARIABLE result  : STRING(1 TO 256); -- 1024 bits max\n', '    VARIABLE i       : INTEGER;\n', '    VARIABLE imod    : INTEGER;\n', '    VARIABLE j       : INTEGER;\n', '    VARIABLE jinc    : INTEGER;\n', '    VARIABLE newx    : std_logic_vector(1023 DOWNTO 0);\n', '  BEGIN\n', '    newx := (OTHERS => ''0'');\n', '    IF x''LEFT > x''RIGHT THEN\n', '      j := x''LENGTH-1;\n', '      jinc := -1;\n', '    ELSE\n', '      j := 0;\n', '      jinc := 1;\n', '    END IF;\n', '    FOR i IN x''RANGE LOOP\n', '      newx(j) := x(i);\n', '      j := j+jinc;\n', '    END LOOP;  -- i\n', '    i := x''LENGTH-1;\n', '    imod := x''LENGTH MOD 4;\n', '    IF    imod = 1 THEN i := i+3;\n', '    ELSIF imod = 2 THEN i := i+2;\n', '    ELSIF imod = 3 THEN i := i+1;\n', '    END IF;\n', '    j := 1;\n', '    WHILE i >= 3 LOOP\n', '      IF    newx(i DOWNTO (i-3)) = "0000" THEN result(j) := ''0'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "0001" THEN result(j) := ''1'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "0010" THEN result(j) := ''2'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "0011" THEN result(j) := ''3'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "0100" THEN result(j) := ''4'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "0101" THEN result(j) := ''5'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "0110" THEN result(j) := ''6'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "0111" THEN result(j) := ''7'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "1000" THEN result(j) := ''8'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "1001" THEN result(j) := ''9'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "1010" THEN result(j) := ''A'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "1011" THEN result(j) := ''B'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "1100" THEN result(j) := ''C'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "1101" THEN result(j) := ''D'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "1110" THEN result(j) := ''E'';\n', '      ELSIF newx(i DOWNTO (i-3)) = "1111" THEN result(j) := ''F'';\n', '      ELSE result(j) := ''X'';\n', '      END IF;\n', '      i := i-4;\n', '      j := j+1;\n', '    END LOOP;\n', '    RETURN result(1 TO j-1);\n', '  END;\n', '\n\n', '  FUNCTION to_hex( x : IN std_logic ) RETURN string IS\n', '  BEGIN\n', '    RETURN std_logic''image(x);\n', '  END;\n', '\n\n', '  FUNCTION to_hex( x : IN bit_vector ) RETURN string IS\n', '  BEGIN\n', '    RETURN to_hex( to_stdlogicvector(x) );\n', '  END;\n', '\n\n', '  FUNCTION to_hex( x : IN signed ) RETURN string IS\n', '  BEGIN\n', '    RETURN to_hex( std_logic_vector(x) );\n', '  END;\n', '\n\n', '  FUNCTION to_hex( x : IN unsigned ) RETURN string IS\n', '  BEGIN\n', '    RETURN to_hex( std_logic_vector(x) );\n', '  END;\n', '\n\n', '  FUNCTION to_hex( x : IN real ) RETURN string IS\n', '  BEGIN\n', '    RETURN real''image(x);\n', '  END;\n', '\n\n');
    % 124 210
    % 125 210
    % 126 210
    % 127 210
    % 128 210
    % 129 210
    % 130 210
    % 131 210
    % 132 210
    % 133 210
    % 134 210
    % 135 210
    % 136 210
    % 137 210
    % 138 210
    % 139 210
    % 140 210
    % 141 210
    % 142 210
    % 143 210
    % 144 210
    % 145 210
    % 146 210
    % 147 210
    % 148 210
    % 149 210
    % 150 210
    % 151 210
    % 152 210
    % 153 210
    % 154 210
    % 155 210
    % 156 210
    % 157 210
    % 158 210
    % 159 210
    % 160 210
    % 161 210
    % 162 210
    % 163 210
    % 164 210
    % 165 210
    % 166 210
    % 167 210
    % 168 210
    % 169 210
    % 170 210
    % 171 210
    % 172 210
    % 173 210
    % 174 210
    % 175 210
    % 176 210
    % 177 210
    % 178 210
    % 179 210
    % 180 210
    % 181 210
    % 182 210
    % 183 210
    % 184 210
    % 185 210
    % 186 210
    % 187 210
    % 188 210
    % 189 210
    % 190 210
    % 191 210
    % 192 210
    % 193 210
    % 194 210
    % 195 210
    % 196 210
    % 197 210
    % 198 210
    % 199 210
    % 200 210
    % 201 210
    % 202 210
    % 203 210
    % 204 210
    % 205 210
    % 206 210
    % 207 210
    % 208 210
    % 209 210
end % function

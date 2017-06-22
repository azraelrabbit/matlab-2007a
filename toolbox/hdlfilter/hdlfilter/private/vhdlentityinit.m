function [lib, pkg, decl, entity_end] = vhdlentityinit(nname)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    lib = 'LIBRARY IEEE;\nUSE IEEE.std_logic_1164.all;\nUSE IEEE.numeric_std.ALL;\n';
    pkg = '';
    decl = horzcat('ENTITY ', nname, ' IS\n');
    entity_end = horzcat('\nEND ', nname, ';\n\n\n');
end % function

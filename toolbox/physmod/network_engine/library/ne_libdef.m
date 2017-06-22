function [name, fcn] = ne_libdef
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    name = 'fl';
    fcn = @lLib;
    % 11 12
end % function
function lLib(root, lib)
    % 14 17
    % 15 17
    % 16 17
    lib.descriptor = sprintf('Foundation\nLibrary');
    lib.library('physical_signal');
    lib.library('hydraulic');
    lib.library('mechanical');
    lib.library('electrical');
    % 22 23
end % function

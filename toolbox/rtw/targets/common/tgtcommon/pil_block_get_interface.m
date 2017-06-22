function [pil_interface, pil_implementation, pil_dialog] = pil_block_get_interface(block)
    % 1 34
    % 2 34
    % 3 34
    % 4 34
    % 5 34
    % 6 34
    % 7 34
    % 8 34
    % 9 34
    % 10 34
    % 11 34
    % 12 34
    % 13 34
    % 14 34
    % 15 34
    % 16 34
    % 17 34
    % 18 34
    % 19 34
    % 20 34
    % 21 34
    % 22 34
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 35 37
    % 36 37
    if not(strcmp(get_param(block, 'ReferenceBlock'), 'pil_lib/PIL Block'))
        error('Input argument "block" must be a PIL Block.');
    end % if
    % 40 43
    % 41 43
    % 42 43
    pil_dialog = pilverification.pildialog(get_param(block, 'handle'));
    % 44 45
    pil_interface = pil_dialog.getPILInterface;
    % 46 47
    if not(isempty(pil_interface))
        pil_implementation = pil_interface.getImplementation;
    else
        pil_implementation = [];
    end % if
end % function

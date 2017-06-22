function editingModeCallback = getEditingModeCallback(hBlock, code)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    product = pmsl_getblockproduct(hBlock);
    editingModeCallback = '';
    switch lower(product)
    case 'simmechanics'
        editingModeCallback = mech_editingmodecallback(hBlock, code);
    case {'simhydraulics','simscape','simcomposer'}
        editingModeCallback = ne_editingmodecallback(hBlock, code);
    case 'simdriveline'
        editingModeCallback = drive_editingmodecallback(hBlock, code);
    end % switch
end % function

function openSimSigLib(subLib)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    isOk = strcmp(subLib, 'Routing') || strcmp(subLib, 'Attributes');
    sl('slassert', isOk, 'invalid call to openSimSigLib');
    % 9 11
    cr = sprintf('\n');
    subLib = horzcat('simulink/Signal', cr, subLib);
    open_system('simulink');
    open_system(subLib);
end

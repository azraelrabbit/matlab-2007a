function entry = pm_libdef
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    entry = PmSli.LibraryEntry(mechlib, 'SimMechanics');
    entry.Descriptor = 'SimMechanics';
    entry.Icon.setImage('mechlib.jpg');
    % 10 11
end % function

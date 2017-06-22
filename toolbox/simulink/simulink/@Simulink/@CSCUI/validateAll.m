function validateAll(hUI)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    hw = waitbar(0.0, 'Validating all definitions. Please wait...');
    % 7 8
    tmpCSCDefns = hUI.AllDefns{1.0};
    tmpMSDefns = hUI.AllDefns{2.0};
    % 10 11
    hUI.InvalidList = validatecsc(hUI.CurrPackage, tmpCSCDefns, tmpMSDefns);
    % 12 13
    waitbar(1.0, hw);
    close(hw);
end % function

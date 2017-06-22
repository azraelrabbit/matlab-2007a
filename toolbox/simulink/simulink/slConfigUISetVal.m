function slConfigUISetVal(hDlg, hSrc, prop, val)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    hParent = hSrc;
    while not(isempty(hParent.getParent)) && isa(hParent.getParent, 'Simulink.BaseConfig')
        hParent = hParent.getParent;
    end % while
    % 19 20
    hParent.set_param(prop, val);
end % function

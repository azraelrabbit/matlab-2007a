function slConfigUISetEnabled(hDlg, hSrc, prop, val)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    hParent = hSrc;
    while not(isempty(hParent.getParent)) && isa(hParent.getParent, 'Simulink.BaseConfig')
        hParent = hParent.getParent;
    end % while
    % 20 21
    hParent.setPropEnabled(prop, val);
end % function

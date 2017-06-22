function [b, str] = preApply(this, hDlg)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    b = true;
    str = '';
    % 10 11
    Hd = get(this, 'FilterObject');
    % 12 13
    names = coefficientnames(Hd);
    % 14 15
    oldValues = get(Hd, names);
    try
        values = cell(size(names));
        for indx=1.0:length(names)
            values{indx} = evaluatevars(get(this, sprintf('CoefficientVector%d', indx)));
        end % for
        % 21 22
        pMem = get(this, 'PersistentMemory');
        % 23 24
        if strcmpi(pMem, 'on')
            states = evaluatevars(get(this, 'States'));
        end % if
        % 27 28
        set(Hd, names, values);
        set(Hd, 'PersistentMemory', strcmpi(pMem, 'on'));
        % 30 31
        if strcmpi(pMem, 'on')
            set(Hd, 'States', states);
        end % if
        % 34 35
        applySettings(this.FixedPoint, Hd);
    catch
        b = false;
        str = cleanerrormsg(lasterr);
        set(Hd, names, oldValues);
    end % try
end % function

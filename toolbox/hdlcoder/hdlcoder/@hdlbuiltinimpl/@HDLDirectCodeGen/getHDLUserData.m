function hdldata = getHDLUserData(this, hC)
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
    if lt(nargin, 2.0) || isempty(hC)
        error(hdlhdlcodererrormsgid('invalidcomp'), 'Invalid First Argument');
        % 17 18
    end % if
    % 19 20
    if not(strcmp(hC.getClassName, 'black_box_comp'))
        error(hdlhdlcodererrormsgid('invalidcomp'), 'Invalid First Argument');
        % 22 23
    end % if
    % 24 25
    hdldata = hC.HDLUserData;
end % function

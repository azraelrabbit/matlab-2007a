function setHDLUserData(this, hC, hdldata)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    if lt(nargin, 3.0) || isempty(hC)
        error(hdlhdlcodererrormsgid('invalidcomp'), 'Invalid Arguments');
        % 16 17
    end % if
    % 18 19
    if not(strcmp(hC.getClassName, 'black_box_comp'))
        error(hdlhdlcodererrormsgid('invalidcomp'), 'Invalid First Argument');
        % 21 22
    end % if
    % 23 24
    hC.HDLUserData = hdldata;
end % function

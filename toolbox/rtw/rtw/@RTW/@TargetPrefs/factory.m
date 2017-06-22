function factory(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fullName = h.class;
    str = fullName;
    tempObj = eval(str);
    % 10 11
    fldNames = fieldnames(h);
    len = size(fldNames);
    for i=1.0:len
        str = horzcat('h.', fldNames{i}, ' = tempObj.', fldNames{i}, ';');
        eval(str);
    end % for
end % function

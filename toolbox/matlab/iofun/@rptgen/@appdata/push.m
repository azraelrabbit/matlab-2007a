function adNew = push(adOld)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    cls = class(adOld);
    adNew = feval(cls, 'new');
    adNew.StackPrevious = adOld;
end % function

function adNew = pop(adOld)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    adNew = adOld.StackPrevious;
    cls = class(adOld);
    if isa(adNew, cls)
        adNew = feval(cls, adNew);
    else
        adNew = adOld;
    end % if
end % function

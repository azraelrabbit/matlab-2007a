function add(h, fcnRaw, argsRaw, isDefault, dstPath)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    if isempty(h.Default)
        h.Default = isDefault;
        h.DstName = cellhorzcat(dstPath);
        h.FcnRaw = cellhorzcat(fcnRaw);
        h.ArgsRaw = cellhorzcat(argsRaw);
    else
        h.Default(plus(end, 1.0)) = isDefault;
        h.DstName{plus(end, 1.0)} = dstPath;
        h.FcnRaw{plus(end, 1.0)} = fcnRaw;
        h.ArgsRaw{plus(end, 1.0)} = argsRaw;
    end % if
end % function

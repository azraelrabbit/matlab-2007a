function maskParams = getMaskParams(this, slBlock)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    op = get_param(slBlock, 'objectparameters');
    % 8 10
    if isempty(op)
        maskParams = [];
        return;
    end % if
    % 13 15
    f = fieldnames(op);
    i = strncmp(f, 'Mask', 4.0);
    mp = f(i);
    % 17 21
    % 18 21
    % 19 21
    j = [];
    s = 'String';
    for i=1.0:length(mp)
        if findstr(s, mp{i})
            j = horzcat(j, i);
        end % if
    end % for
    mp(j) = [];
    % 28 31
    % 29 31
    i = strmatch('MaskNames', mp);
    mp(i) = [];
    i = strmatch('MaskWSVariables', mp);
    mp(i) = [];
    i = strmatch('TemplateBlock', mp);
    mp(i) = [];
    i = strmatch('MaskVariableAliases', mp);
    mp(i) = [];
    p = 'MaskCallbacks';
    i = strmatch(p, mp);
    mp(i) = [];
    mp(plus(end, 1.0)) = cellhorzcat(p);
    % 42 44
    p = 'MaskInitialization';
    i = strmatch(p, mp);
    mp(i) = [];
    mp(plus(end, 1.0)) = cellhorzcat(p);
    % 47 50
    % 48 50
    for i=1.0:length(mp)
        v{i, 1.0} = get_param(slBlock, mp{i});
    end % for
    % 52 55
    % 53 55
    pv = horzcat(mp, v);
    % 55 57
    maskParams = pv;
    % 57 59
end % function

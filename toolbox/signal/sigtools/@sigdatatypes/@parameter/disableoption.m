function disableoption(hObj, option)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(2.0, 2.0, nargin));
    % 8 10
    vv = lower(get(hObj, 'AllOptions'));
    % 10 12
    option = lower(option);
    % 12 14
    if (~(iscellstr(vv))) | (isempty(strmatch(option, vv)))
        error('Input option not available.');
    end
    % 16 18
    do = get(hObj, 'DisabledOptions');
    % 18 21
    % 19 21
    indx = strmatch(option, vv);
    if gt(length(indx), 1.0)
        error('Option name is ambiguous.');
    end
    % 24 26
    set(hObj, 'DisabledOptions', horzcat(do, indx));
    % 26 29
    % 27 29
    vv = lower(get(hObj, 'ValidValues'));
    v = lower(get(hObj, 'Value'));
    % 30 32
    if isempty(strmatch(v, vv))
        setvalue(hObj, vv{1.0});
    end
end

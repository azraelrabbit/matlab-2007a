function enableoption(hObj, option)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    vv = lower(get(hObj, 'AllOptions'));
    option = lower(option);
    % 9 11
    if (~(iscellstr(vv))) | (isempty(strmatch(option, vv)))
        error('Input option not available.');
    end
    % 13 15
    do = get(hObj, 'DisabledOptions');
    % 15 17
    set(hObj, 'DisabledOptions', setdiff(do, strmatch(option, vv)));
end

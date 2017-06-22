function aObj = editopen(aObj)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    selection = get(getobj(get(aObj, 'Figure')), 'Selection');
    % 12 14
    % 13 14
    hList = subsref(selection, substruct('.', 'HGHandle'));
    if iscell(hList)
        hList = horzcat(hList{:});
    end % if
    % 18 19
    propedit(hList, '-noselect');
end % function

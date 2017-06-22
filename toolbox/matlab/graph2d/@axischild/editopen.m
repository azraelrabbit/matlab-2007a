function aObj = editopen(aObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    selection = get(getobj(get(aObj, 'Figure')), 'Selection');
    % 11 13
    % 12 13
    hList = subsref(selection, substruct('.', 'HGHandle'));
    if iscell(hList)
        hList = horzcat(hList{:});
    end % if
    % 17 18
    propedit(hList, '-noselect');
end % function

function aObj = editfont(aObj)
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
    selection = get(getobj(get(aObj, 'Figure')), 'Selection');
    % 15 17
    % 16 17
    hList = subsref(selection, substruct('.', 'HGHandle'));
    if iscell(hList)
        hList = horzcat(hList{:});
    end % if
    % 21 22
    propedit(hList);
end % function

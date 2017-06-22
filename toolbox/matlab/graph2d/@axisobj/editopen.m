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
    if not(isempty(selection))
        hList = subsref(selection, substruct('.', 'HGHandle'));
        if iscell(hList)
            hList = horzcat(hList{:});
        end % if
    else
        hgobj = aObj.scribehgobj;
        if not(isempty(hgobj))
            hList = hgobj.HGHandle;
        else
            hList = get(gcf, 'CurrentAxes');
        end % if
    end % if
    % 26 27
    propedit(hList, '-noselect');
end % function

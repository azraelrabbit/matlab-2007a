function tf = canAcceptDrop(this, dropObjects)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    tf = true;
    for i=1.0:length(dropObjects)
        if isa(dropObjects(i), 'RptgenML.StylesheetAttribute')
            tf = true;
        else
            if isa(dropObjects(i), 'RptgenML.StylesheetHeaderCell')
                tf = false;
            else
                tf = canAcceptDrop(this.up, dropObjects(i));
            end % if
        end % if
        if not(tf)
            return;
        end % if
    end % for
end % function

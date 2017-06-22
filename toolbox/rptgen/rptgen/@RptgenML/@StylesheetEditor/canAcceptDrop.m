function tf = canAcceptDrop(this, dropObjects)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    tf = true;
    for i=1.0:length(dropObjects)
        if isa(dropObjects(i), 'RptgenML.StylesheetAttribute') || isa(dropObjects(i), 'RptgenML.StylesheetHeaderCell')
            tf = false;
            return;
        else
            if isa(dropObjects(i), 'RptgenML.StylesheetElement')
            else
                % 17 22
                % 18 22
                % 19 22
                % 20 22
                % 21 23
                tf = false;
                return;
            end % if
        end % if
    end % for
end % function

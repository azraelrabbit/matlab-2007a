function tf = canAcceptDrop(this, dropObjects)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    tf = true;
    for i=1.0:length(dropObjects)
        if isa(dropObjects(i), 'RptgenML.StylesheetEditor') || isa(dropObjects(i), 'rptgen.coutline') || isa(dropObjects(i), 'rpt_xml.db_output')
        else
            % 14 16
            % 15 16
            % 16 17
            tf = false;
            return;
        end % if
    end % for
end % function

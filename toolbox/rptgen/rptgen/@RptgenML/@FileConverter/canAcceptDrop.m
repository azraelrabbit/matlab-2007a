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
        if isa(dropObjects(i), 'RptgenML.StylesheetEditor') && not(isempty(dropObjects(i).ID))
        else
            % 13 15
            if isa(dropObjects(i), 'rptgen.coutline') || isa(dropObjects(i), 'rpt_xml.db_output')
            else
                % 16 18
                if isa(dropObjects(i), 'RptgenML.LibraryFile')
                    tf = true;
                else
                    tf = false;
                    return
                end
            end
        end
    end % for
end

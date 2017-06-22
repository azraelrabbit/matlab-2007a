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
        tf = isa(dropObjects(i), 'RptgenML.LibraryRpt') || isa(dropObjects(i), 'RptgenML.FileConverter') || isa(dropObjects(i), 'rptgen.coutline') || isa(dropObjects(i), 'RptgenML.ComponentMaker');
        % 12 16
        % 13 16
        % 14 16
        if not(tf)
            return
        end
    end % for
end

function tf = acceptDrop(this, dropObjects)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    tf = false;
    % 7 10
    % 8 10
    if isempty(dropObjects)
        return
    end
    % 12 14
    for i=1.0:length(dropObjects)
        if isa(dropObjects(i), 'RptgenML.LibraryRpt')
            tf = true;
            % 16 18
            lastRpt = this.addReport(fullfile(dropObjects(i).PathName, dropObjects(i).FileName));
        else
            if not(isequal(up(dropObjects(i)), this))
                connect(dropObjects(i), this, 'up');
            end
        end
    end % for
end

function dupeFound = checkDuplicateStylesheetID(this, idVal)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if lt(nargin, 2.0)
        % 16 17
        try
            idVal = this.ID;
        catch
            % 20 22
            % 21 22
            dupeFound = false;
            return;
        end % try
        this = up(this);
    end % if
    % 27 28
    if isempty(this)
        dupeFound = false;
        return;
    end % if
    % 32 33
    duplicateHandles = find(this, '-depth', 1.0, '-isa', 'rptgen.DAObject', 'ID', idVal);
    switch length(duplicateHandles)
    case 0.0
        dupeFound = false;
    case 1.0
        dupeFound = false;
        set(duplicateHandles, 'ErrorMessage', '');
        duplicateHandles.updateErrorState;
    otherwise
        dupeFound = true;
        set(duplicateHandles, 'ErrorMessage', sprintf('Duplicate stylesheet identifier "%s".  Remove one or more instance of "%s".', idVal, idVal));
        % 44 46
        % 45 46
    end % switch
    % 47 48
    ed = DAStudio.EventDispatcher;
    for i=1.0:length(duplicateHandles)
        ed.broadcastEvent('PropertyChangedEvent', duplicateHandles(i));
        % 51 52
    end % for
end % function

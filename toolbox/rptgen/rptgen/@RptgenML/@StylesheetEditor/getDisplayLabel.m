function dLabel = getDisplayLabel(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    dLabel = this.DisplayName;
    if isempty(this.JavaHandle)
        if isempty(dLabel)
            dLabel = xlate('Stylesheet Editor');
        end
        return
    else
        if isempty(dLabel)
            dLabel = xlate('<<Unnamed Stylesheet>>');
        end
    end
    if this.getDirty
        dirtyFlag = '*';
    else
        dirtyFlag = '';
    end
    dLabel = horzcat(xlate('Stylesheet'), ' - ', dLabel, dirtyFlag);
end

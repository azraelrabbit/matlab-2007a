function [index, selectedgrid] = getselectedindex(this, operator, value)
    % 1 5
    % 2 5
    % 3 5
    data = this.parent.gethdsdata(this.hdsvariable);
    if this.isgridvariable
        data_grid = this.parent.getinddata(this.hdsvariable);
    end % if
    newvalue = value;
    selectedgrid = [];
    switch operator
    case 'is'
        index = localIsMember(data, newvalue);
        if this.isgridvariable
            selectedgrid = ismember(data_grid, newvalue);
        end % if
    case 'not'
        index = not(localIsMember(data, newvalue));
        if this.isgridvariable
            selectedgrid = not(ismember(data_grid, newvalue));
        end % if
    end % switch
function ind = localIsMember(innerSet, outerSet)
    % 23 27
    % 24 27
    % 25 27
    I = find(not(cellfun('isempty', innerSet)));
    ind = false(size(innerSet));
    if isempty(I)
        return;
    end % if
    ind(I(ismember(innerSet(I), outerSet))) = true;

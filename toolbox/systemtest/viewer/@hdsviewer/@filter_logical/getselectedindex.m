function [index, selectedgrid] = getselectedindex(this, value)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if this.iscelled
        data = cell2mat(this.parent.gethdsdata(this.hdsvariable));
        if this.isgridvariable
            data_grid = cell2mat(this.parent.getinddata(this.hdsvariable));
        end % if
    else
        data = this.parent.gethdsdata(this.hdsvariable);
        if this.isgridvariable
            data_grid = this.parent.getinddata(this.hdsvariable);
        end % if
    end % if
    newvalue = value;
    index = eq(data, newvalue);
    selectedgrid = [];
    if this.isgridvariable
        selectedgrid = eq(data_grid, newvalue);
    end % if
end % function

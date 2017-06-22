function [index, selectedgrid] = getselectedindex(this, operator, value)
    % 1 5
    % 2 5
    % 3 5
    if this.iscelled
        data_full = cell2mat(this.parent.gethdsdata(this.hdsvariable));
        if this.isgridvariable
            data_grid = cell2mat(this.parent.getinddata(this.hdsvariable));
        end % if
    else
        data_full = this.parent.gethdsdata(this.hdsvariable);
        if this.isgridvariable
            data_grid = this.parent.getinddata(this.hdsvariable);
        end % if
    end % if
    newvalue = value;
    selectedgrid = [];
    MultiFactor = 10000.0;
    switch operator
    case '=='
        index = le(abs(minus(data_full, newvalue)), localMinimumIncrement(mtimes(data_full, MultiFactor)));
        if this.isgridvariable
            selectedgrid = le(abs(minus(data_grid, newvalue)), localMinimumIncrement(mtimes(data_grid, MultiFactor)));
        end % if
    case '~='
        index = not(le(abs(minus(data_full, newvalue)), localMinimumIncrement(mtimes(data_full, MultiFactor))));
        if this.isgridvariable
            selectedgrid = not(le(abs(minus(data_grid, newvalue)), localMinimumIncrement(mtimes(data_grid, MultiFactor))));
        end % if
    case '>'
        index = gt(data_full, newvalue);
        if this.isgridvariable
            selectedgrid = gt(data_grid, newvalue);
        end % if
    case '>='
        index = or(ge(data_full, newvalue), le(abs(minus(data_full, newvalue)), localMinimumIncrement(mtimes(data_full, MultiFactor))));
        if this.isgridvariable
            selectedgrid = or(ge(data_grid, newvalue), le(abs(minus(data_grid, newvalue)), localMinimumIncrement(mtimes(data_grid, MultiFactor))));
        end % if
    case '<'
        index = lt(data_full, newvalue);
        if this.isgridvariable
            selectedgrid = lt(data_grid, newvalue);
        end % if
    case '<='
        index = or(le(data_full, newvalue), le(abs(minus(data_full, newvalue)), localMinimumIncrement(mtimes(data_full, MultiFactor))));
        if this.isgridvariable
            selectedgrid = or(le(data_grid, newvalue), le(abs(minus(data_grid, newvalue)), localMinimumIncrement(mtimes(data_grid, MultiFactor))));
        end % if
    end % switch
function incr = localMinimumIncrement(x)
    % 51 54
    % 52 54
    if isfloat(x)
        incr = eps(x);
    else
        if isinteger(x)
            incr = 0.0;
        else
            error('Invalid data type');
        end % if
    end % if

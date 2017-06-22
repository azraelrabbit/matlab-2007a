function orderCells(this)
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
    tableTitle = this.TableTitle;
    pc = this.down;
        while not(isempty(pc))
        nextpc = pc.right;
        if isa(pc, 'rptgen.rpt_prop_cell')
            disconnect(pc);
        end % if
        pc = nextpc;
    end % while
    % 24 25
    connect(tableTitle, this, 'up');
    for i=1.0:length(this.TableContent)
        connect(this.TableContent(i), this, 'up');
    end % for
end % function

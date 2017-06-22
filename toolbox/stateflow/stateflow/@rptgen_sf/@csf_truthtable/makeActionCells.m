function out = makeActionCells(c, d)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    aTable = c.RuntimeTruthTable.ActionTable;
    % 10 12
    if c.ShowActionCode
        % 12 14
        if lt(nargin, 2.0)
            % 14 16
            for i=1.0:size(aTable, 1.0)
                aTable{i, 2.0} = set(sgmltag, 'tag', 'ProgramListing', 'data', aTable{i, 2.0}, 'indent', logical(0));
                % 17 21
                % 18 21
                % 19 21
            end % for
        else
            for i=1.0:size(aTable, 1.0)
                if isempty(findstr(aTable{i, 2.0}, char(10.0)))
                    % 24 28
                    % 25 28
                    % 26 28
                    aTable{i, 2.0} = d.createElement('computeroutput', aTable{i, 2.0});
                else
                    aTable{i, 2.0} = d.createElement('programlisting', aTable{i, 2.0});
                    setAttribute(aTable{i, 2.0}, 'xml:space', 'preserve');
                end
            end % for
        end
        % 34 36
        aHeader = cellhorzcat(xlate('Action'));
        aWid = 9.0;
    else
        % 38 40
        aTable = aTable(:, 1.0);
        aHeader = {};
        aWid = [];
    end
    % 43 45
    if c.ShowActionDescription
        aHeader = horzcat(cellhorzcat(xlate('Description')), aHeader);
        aWid = horzcat(6.0, aWid);
    else
        % 48 50
        aTable = aTable(:, 2.0:end);
    end
    % 51 53
    if c.ShowActionNumber && not(isempty(aTable))
        aTable = horzcat(ctranspose(num2cell(1.0:size(aTable, 1.0))), aTable);
        aHeader = horzcat(cellhorzcat(xlate('#')), aHeader);
        aWid = horzcat(1.0, aWid);
    else
        % 57 59
    end
    % 59 61
    if c.ShowActionHeader
        aTable = vertcat(aHeader, aTable);
        % 62 66
        % 63 66
        % 64 66
    end
    % 66 68
    out = cellhorzcat(aTable, aWid);
end

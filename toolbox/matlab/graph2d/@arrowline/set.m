function A = set(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    lArgin = varargin;
    while ge(length(lArgin), 2.0)
        prop = lArgin{1.0};
        val = lArgin{2.0};
        % 11 13
        lArgin = lArgin(3.0:end);
        switch prop
        case 'XYData'
            editlineObj = A.editline;
            A.editline = set(editlineObj, 'XYData', val(1.0:2.0));
        case 'XYDataRefresh'
            editlineObj = A.editline;
            A.editline = set(editlineObj, 'XYData', val(1.0:2.0));
            makearrow(A.arrowhead);
        case 'Refresh'
            makearrow(A.arrowhead);
        case 'XData'
            editlineObj = A.editline;
            A.editline = set(editlineObj, prop, val);
            makearrow(A.arrowhead);
        case 'YData'
            editlineObj = A.editline;
            A.editline = set(editlineObj, prop, val);
            makearrow(A.arrowhead);
        case 'EraseMode'
            switch val
            case 'xor'
                set(horzcat(A.fullline, A.line, A.arrowhead), 'EraseMode', 'xor');
                set(horzcat(A.line, A.arrowhead), 'Visible', 'off')
                set(A.fullline, 'LineStyle', ':');
            case 'normal'
                set(horzcat(A.fullline, A.line, A.arrowhead), 'Visible', 'on', 'EraseMode', 'normal');
                % 39 42
                % 40 42
                set(A.fullline, 'LineStyle', 'none');
            end % switch
        case 'Color'
            set(A.line, prop, val);
            set(A.arrowhead, 'FaceColor', val, 'EdgeColor', val);
            % 47 49
        case 'LineWidth'
            % 48 50
            set(A.line, prop, val);
            makearrow(A.arrowhead);
        case {'LineStyle';'Marker';'MarkerSize';'MarkerEdgeColor';'MarkerFaceColor'}
            % 52 57
            % 53 57
            % 54 57
            % 55 57
            set(A.line, prop, val);
        otherwise
            editlineObj = A.editline;
            A.editline = set(editlineObj, prop, val);
        end % switch
    end % while

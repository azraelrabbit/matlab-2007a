function A = set(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    lArgin = varargin;
    % 9 10
    HG = get(A, 'MyHGHandle');
    % 11 12
        while ge(length(lArgin), 2.0)
        prop = lArgin{1.0};
        val = lArgin{2.0};
        % 15 16
        lArgin = lArgin(3.0:end);
        switch prop
        case {'XYData','XYDataRefresh'}
            set(HG, 'XData', val{1.0}, 'YData', val{2.0});
        otherwise
            axischildObj = A.axischild;
            A.axischild = set(axischildObj, prop, val);
        end % switch
    end % while
end % function

function aObj = dodrag(aObj, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    axischildObj = aObj.axischild;
    aObj.axischild = dodrag(axischildObj, varargin{:});
    % 9 11
    myHG = get(aObj, 'MyHGHandle');
    units = get(myHG, 'Units');
    % 12 14
    switch units
    case 'data'
        parentAx = get(myHG, 'Parent');
        labels = get(parentAx, {'XLabel','YLabel','ZLabel','Title'});
        if find(eq(myHG, horzcat(labels{:})))
            % 18 20
            set(myHG, 'Units', 'normalized');
            initialPosition = varargin{1.0};
            aObj = set(aObj, 'Offset', initialPosition);
        else
            savedState = get(aObj, 'SavedState');
            savedState.DataUnitDrag = 1.0;
            aObj = set(aObj, 'SavedState', savedState);
        end % if
    otherwise
        % 28 30
        initialPosition = varargin{1.0};
        aObj = set(aObj, 'Offset', initialPosition);
    end % switch

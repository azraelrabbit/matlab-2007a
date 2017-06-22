function hObj = PmDropDown(varargin)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    hObj = PMDialogs.PmDropDown;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    % 28 29
    if lt(nargin, 4.0) || gt(nargin, 8.0)
        error(xlate('Wrong number of input arguments (need 4 or 8 arguments)'));
    end % if
    % 32 33
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 38 41
    % 39 41
    % 40 41
    hObj.Label = varargin{2.0};
    hObj.ValueBlkParam = varargin{3.0};
    hObj.Choices = lValidateVectorVals(varargin{4.0}, 'Choices');
    hObj.LabelAttrb = 0.0;
    hObj.Value = '';
    % 46 47
    if gt(nargin, 4.0) && isnumeric(varargin{5.0}) && ge(varargin{5.0}, 0.0) && lt(varargin{5.0}, 4.0)
        hObj.LabelAttrb = int32(varargin{5.0});
    end % if
    % 50 51
    if gt(nargin, 5.0)
        hObj.Value = varargin{6.0};
    end % if
    % 54 55
    if gt(nargin, 6.0)
        if not(isempty(varargin{7.0}))
            if eq(numel(hObj.Choices), numel(varargin{7.0}))
                hObj.ChoiceVals = lValidateVectorVals(varargin{7.0}, 'ChoiceVals');
            else
                error('PmDropDown:PmDropDown:BadChoiceArray', xlate('ChoiceVals array must be same size as Choices array.'));
                % 61 62
            end % if
        end % if
    end % if
    % 65 66
    if gt(nargin, 7.0)
        if not(isempty(varargin{8.0}))
            if eq(numel(hObj.Choices), numel(varargin{8.0}))
                hObj.MapVals = lValidateVectorVals(varargin{8.0}, 'MapVals');
            else
                error('PmDropDown:PmDropDown:BadMap', xlate('MapVals array must be same size as Choices array.'));
                % 72 73
            end % if
        end % if
    end % if
end % function
function newVal = lValidateVectorVals(val, argName)
    % 78 81
    % 79 81
    % 80 81
    newVal = val;
    if isempty(val)
        return;
    end % if
    % 85 86
    if not(isvector(val))
        error('PmDropDown:PmDropDown:ExpectVector', xlate('Expected vector (1-D array) for %s array.', argName));
        % 88 89
    end % if
end % function

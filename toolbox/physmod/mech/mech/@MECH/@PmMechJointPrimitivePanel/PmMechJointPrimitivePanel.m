function hObj = PmMechJointPrimitivePanel(varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    hObj = MECH.PmMechJointPrimitivePanel;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    hObj.NoCutOption = false;
    % 15 16
    if lt(nargin, 1.0)
        error(xlate('Wrong number of input arguments (need only one arguments)'));
    end % if
    % 19 20
    if ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    else
        error(xlate('Expecting handle for first argument.'));
    end % if
    % 25 26
    if gt(nargin, 1.0)
        if islogical(varargin{2.0})
            hObj.NoCutOption = varargin{2.0};
        else
            error('PmMechJointPrimitivePanel::PmMechJointPrimitivePanel', xlate('Expected second argumen of type bool.'));
            % 31 32
        end % if
    end % if
    % 34 35
    hObj.ParamName = 'PrimitiveProps';
    hObj.ForceCut = false;
    % 37 38
end % function

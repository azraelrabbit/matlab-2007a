function hObj = PmMechBranchBarPanel(varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    hObj = MECH.PmMechBranchBarPanel;
    hObj.CreateInstanceFcn = PMDialogs.PmCreateInstance;
    hObj.PortSpinnerLabel = '';
    % 14 15
    if gt(nargin, 0.0) && ishandle(varargin{1.0})
        hObj.BlockHandle = varargin{1.0};
    end % if
    % 18 21
    % 19 21
    % 20 21
    if gt(nargin, 1.0) && ischar(varargin{2.0})
        hObj.PortSpinnerLabel = varargin{2.0};
    end % if
    % 24 25
    hBlk = hObj.BlockHandle;
    % 26 27
    portSpinner = PMDialogs.PmLabelSpinner(hBlk, hObj.PortSpinnerLabel, 'NumSAPorts', [0.0 99.0]);
    % 28 30
    % 29 30
    portPanel = PMDialogs.PmGroupPanel(hBlk, xlate('Connection Parameters'), 'Box');
    portPanel.Items = portSpinner;
    % 32 33
    hObj.Items = portPanel;
end % function

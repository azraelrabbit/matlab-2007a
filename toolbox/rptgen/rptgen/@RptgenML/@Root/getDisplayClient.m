function displayClient = getDisplayClient(this, action)
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
    if lt(nargin, 2.0)
        displayClient = setClientVisible(this, true);
        com.mathworks.toolbox.rptgencore.GenerationDisplayClient.setMessageClient(displayClient);
    else
        switch action
        case '-hide'
            setClientVisible(this, false);
        case '-view'
            setClientVisible(this, true);
        otherwise
            setClientVisible(this, not(getClientVisible(this)));
        end % switch
    end % if
function displayClient = setClientVisible(this, isVis)
    % 28 32
    % 29 32
    % 30 32
    if isempty(this.StatusWindow) && isVis
        displayClient = com.mathworks.toolbox.rptgencore.gui.GenerationMessageList;
        displayClient.frameify;
        this.StatusWindow = displayClient;
    else
        displayClient = this.StatusWindow;
        if not(isempty(displayClient))
            try
                setFrameVisible(displayClient, isVis);
                % 40 43
                % 41 43
            end % try
        end % if
    end % if
function isVis = getClientVisible(this)
    % 46 50
    % 47 50
    % 48 50
    if isempty(this.StatusWindow)
        isVis = false;
    else
        try
            isVis = this.StatusWindow.getRootPane.getParent.isVisible;
        catch
            isVis = false;
        end % try
    end % if

function Close(mplayObjs)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    for i=1.0:numel(mplayObjs)
        mplayObj = mplayObjs(i);
        % 27 28
        if not(isempty(mplayObj.widgetsObj.hfig))
            % 29 35
            % 30 35
            % 31 35
            % 32 35
            % 33 35
            % 34 35
            set(mplayObj.widgetsObj.hfig, 'DeleteFcn', '');
            % 36 53
            % 37 53
            % 38 53
            % 39 53
            % 40 53
            % 41 53
            % 42 53
            % 43 53
            % 44 53
            % 45 53
            % 46 53
            % 47 53
            % 48 53
            % 49 53
            % 50 53
            % 51 53
            % 52 53
            mplayObj.Visible('off');
            % 54 58
            % 55 58
            % 56 58
            % 57 58
            if eq(mplayObj.InstanceNumber('count'), 1.0)
                mplayObj.preferencesObj.closedlg;
            end % if
            mplayObj.InstanceNumber('free');
            % 62 64
            % 63 64
            DeleteTimersCloseFig(mplayObj);
        end % if
    end % for
end % function
function DeleteTimersCloseFig(mplayObj)
    % 69 89
    % 70 89
    % 71 89
    % 72 89
    % 73 89
    % 74 89
    % 75 89
    % 76 89
    % 77 89
    % 78 89
    % 79 89
    % 80 89
    % 81 89
    % 82 89
    % 83 89
    % 84 89
    % 85 89
    % 86 89
    % 87 89
    % 88 89
    mplayObj.listenObj.StopMethod.Callback = cellhorzcat(@FinalShutdownSteps, mplayObj);
    mplayObj.listenObj.StopMethod.Enabled = 'on';
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    % 95 96
    if not(isempty(mplayObj.datasourceObj.playbackControls))
        Stop(mplayObj.datasourceObj.playbackControls);
    else
        FinalShutdownSteps([], [], mplayObj);
    end % if
end % function
function FinalShutdownSteps(hcb, event, mplayObj)
    % 103 111
    % 104 111
    % 105 111
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    % 110 111
    if not(isempty(mplayObj.listenObj))
        mplayObj.listenObj.StopMethod.Enabled = 'off';
        Close(mplayObj.listenObj);
        mplayObj.listenObj = [];
    end % if
    % 116 122
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    % 121 122
    try
        close(mplayObj.datasourceObj);
        % 124 125
    end % try
    mplayObj.datasourceObj = [];
    % 127 129
    % 128 129
    Close(mplayObj.widgetsObj);
end % function

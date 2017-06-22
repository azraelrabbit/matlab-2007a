function Pause(mplayObj, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    controls = mplayObj.datasourceObj.playbackControls;
    if isempty(controls)
        send(mplayObj, 'PauseEvent');
    else
        Pause(controls, varargin{:});
    end % if
end % function

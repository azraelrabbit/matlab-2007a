function pauseEventHandler(this, event)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if this.debug
        disp('DCS pause event');
        drawnow
    end % if
    update(this.srcObj.playbackControls);
end % function

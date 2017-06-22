function disconnectEventHandler(this, event)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if this.debug
        disp('DCS: disconnect event');
        drawnow
    end % if
    disconnect_state(this);
end % function

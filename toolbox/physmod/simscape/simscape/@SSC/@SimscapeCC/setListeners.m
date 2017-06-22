function setListeners(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    propList = getClientPropertyList;
    % 10 11
    this.someListenersNotInstalled = false;
    % 12 13
    for i=1.0:length(propList)
        % 14 15
        prop = findprop(this, propList(i).Name);
        % 16 17
        listenData = propList(i).Listener;
        % 18 19
        for anEvent=listenData.Event
            % 20 21
            listener = handle.listener(this, prop, anEvent{1.0}, listenData.Callback);
            listener.CallbackTarget = listenData.CallbackTarget();
            % 23 24
            if not(isempty(listener.CallbackTarget))
                % 25 26
                this.Listener = appendToList(this.Listener, listener);
            else
                % 28 29
                % 29 32
                % 30 32
                % 31 32
                this.someListenersNotInstalled = true;
                break
                % 34 35
            end % if
            % 36 37
        end % for
        % 38 39
    end % for
end % function

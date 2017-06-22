function updateErrorState(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    oldEmpty = isempty(this.ErrorMessage);
    % 8 10
    % 9 10
    if ne(oldEmpty, isempty(this.ErrorMessage))
        % 11 12
        ed = DAStudio.EventDispatcher;
        ed.broadcastEvent('PropertyChangedEvent', this);
    end % if
end % function

function updateErrorState(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    thisParent = this.up;
    if isa(thisParent, 'rptgen.rptcomponent')
        oldEmpty = isempty(this.ErrorMessage);
        this.ErrorMessage = checkComponentTree(thisParent, this);
        if ne(oldEmpty, isempty(this.ErrorMessage))
            % 12 13
            ed = DAStudio.EventDispatcher;
            ed.broadcastEvent('PropertyChangedEvent', this);
        end % if
    else
        this.ErrorMessage = '';
    end % if
end % function

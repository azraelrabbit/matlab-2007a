function update(this, event)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    methodName = mfilename;
    pm_superclassmethod(this, class(this), methodName, event);
    % 10 12
    % 11 12
    bd = this.getBlockDiagram;
    clients = this.getClientClasses;
    % 14 15
    for idx=1.0:length(clients)
        if any(strcmp(methodName, methods(clients{idx})))
            eval(horzcat(clients{idx}, '.', methodName, '( event , bd );'));
        end % if
        % 19 20
    end % for
end % function

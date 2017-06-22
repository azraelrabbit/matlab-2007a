function displayMessage(msg, priority, compressLines)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if not(isempty(msg))
        if lt(nargin, 3.0) || compressLines
            javaMethod('staticAddMessage', 'com.mathworks.toolbox.rptgencore.GenerationDisplayClient', msg, priority);
        else
            % 22 23
            % 23 24
            javaMethod('staticAddMessageMultiLine', 'com.mathworks.toolbox.rptgencore.GenerationDisplayClient', msg, priority);
            % 25 27
            % 26 27
        end % if
    end % if
end % function

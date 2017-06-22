function c = makeComponent(libC, isSafe)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    try
        c = feval(libC.ClassName);
    catch
        if lt(nargin, 2.0) || isSafe
            c = rptgen.crg_comment('CommentText', sprintf('Could not create component class "%s"', libC.ClassName));
        else
            c = [];
        end % if
    end % try
end % function

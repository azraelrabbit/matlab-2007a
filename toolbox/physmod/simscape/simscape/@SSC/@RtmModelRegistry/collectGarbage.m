function collectGarbage(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    j = 1.0;
        while le(j, length(this.modelInfo))
        % 10 11
        if strcmp(class(this.modelInfo(j).model), 'handle')
            this.modelInfo(j) = [];
        else
            j = plus(j, 1.0);
        end % if
        % 16 17
    end % while
end % function

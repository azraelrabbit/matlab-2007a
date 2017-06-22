function UserArray = callUserSaveFunction(hIntermediate, Array, hParentArrayNode)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    UserArray = Array;
    % 9 11
    % 10 11
    if isequal(hParentArrayNode, -1.0)
        % 12 13
        UserSaveFcnHandle = [];
        % 14 16
        % 15 16
        if not(isempty(UserSaveFcnHandle))
            % 17 21
            % 18 21
            % 19 21
            % 20 21
            if isequal(numel(Array), 1.0) && strcmp(hIntermediate.getArrayFunctionalType(Array), 'udd_object')
                % 22 25
                % 23 25
                % 24 25
                try
                    % 26 30
                    % 27 30
                    % 28 30
                    % 29 30
                    UserArray = Array;
                    % 31 36
                    % 32 36
                    % 33 36
                    % 34 36
                    % 35 36
                end % try
            end % if
            % 38 42
            % 39 42
            % 40 42
            % 41 42
        end % if
    end % if
    % 44 47
    % 45 47
    % 46 47
end % function

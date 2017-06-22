function [SupportedFlag, Warning] = isArraySupported(hIntermediate, Array, FunctionalType)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    Warning = [];
    % 13 16
    % 14 16
    Dimensions = size(Array);
    % 16 19
    % 17 19
    switch FunctionalType
    case 'char'
        % 20 22
        if gt(numel(Dimensions), 2.0)
            Warning = sprintf('Character arrays with Dimension > 2 are not supported and will be skipped.');
            % 23 25
        end % if
        % 25 28
        % 26 28
        if any(isstrprop(Array(:), 'cntrl'))
            Warning = sprintf('Character arrays containing control characters are not supported and will be skipped.');
            % 29 32
            % 30 32
        end % if
    case 'numeric'
        % 33 36
        % 34 36
        if gt(numel(Dimensions), 2.0)
            Warning = sprintf('Numeric arrays with Dimension > 2 are not supported and will be skipped.');
            % 37 39
        end % if
    case 'logical'
        % 40 43
        % 41 43
        if gt(numel(Dimensions), 2.0)
            Warning = sprintf('Logical arrays with Dimension > 2 are not supported and will be skipped.');
            % 44 46
        end % if
    case {'udd_object','udd_value'}
        % 47 50
        % 48 50
        if not(isequal(numel(Array), 1.0))
            Warning = sprintf('Data object arrays with more than one element are not supported and will be skipped.');
            % 51 53
        end % if
    otherwise
        % 54 56
        Warning = sprintf(horzcat('Arrays of class "', class(Array), '" are not supported and will be skipped.'));
        % 56 59
        % 57 59
    end % switch
    % 59 62
    % 60 62
    SupportedFlag = isempty(Warning);
    % 62 64

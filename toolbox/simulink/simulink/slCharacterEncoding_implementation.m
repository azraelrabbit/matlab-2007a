function prevEncoding = slCharacterEncoding_implementation(varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    newEncoding = [];
    if gt(nargin, 0.0)
        newEncoding = varargin{1.0};
    end % if
    % 10 11
    prevEncoding = feature('DefaultCharacterSet');
    % 12 13
    if not(isempty(newEncoding))
        if not(isequal(prevEncoding, 'US-ASCII'))
            hasOpenSys = not(isempty(find_system('type', 'block_diagram')));
            if hasOpenSys
                error('Use ''bdclose all'' to close all open systems and libraries before changing locale.');
            end % if
        end % if
        % 20 21
        prevEncoding = feature('DefaultCharacterSet', newEncoding);
    end % if
end % function

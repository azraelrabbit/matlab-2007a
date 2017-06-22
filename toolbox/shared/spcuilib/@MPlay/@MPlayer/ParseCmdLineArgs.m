function srcObj = ParseCmdLineArgs(mplayObj, varargin)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    if eq(nargin, 1.0)
        % 24 27
        % 25 27
        srcObj = MPlay.SrcWksp(mplayObj, []);
    else
        if gt(nargin, 1.0) && iscell(varargin{1.0})
            % 29 31
            v = varargin{1.0};
            if not(isempty(v)) && iscell(v{1.0})
                % 32 35
                % 33 35
                w = v{1.0};
                srcObj = MPlay.SrcWksp(mplayObj, w{:});
            else
                % 37 39
                srcObj = MPlay.SrcSL(mplayObj, varargin{:});
            end % if
        else
            if gt(nargin, 1.0) && ischar(varargin{1.0})
                % 42 44
                srcObj = MPlay.SrcFile(mplayObj, varargin{:});
            else
                % 45 48
                % 46 48
                srcObj = MPlay.SrcWksp(mplayObj, varargin{:});
            end % if
        end % if
    end % if
end % function

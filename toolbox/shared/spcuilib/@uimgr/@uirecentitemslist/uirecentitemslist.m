function h = uirecentitemslist(varargin)
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
    if gt(nargin, 0.0) && isscalar(varargin{1.0}) && ishandle(varargin{1.0})
        h = varargin{1.0};
        varargin(1.0) = [];
    else
        h = uimgr.uirecentitemslist;
    end % if
    % 23 26
    % 24 26
    h.StateName = '';
    % 26 28
    [rflArgs, uiArgs] = local_ParseArgs(h, varargin);
    % 28 39
    % 29 39
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    h.uiitem(uiArgs{:});
    % 39 42
    % 40 42
    h.recentFiles = spcwidgets.RecentFilesList(rflArgs{:});
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    h.WidgetFcn = @(hThis,state)connect(hThis);
function [rflArgs, uiArgs] = local_ParseArgs(h, args)
    % 48 69
    % 49 69
    % 50 69
    % 51 69
    % 52 69
    % 53 69
    % 54 69
    % 55 69
    % 56 69
    % 57 69
    % 58 69
    % 59 69
    % 60 69
    % 61 69
    % 62 69
    % 63 69
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    nargs = numel(args);
    error(nargchk(1.0, 3.0, nargs));
    % 70 73
    % 71 73
    rflArgs = args(1.0);
    uiArgs = args(1.0);
    if gt(nargs, 1.0)
        % 75 78
        % 76 78
        if isnumeric(args{2.0})
            uiArgs(2.0) = args(2.0);
            if gt(nargs, 2.0)
                error('uimgr:WidgetFcnNotAllowed', 'Cannot pass in FCN to UIRECENTITEMSLIST');
                % 81 83
            end % if
        else
            rflArgs(2.0) = args(2.0);
            if not(ischar(args{2.0}))
                error('uimgr:PrefsMustBeString', 'PREFS must be a string');
            end % if
            if gt(nargs, 2.0)
                % 89 91
                uiArgs(2.0) = args(3.0);
            end % if
        end % if
    end % if

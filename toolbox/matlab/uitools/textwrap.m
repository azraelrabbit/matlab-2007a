function [OutString, varargout] = textwrap(varargin)
    % 1 46
    % 2 46
    % 3 46
    % 4 46
    % 5 46
    % 6 46
    % 7 46
    % 8 46
    % 9 46
    % 10 46
    % 11 46
    % 12 46
    % 13 46
    % 14 46
    % 15 46
    % 16 46
    % 17 46
    % 18 46
    % 19 46
    % 20 46
    % 21 46
    % 22 46
    % 23 46
    % 24 46
    % 25 46
    % 26 46
    % 27 46
    % 28 46
    % 29 46
    % 30 46
    % 31 46
    % 32 46
    % 33 46
    % 34 46
    % 35 46
    % 36 46
    % 37 46
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    if lt(nargout, 1.0) || gt(nargout, 2.0)
        error('MATLAB:textwrap:InvalidNumberOuputs', 'TEXTWRAP requires 1 or 2 output arguments.');
    end % if
    error(nargchk(2.0, 3.0, nargin));
    if eq(nargin, 3.0)
        UIHandle = varargin{1.0};
        if iscell(varargin{2.0})
            InString = varargin{2.0};
        else
            error('MATLAB:textwrap:InvalidSecondInput', 'Second input argument must be a cell array when using 3 inputs');
        end % if
        % 56 58
        Columns = varargin{3.0};
    else
        % 59 61
        if isnumeric(varargin{1.0})
            UIHandle = varargin{1.0};
            InString = varargin{2.0};
            Columns = [];
        else
            if iscell(varargin{1.0})
                UIHandle = [];
                InString = varargin{1.0};
                Columns = varargin{2.0};
            else
                error('MATLAB:textwrap:InvalidFirstInput', 'First input argument must be a handle or cell array.');
            end % if
        end % if
        % 73 75
    end % if
    if not(isempty(UIHandle))
        if not(ishandle(UIHandle))
            error('MATLAB:textwrap:InvalidHandle', 'Invalid handle passed to TEXTWRAP.');
        end % if
        UIPosition = get(UIHandle, 'Position');
        UIWidth = UIPosition(3.0);
        % 81 83
        TempObj = copyobj(UIHandle, get(UIHandle, 'Parent'));
        set(TempObj, 'Visible', 'off', 'Max', 100.0);
    end % if
    % 85 87
    NumPara = numel(InString);
    OutString = {};
    ReturnChar = sprintf('\n');
    % 89 91
    for lp=1.0:NumPara
        Para = InString{lp};
        % 92 94
        if isempty(Para)
            NumNewLines = 0.0;
            OutString = vertcat(OutString, {' '});
        else
            % 97 99
            Loc = find(eq(Para, ReturnChar));
            TempPara = {};
            if not(isempty(Loc))
                Loc = horzcat(0.0, Loc, plus(length(Para), 1.0));
                for lp=minus(length(Loc), 1.0):-1.0:1.0
                    TempPara{lp, 1.0} = Para(plus(Loc(lp), 1.0):minus(Loc(plus(lp, 1.0)), 1.0));
                end % for
            else
                TempPara = Para;
            end % if
            Para = cellstr(TempPara);
            % 109 111
            NumNewLines = size(Para, 1.0);
            % 111 113
        end % if
        % 113 115
        for LnLp=1.0:NumNewLines
            if not(isempty(Columns))
                WrappedCell = LocalWrapAtColumn(Para{LnLp, 1.0}, Columns);
            else
                WrappedCell = LocalWrapAtWidth(Para{LnLp, 1.0}, TempObj, UIWidth);
            end % if
            OutString = vertcat(OutString, WrappedCell);
        end % for
    end % for
    % 123 125
    if not(isempty(UIHandle))
        set(TempObj, 'String', OutString);
        Extent = get(TempObj, 'Extent');
        Position = horzcat(UIPosition(1.0:2.0), Extent(3.0:4.0));
        delete(TempObj);
    else
        % 130 132
        Position = [0.0 0.0 0.0 0.0];
    end % if
    % 133 135
    if eq(nargout, 2.0)
        varargout{1.0} = Position;
    end % if
end % function
function WrapLoc = LocalGetWrapLoc(Para, Columns)
    % 139 142
    % 140 142
    Width = size(Para, 2.0);
    if isequal(Width, 0.0) || isempty(Columns)
        WrapLoc = [];
    else
        Para = horzcat(Para, ' ');
        Locs = find(eq(Para, ' '));
        WrapLoc = Locs(find(le(Locs, Columns)));
        % 148 150
        if isempty(WrapLoc)
            WrapLoc = Columns;
        end % if
    end % if
end % function
function WrappedCell = LocalWrapAtColumn(Para, Columns)
    % 155 160
    % 156 160
    % 157 160
    % 158 160
    WrappedCell = {''};
    LineNo = 1.0;
    WrapLoc = LocalGetWrapLoc(Para, Columns);
        while not(isempty(WrapLoc))
        LocHigh = WrapLoc(end);
        if gt(LocHigh, length(Para))
            LocHigh = length(Para);
        end % if
        WrappedCell{LineNo, 1.0} = Para(1.0:LocHigh);
        Para(1.0:LocHigh) = [];
        Para = fliplr(deblank(fliplr(Para)));
        WrapLoc = LocalGetWrapLoc(Para, Columns);
        LineNo = plus(LineNo, 1.0);
    end % while
end % function
function WrappedCell = LocalWrapAtWidth(Para, TempObjHandle, UIWidth)
    % 175 181
    % 176 181
    % 177 181
    % 178 181
    % 179 181
    Para = horzcat(Para, ' ');
    SpaceLocs = find(eq(Para, ' '));
    WrappedCell = {};
    % 183 185
    if not(isempty(SpaceLocs))
        EndOfPara = false;
        NeedToWrapLine = false;
        LocLowIndex = 0.0;
        LocHighIndex = 1.0;
        LocLow = 1.0;
        LocHigh = minus(SpaceLocs(LocHighIndex), 1.0);
            while not(EndOfPara)
                while not(NeedToWrapLine)
                TrialString = Para(LocLow:LocHigh);
                set(TempObjHandle, 'String', TrialString);
                TempExtent = get(TempObjHandle, 'Extent');
                NeedToWrapLine = ge(TempExtent(3.0), UIWidth);
                if not(NeedToWrapLine)
                    if eq(LocHighIndex, length(SpaceLocs))
                        NeedToWrapLine = true;
                    else
                        LocHighIndex = plus(LocHighIndex, 1.0);
                        LocHigh = minus(SpaceLocs(LocHighIndex), 1.0);
                    end % if
                else
                    if gt(minus(LocHighIndex, LocLowIndex), 1.0)
                        LocHighIndex = minus(LocHighIndex, 1.0);
                        LocHigh = minus(SpaceLocs(LocHighIndex), 1.0);
                    end % if
                end % if
            end % while
            WrappedCell = vertcat(WrappedCell, cellhorzcat(Para(LocLow:LocHigh)));
            LocLowIndex = LocHighIndex;
            LocHighIndex = plus(LocHighIndex, 1.0);
            % 214 216
            LocLow = plus(SpaceLocs(LocLowIndex), 1.0);
            if le(LocHighIndex, length(SpaceLocs))
                LocHigh = minus(SpaceLocs(LocHighIndex), 1.0);
                NeedToWrapLine = false;
            else
                EndOfPara = true;
            end % if
        end % while
    else
        % 224 226
        WrappedCell = cellhorzcat(Para);
        % 226 228
    end % if
end % function

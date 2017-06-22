function limit = cvmaxreportsignalrange(varargin)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    persistent modelSignals;
    persistent vectorSize;
    persistent lineCntLimit;
    % 28 30
    if isempty(modelSignals)
        modelSignals = 1000.0;
    end
    % 32 34
    if isempty(vectorSize)
        vectorSize = 1000.0;
    end
    % 36 38
    if isempty(lineCntLimit)
        lineCntLimit = 10000.0;
    end
    % 40 44
    % 41 44
    % 42 44
    if gt(nargin, 0.0)
        switch varargin{1.0}
        case 'get'
            switch varargin{2.0}
            case 'modelSignals'
                limit = modelSignals;
            case 'vectorSize'
                limit = vectorSize;
            case 'lineCntLimit'
                limit = lineCntLimit;
            end
        case 'set'
            switch varargin{2.0}
            case 'modelSignals'
                modelSignals = varargin{3.0};
                limit = modelSignals;
            case 'vectorSize'
                vectorSize = varargin{3.0};
                limit = vectorSize;
            case 'lineCntLimit'
                lineCntLimit = varargin{3.0};
                limit = lineCntLimit;
            end
            % 66 68
        end
    end
end

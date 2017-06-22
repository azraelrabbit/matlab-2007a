function varargout = cusattic(method, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    mlock
    persistent USERDATA;
    % 12 14
    [USERDATA, varargout{1.0:nargout}] = feval(method, USERDATA, varargin{1.0:end});
end
function userdata = clean(userdata)
    % 16 20
    % 17 20
    % 18 20
    clear userdata;
    userdata = '';
end
function [StateVar, returnVal] = AtticData(StateVar, varargin)
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    returnVal = [];
    switch nargin
    case 2.0
        if isempty(varargin{1.0})
            % 37 39
            returnVal = StateVar;
        else
            if isfield(StateVar, varargin{1.0})
                returnVal = eval(horzcat('StateVar.', varargin{1.0}));
            end
        end
    case 3.0
        if ischar(varargin{1.0})
            eval(horzcat('StateVar.', varargin{1.0}, ' =  varargin{2};'));
        end
    end
    return
end

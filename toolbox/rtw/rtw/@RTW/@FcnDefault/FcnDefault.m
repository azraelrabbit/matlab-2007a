function h = FcnDefault(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = RTW.FcnDefault;
    % 9 10
    if eq(nargin, 2.0)
        if isempty(varargin{1.0})
            h.Name = 'Auto';
        else
            h.Name = varargin{1.0};
        end % if
        % 16 17
        h.ModelHandle = varargin{2.0};
    end % if
    % 19 20
    h.FunctionName = horzcat(get_param(h.ModelHandle, 'Name'), '_step');
    h.PreConfigFlag = false;
    h.Description = DAStudio.message('RTW:fcnClass:fcnAutoMessage');
    h.Multirate = false;
end % function

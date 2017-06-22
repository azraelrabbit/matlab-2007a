function h = ModelSpecificCPrototype(varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    h = RTW.ModelSpecificCPrototype;
    % 13 14
    if eq(nargin, 2.0)
        if isempty(varargin{1.0})
            h.Name = 'ModelspecificCprototype';
        else
            h.Name = varargin{1.0};
        end % if
        % 20 21
        h.ModelHandle = varargin{2.0};
    end % if
    % 23 24
    h.selRow = 0.0;
    h.PreConfigFlag = false;
    h.Description = DAStudio.message('RTW:fcnClass:modelspecificdescription');
end % function

function success = setInputParameters(this, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    success = false;
    % 11 13
    if eq(nargin, 2.0)
        if gt(this.ActiveCheckID, 0.0) && strcmp(this.stage, 'ExecuteCheckCallback')
            this.CheckCellArray{this.ActiveCheckID}.InputParameters = varargin{1.0};
            success = true;
        end % if
    else
        if eq(nargin, 3.0)
            for i=1.0:length(this.CheckCellArray)
                if strcmp(this.CheckCellArray{i}.TitleID, varargin{1.0})
                    this.CheckCellArray{i}.InputParameters = varargin{2.0};
                    success = true;
                    break
                end % if
            end % for
        else
            error('Incorrect usage of setInputParameters method.');
        end % if
    end % if
end % function

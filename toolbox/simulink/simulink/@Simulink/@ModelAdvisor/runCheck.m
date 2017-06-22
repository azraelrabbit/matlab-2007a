function success = runCheck(this, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    success = false;
    % 12 13
    this.StartInTaskPage = false;
    % 14 15
    if gt(nargin, 1.0)
        checkList = varargin{1.0};
        if gt(nargin, 2.0)
            overwriteHTML = varargin{2.0};
        else
            overwriteHTML = true;
        end % if
        if gt(nargin, 3.0)
            fromTaskAdvisorNode = varargin{3.0};
        else
            fromTaskAdvisorNode = '';
        end % if
        this.createDiagnoseStartPage(true, '', checkList, overwriteHTML, fromTaskAdvisorNode);
    else
        this.createDiagnoseStartPage(true);
    end % if
    % 31 32
    success = true;
end % function

function warning_state = pmiu_warning(varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    persistent PMIU_WARNING_STATE;
    persistent PMIU_WARNING_ID_PREFIX;
    if isempty(PMIU_WARNING_STATE)
        PMIU_WARNING_STATE = false;
        PMIU_WARNING_ID_PREFIX = 'physmod:import:';
    end
    % 22 24
    if eq(nargin, 1.0)
        if islogical(varargin{1.0})
            PMIU_WARNING_STATE = varargin{1.0};
        end
    else
        if PMIU_WARNING_STATE
            if eq(nargin, 2.0)
                % 30 32
                warning(varargin{:});
                error('physmod:import:internal:WarningCallWithoutMMI', 'internal: call to pmiu_warning missing MMI');
            else
                % 34 36
                if ischar(varargin{1.0})
                    warning(horzcat(PMIU_WARNING_ID_PREFIX, varargin{1.0}), varargin{2.0:end});
                else
                    error('physmod:import:internal:WarningCallHasNonCharMMI', 'internal: call to pmiu_warning has a non-char MMI');
                    % 39 41
                end
            end
        end
    end
    % 44 46
    warning_state = PMIU_WARNING_STATE;
end

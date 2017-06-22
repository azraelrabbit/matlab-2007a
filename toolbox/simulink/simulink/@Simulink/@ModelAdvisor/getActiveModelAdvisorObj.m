function activeObj = getActiveModelAdvisorObj(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    persistent mdladvObj;
    % 7 9
    if eq(nargin, 0.0)
        if not(isa(mdladvObj, 'Simulink.ModelAdvisor'))
            activeObj = '';
        else
            activeObj = mdladvObj;
        end
    else
        mdladvObj = varargin{1.0};
        activeObj = mdladvObj;
    end
end

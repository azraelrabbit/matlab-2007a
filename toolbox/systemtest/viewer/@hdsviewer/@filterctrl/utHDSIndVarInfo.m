function [valueStr, groupedStr] = utHDSIndVarInfo(h, varName, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    thisvar = h.getinddata(varName);
    if le(nargin, 2.0)
        singleGridSample = h.getinstance;
    else
        singleGridSample = varargin{1.0};
    end
    singleSample = singleGridSample.(varName);
    if any(strcmpi(varName, h.GroupedVariables))
        groupedStr = 'Yes';
    else
        groupedStr = 'No';
    end
    % 21 24
    % 22 24
    if iscell(thisvar)
        if le(length(thisvar), 3.0) && isnumeric(singleSample) && isscalar(singleSample)
            valueStr = sprintf('{%0.3g', thisvar{1.0});
            for k=2.0:length(thisvar)
                valueStr = horzcat(valueStr, sprintf(',%0.3g', thisvar{k}));
            end % for
            valueStr = horzcat(valueStr, '}');
        else
            if le(length(thisvar), 3.0) && ischar(singleSample)
                valueStr = sprintf('{%s', thisvar{1.0});
                for k=2.0:length(thisvar)
                    valueStr = horzcat(valueStr, sprintf(',%s', thisvar{k}));
                end % for
                valueStr = horzcat(valueStr, '}');
            else
                valueStr = sprintf('{%dx1 %s}', length(thisvar), class(singleSample));
            end
        end
    else
        if le(length(thisvar), 3.0) && isnumeric(singleSample) && isscalar(singleSample)
            valueStr = sprintf('[%0.3g', thisvar(1.0));
            for k=2.0:length(thisvar)
                valueStr = horzcat(valueStr, sprintf(',%0.3g', thisvar(k)));
            end % for
            valueStr = horzcat(valueStr, ']');
        else
            valueStr = sprintf('<%dx1 %s>', length(thisvar), class(singleSample));
        end
    end
end

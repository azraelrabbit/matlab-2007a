function [indepCell, depCell, outStruc] = getsample(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    indepCell = {};
    depCell = {};
    outStruc = struct;
    if gt(this.selectedgridpoint, 0.0)
        thisgridpt = this.selectedgridpoint;
    else
        if ge(nargin, 2.0) && gt(varargin{1.0}, 0.0)
            thisgridpt = varargin{1.0};
        else
            return
        end
    end
    gridVars = fieldnames(this.DataSet.testvector);
    dependentVars = fieldnames(this.DataSet.variable);
    % 21 24
    % 22 24
    indepCell = cell(length(gridVars), 2.0);
    for i=1.0:length(gridVars)
        alldata = this.gethdsdata(gridVars{i});
        independent_data = alldata(thisgridpt);
        indepCell(i, :) = cellhorzcat(gridVars{i}, localhdsdisp(independent_data));
        outStruc.(gridVars{i}) = independent_data;
    end % for
    % 30 32
    depCell = cell(length(dependentVars), 2.0);
    depSample = this.gethdssample(thisgridpt);
    for i=1.0:length(dependentVars)
        dependent_data = depSample.(dependentVars{i});
        depCell(i, :) = cellhorzcat(dependentVars{i}, localhdsdisp(dependent_data));
        outStruc.(dependentVars{i}) = dependent_data;
    end % for
end
function outStr = localhdsdisp(indata)
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    if isnumeric(indata)
        if isscalar(indata)
            outStr = sprintf('%0.3g', indata);
            return
        else
            outStr = sprintf('<%s %s>', localsizestr(size(indata)), class(indata));
        end
    else
        if iscell(indata)
            if gt(numel(indata), 0.0)
                className = unique(cellfun(@(x){class(x)}, indata));
                if gt(length(className), 1.0)
                    className = {'mixed classes'};
                end
                outStr = sprintf('{%s %s}', localsizestr(size(indata)), className{1.0});
            else
                outStr = 'empty';
            end
        else
            if islogical(indata)
                if isscalar(indata)
                    if indata
                        outStr = 'true';
                    else
                        outStr = 'false';
                    end
                else
                    outStr = sprintf('<%s %s>', localsizestr(size(indata)), class(indata));
                end
            else
                outStr = sprintf('<%s %s>', localsizestr(size(indata)), class(indata));
            end
        end
    end
end
function a = localsizestr(s)
    if lt(length(s), 4.0)
        a = sprintf('%d', s(1.0));
        for k=2.0:length(s)
            a = horzcat(a, sprintf('x%d', s(k)));
        end % for
    else
        a = sprintf('%d-D', length(s));
    end
end

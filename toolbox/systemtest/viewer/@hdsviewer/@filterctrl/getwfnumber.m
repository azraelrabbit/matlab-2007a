function [str, sizes] = getwfnumber(this)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    depVars = fieldnames(this.DataSet.variable);
    gridSize = this.getGridSize;
    len = numel(gridSize);
    numrealgriddims = zeros(1.0, len);
    % 17 20
    % 18 20
    for i=1.0:len
        for j=1.0:gridSize(i)
            index = repmat({':'}, horzcat(1.0, len));
            index{i} = j;
            data = this.filteredindex(index{:});
            if any(data(:))
                numrealgriddims(i) = plus(numrealgriddims(i), 1.0);
            end
        end % for
    end % for
    % 29 32
    % 30 32
    if gt(sum(eq(numrealgriddims, 0.0)), 0.0)
        noneselected = true;
    else
        noneselected = false;
    end
    % 36 39
    % 37 39
    overall = prod(numrealgriddims);
    % 39 42
    % 40 42
    ct = 1.0;
    for i=1.0:length(depVars)
        varClass = this.getVarClass(depVars{i});
        if noneselected
            if any(strcmp(varClass, {'timeseries','tsdata.timeseries','Simulink.Timeseries'}))
                % 46 48
                sizes(ct, 1.0) = 0.0;
                sizes(ct, 2.0) = 0.0;
                str(ct, :) = horzcat(cellhorzcat('*Time*', depVars{i}), {'0','0'});
                ct = plus(ct, 1.0);
            else
                if any(strcmp(varClass, {'double','int8','uint8','logical','int16','uint16','int32','uint32','single','int64','uint64'}))
                    sizes(ct, 1.0) = 0.0;
                    str(ct, :) = horzcat(cellhorzcat('*Auto*', depVars{i}), {'0',''});
                    ct = plus(ct, 1.0);
                end
            end
        else
            if any(strcmp(varClass, {'timeseries','tsdata.timeseries','Simulink.Timeseries'}))
                thisvar = this.gethdsdata(depVars{i});
                sizes(ct, 1.0) = overall;
                sizes(ct, 2.0) = sum(cellfun(@(x)length(x), thisvar(this.filteredindex)));
                str(ct, :) = cellhorzcat('Time', depVars{i}, num2str(overall), num2str(sizes(ct, 2.0)));
                ct = plus(ct, 1.0);
            else
                if any(strcmp(varClass, {'double','int8','uint8','logical','int16','uint16','int32','uint32','single','int64','uint64'}))
                    sizes(ct, 1.0) = overall;
                    thisvar = this.gethdsdata(depVars{i});
                    sizes(ct, 1.0) = overall;
                    if iscell(thisvar)
                        sizes(ct, 2.0) = sum(cellfun('prodofsize', thisvar(this.filteredindex)));
                    else
                        sizes(ct, 2.0) = numel(thisvar(this.filteredindex));
                    end
                    str(ct, :) = horzcat(cellhorzcat('*Auto*', depVars{i}, num2str(overall), num2str(sizes(ct, 2.0))), '');
                    ct = plus(ct, 1.0);
                end
            end
        end
    end % for
end

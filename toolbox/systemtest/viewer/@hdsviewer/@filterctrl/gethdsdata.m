function data = gethdsdata(h, varname)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if any(strcmp(fieldnames(h.DataSet.variable), varname))
        data = h.DataSet.variable.(varname);
    else
        if any(strcmp(fieldnames(h.DataSet.testvector), varname))
            data = localDilate(h, h.DataSet.testvector, varname);
        else
            error('Result or test vector not found')
        end
    end
end
function outarray = localDilate(h, testvecstruct, varname)
    % 18 20
    gridSize = h.getGridSize;
    if isscalar(gridSize)
        outarray = testvecstruct.(varname);
        outarray = outarray(:);
    else
        % 24 26
        if eq(length(gridSize), 2.0) && eq(min(gridSize), 1.0)
            outarray = testvecstruct.(varname);
            if isscalar(outarray)
                if ischar(outarray)
                    outarray = repmat(cellhorzcat(outarray), horzcat(max(gridSize), 1.0));
                else
                    outarray = repmat(outarray, horzcat(max(gridSize), 1.0));
                end
            else
                outarray = outarray(:);
            end
        else
            % 37 39
            % 38 42
            % 39 42
            % 40 42
            idvars = fieldnames(testvecstruct);
            if any(strcmp(h.GroupedVariables, varname))
                ind = length(gridSize);
            else
                ind = find(strcmp(idvars, varname));
            end
            % 47 51
            % 48 51
            % 49 51
            repeatdims = gridSize;
            repeatdims(ind) = [];
            % 52 55
            % 53 55
            if eq(length(testvecstruct.(varname)), size(testvecstruct.(varname), 1.0))
                x = repmat(testvecstruct.(varname), horzcat(1.0, repeatdims));
            else
                x = repmat(ctranspose(testvecstruct.(varname)), horzcat(1.0, repeatdims));
            end
            if gt(ind, 1.0) && lt(ind, length(gridSize))
                dimord = horzcat(2.0:ind, 1.0, plus(ind, 1.0):length(gridSize));
                outarray = permute(x, dimord);
            else
                if eq(ind, length(gridSize))
                    dimord = horzcat(2.0:length(gridSize), 1.0);
                    outarray = permute(x, dimord);
                else
                    outarray = x;
                end
            end
        end
    end
end

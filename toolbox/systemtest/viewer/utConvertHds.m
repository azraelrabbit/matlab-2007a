function outstruct = utConvertHds(h)
    % 1 5
    % 2 5
    % 3 5
    outstruct = struct;
    gridvarstruct = h.getgrid;
    gridvars = [];
    for k=1.0:length(gridvarstruct)
        % 8 10
        gridvardata = h.getGridPoints(gridvarstruct(k).Variable.Name);
        outstruct.testvector.(gridvarstruct(k).Variable.Name) = ctranspose(gridvardata(:));
        gridvars = vertcat(gridvars, horzcat(gridvarstruct(k).Variable));
    end % for
    % 13 15
    ordvars = setdiff(h.getvars, gridvars);
    for k=1.0:length(ordvars)
        outstruct.variable.(ordvars(k).Name) = get(h, ordvars(k).Name);
    end % for
end

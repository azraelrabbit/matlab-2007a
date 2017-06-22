function draw(this, Data)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    Ns = numel(this.Patches);
    % 9 12
    % 10 12
    xdata = Data.XData;
    ydata = Data.YData;
    zdata = Data.ZData;
    gridids = Data.GridIds;
    hpatches = double(this.Patches);
    % 16 18
    if Data.Exception
        % 18 20
        set(double(ghandles(this)), 'XData', [], 'YData', [], 'ZData', [])
    else
        % 21 23
        x1 = zdata(not(cellfun('isempty', zdata)));
        x1 = x1(:);
        floorvec = cellfun(@(x)min(x(:)), x1);
        floorlevel = min(floorvec(:));
        for ct=1.0:Ns
            % 27 29
            maxelements = ceil(mrdivide(1000.0, Ns));
            if not(isempty(zdata{ct}))
                zvals = zdata{ct};
                xvals = xdata{ct};
                if gt(numel(zdata{ct}), maxelements)
                    xvals1 = ctranspose(linspace(xvals(1.0), xvals(end), maxelements));
                    s = warning('off', 'MATLAB:interp1:NaNinY');
                    zvals = interp1(xvals, zvals, xvals1);
                    warning(s);
                    xvals = xvals1;
                end % if
                x1 = repmat(ctranspose(xvals(:)), horzcat(size(zvals, 2.0), 1.0));
                xvals = vertcat(xvals(1.0), x1(:), xvals(end), xvals(end), xvals(end));
                zvals = vertcat(floorlevel, zvals(:), min(zvals(end, :)), floorlevel, floorlevel);
                % 42 44
                cvals = zvals;
                cvals(end, :) = NaN;
                set(hpatches(ct), 'Cdata', cvals(:), 'XData', xvals(:), 'YData', mtimes(ydata(ct), ones(numel(xvals), 1.0)), 'ZData', zvals(:), 'UserData', gridids(ct));
            else
                % 47 49
                set(hpatches(ct), 'Cdata', [], 'XData', [], 'YData', [], 'ZData', [], 'UserData', gridids(ct));
                % 49 51
            end % if
        end % for
    end % if

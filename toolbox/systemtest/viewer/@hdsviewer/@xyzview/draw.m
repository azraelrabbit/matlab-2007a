function draw(this, Data)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    Ns = length(this.Surface);
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    edgeHandles = double(this.EnvelopeEdges);
    surfaces = setdiff(double(ghandles(this)), edgeHandles);
    % 18 20
    if Data.Exception
        % 20 22
        set(surfaces, 'XData', [], 'YData', [], 'ZData', [], 'CData', [])
    else
        xdata = Data.XData;
        ydata = Data.YData;
        zdata = Data.ZData;
        gridids = Data.GridIds;
        s = size(zdata);
        % 28 30
        if strcmp(this.Envelope, 'off')
            for ct=1.0:Ns
                if strcmp(this.Style, 'surf')
                    set(surfaces(ct), 'XData', xdata, 'YData', ydata, 'ZData', ctranspose(zdata(:, :, ct)), 'CData', ctranspose(zdata(:, :, ct)), 'UserData', ctranspose(gridids(:, :, ct)), 'FaceColor', 'flat', 'EdgeColor', [0.0 0.0 0.0], 'EdgeLighting', 'none');
                else
                    % 34 38
                    % 35 38
                    % 36 38
                    % 37 39
                    set(surfaces(ct), 'XData', xdata, 'YData', ydata, 'ZData', ctranspose(zdata(:, :, ct)), 'Cdata', ctranspose(zdata(:, :, ct)), 'UserData', ctranspose(gridids(:, :, ct)), 'EdgeColor', 'Flat', 'FaceColor', [1.0 1.0 1.0], 'EdgeLighting', 'flat');
                    % 39 45
                    % 40 45
                    % 41 45
                    % 42 45
                    % 43 45
                end % if
            end % for
        else
            for row=1.0:this.AxesGrid.size(1.0)
                for col=1.0:this.AxesGrid.size(2.0)
                    ct = plus(mtimes(minus(row, 1.0), this.AxesGrid.size(2.0)), col);
                    % 50 52
                    if eq(this.AxesGrid.size(1.0), 1.0) && eq(this.AxesGrid.size(2.0), 1.0)
                        zdataMin = ctranspose(min(zdata(:, :, :), [], 3.0));
                        zdataMax = ctranspose(max(zdata(:, :, :), [], 3.0));
                    else
                        if gt(this.AxesGrid.size(1.0), 1.0) && eq(this.AxesGrid.size(2.0), 1.0)
                            zdataMin = ctranspose(min(zdata(:, :, row, :), [], 4.0));
                            zdataMax = ctranspose(max(zdata(:, :, row, :), [], 4.0));
                        else
                            if eq(this.AxesGrid.size(1.0), 1.0) && gt(this.AxesGrid.size(2.0), 1.0)
                                zdataMin = ctranspose(min(min(zdata(:, :, col, :, :), [], 5.0), [], 3.0));
                                zdataMax = ctranspose(max(max(zdata(:, :, col, :, :), [], 5.0), [], 3.0));
                            else
                                zdataMin = ctranspose(min(zdata(:, :, row, col, :), [], 5.0));
                                zdataMax = ctranspose(max(zdata(:, :, row, col, :), [], 5.0));
                            end % if
                        end % if
                    end % if
                    set(surfaces(minus(mtimes(2.0, ct), 1.0)), 'XData', xdata, 'YData', ydata, 'ZData', zdataMin, 'CData', ones(size(zdataMin)), 'FaceColor', 'flat');
                    set(surfaces(mtimes(2.0, ct)), 'XData', xdata, 'YData', ydata, 'ZData', zdataMax, 'CData', ones(size(zdataMax)), 'FaceColor', 'flat');
                    set(edgeHandles(minus(mtimes(4.0, ct), 3.0)), 'XData', vertcat(xdata(:), xdata(end:-1.0:1.0)), 'YData', mtimes(ydata(1.0), ones(mtimes(length(xdata), 2.0), 1.0)), 'ZData', vertcat(ctranspose(zdataMin(1.0, :)), ctranspose(zdataMax(1.0, end:-1.0:1.0))));
                    % 71 73
                    set(edgeHandles(minus(mtimes(4.0, ct), 2.0)), 'XData', vertcat(xdata(:), xdata(end:-1.0:1.0)), 'YData', mtimes(ydata(end), ones(mtimes(length(xdata), 2.0), 1.0)), 'ZData', vertcat(ctranspose(zdataMin(end, :)), ctranspose(zdataMax(end, end:-1.0:1.0))));
                    % 73 75
                    set(edgeHandles(minus(mtimes(4.0, ct), 1.0)), 'XData', mtimes(xdata(1.0), ones(mtimes(length(ydata), 2.0), 1.0)), 'YData', vertcat(ydata(:), ydata(end:-1.0:1.0)), 'ZData', vertcat(zdataMin(:, 1.0), zdataMax(end:-1.0:1.0, 1.0)));
                    % 75 77
                    set(edgeHandles(mtimes(4.0, ct)), 'XData', mtimes(xdata(end), ones(mtimes(length(ydata), 2.0), 1.0)), 'YData', vertcat(ydata(:), ydata(end:-1.0:1.0)), 'ZData', vertcat(zdataMin(:, end), zdataMax(end:-1.0:1.0, end)));
                    % 77 79
                end % for
            end % for
        end % if
    end % if
end % function

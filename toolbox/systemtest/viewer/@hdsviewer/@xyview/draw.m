function draw(this, Data)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    Ns = length(this.Lines);
    % 9 12
    % 10 12
    xdata = Data.XData;
    ydata = Data.YData;
    gridids = Data.GridIds;
    hlines = double(this.Lines);
    % 15 17
    if Data.Exception
        % 17 19
        set(double(ghandles(this)), 'XData', [], 'YData', [])
    else
        if strcmp(this.Envelope, 'on')
            % 21 23
            for col=1.0:this.AxesGrid.size(2.0)
                for row=1.0:this.AxesGrid.size(1.0)
                    if gt(size(xdata, 2.0), 1.0)
                        xdata_ = vertcat(xdata(1.0:end, 1.0), xdata(end:-1.0:1.0, 1.0), xdata(1.0, 1.0));
                    else
                        xdata_ = vertcat(xdata(1.0:end), xdata(end:-1.0:1.0), xdata(1.0, 1.0));
                    end % if
                    if eq(this.AxesGrid.size(2.0), 1.0) && eq(this.AxesGrid.size(1.0), 1.0)
                        ydata_ = vertcat(min(ydata(:, :), [], 2.0), max(ydata(end:-1.0:1.0, :), [], 2.0));
                    else
                        if gt(this.AxesGrid.size(1.0), 1.0) && eq(this.AxesGrid.size(2.0), 1.0)
                            ydata_ = vertcat(min(ydata(:, row, :), [], 3.0), max(ydata(end:-1.0:1.0, row, :), [], 3.0));
                        else
                            if eq(this.AxesGrid.size(1.0), 1.0) && gt(this.AxesGrid.size(2.0), 1.0)
                                ydata_ = vertcat(min(min(ydata(:, :, col, :), [], 4.0), [], 2.0), max(max(ydata(end:-1.0:1.0, :, col, :), [], 4.0), [], 2.0));
                            else
                                ydata_ = vertcat(min(ydata(:, row, col, :), [], 4.0), max(ydata(end:-1.0:1.0, row, col, :), [], 4.0));
                            end % if
                        end % if
                    end % if
                    ydata_ = vertcat(ydata_(:), ydata_(1.0));
                    set(hlines(plus(mtimes(minus(row, 1.0), this.AxesGrid.size(2.0)), col)), 'XData', xdata_, 'YData', ydata_, 'UserData', []);
                end % for
            end % for
        else
            switch this.Style
            case 'line'
                for ct=1.0:Ns
                    if gt(size(xdata, 2.0), 1.0)
                        set(hlines(ct), 'XData', xdata(:, ct), 'YData', ydata(:, ct), 'UserData', gridids(:, ct));
                    else
                        set(hlines(ct), 'XData', xdata, 'YData', ydata(:, ct), 'UserData', gridids(:, ct));
                        % 54 56
                    end % if
                end % for
            case 'stairs'
                for ct=1.0:Ns
                    if gt(size(xdata, 2.0), 1.0)
                        [XX, YY] = stairs(xdata(:, ct), ydata(:, ct));
                    else
                        [XX, YY] = stairs(xdata, ydata(:, ct));
                    end % if
                    stairGridIds = vertcat(ctranspose(gridids(:, ct)), ctranspose(gridids(:, ct)));
                    stairGridIds = stairGridIds(:);
                    stairGridIds = stairGridIds(2.0:end);
                    set(hlines(ct), 'XData', XX, 'YData', YY, 'UserData', stairGridIds);
                end % for
            end % switch
        end % if
    end % if
end % function

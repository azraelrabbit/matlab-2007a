function draw(this, Data)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    Ns = length(this.Lines);
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    xdata = Data.XData;
    ydata = Data.YData;
    gridids = Data.GridIds;
    hlines = double(this.Lines);
    % 20 21
    if Data.Exception
        % 22 23
        set(double(ghandles(this)), 'XData', [], 'YData', [])
    else
        % 25 26
        switch this.Style
        case 'line'
            for ct=1.0:Ns
                % 29 30
                s = size(ydata{ct});
                thisydata = cat(1.0, ydata{ct}, mtimes(NaN, ones(horzcat(1.0, s(2.0:end)))));
                s = size(thisydata);
                thisxdata = repmat(vertcat(horzcat(xdata{ct}), NaN), horzcat(1.0, s(2.0:end)));
                set(hlines(ct), 'XData', thisxdata(:), 'YData', thisydata(:), 'UserData', gridids(ct));
                % 35 36
            end % for
        case 'stairs'
            for ct=1.0:Ns
                [XX, YY] = stairs(xdata{ct}, ydata{ct});
                set(hlines(ct), 'XData', XX, 'YData', YY, 'UserData', gridids(ct));
                % 41 42
            end % for
        case 'area'
            % 44 50
            % 45 50
            % 46 50
            % 47 50
            % 48 50
            % 49 50
        end % switch
    end % if
end % function

function draw(this, Data)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    Ns = length(this.Scatters);
    % 10 12
    % 11 12
    xdata = Data.XData;
    ydata = Data.YData;
    gridids = Data.GridIds;
    hScatters = double(this.Scatters);
    % 16 17
    if Data.Exception
        % 18 19
        set(double(ghandles(this)), 'XData', [], 'YData', [])
    else
        for ct=1.0:Ns
            % 22 24
            % 23 24
            if isvector(xdata) && eq(size(ydata, 1.0), length(xdata))
                set(hScatters(ct), 'XData', xdata, 'YData', ydata(:, ct), 'UserData', gridids(:, ct));
            else
                % 27 28
                set(hScatters(ct), 'XData', xdata(:, ct), 'YData', ydata(:, ct), 'UserData', gridids(:, ct));
            end % if
        end % for
    end % if
end % function

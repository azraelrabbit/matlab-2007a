function update(h, t)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if isempty(h.Geometry.FaceVertexColorData) && isempty(h.Geometry.Name)
        error('Aero:Body:updateGeometry', 'Geometry has not been read.');
    end % if
    % 15 16
    if isempty(h.TimeseriesSource)
        error('Aero:Body:NeedTimeData', 'Set a TimeseriesSource before attempting to update the animation');
        % 18 19
    end % if
    % 20 21
    if isempty(which(func2str(h.TimeseriesReadFcn)))
        error('Aero:Body:NoReadFcn', 'TimeseriesReadFcn is not on the path.');
    end % if
    % 24 26
    % 25 26
    consistencyCheck(h);
    % 27 28
    [trans, rot] = h.TimeSeriesReadFcn(t, h);
    h.move(trans, rot);
    % 30 31
end % function
function consistencyCheck(h)
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    sourceType = set(h, 'TimeseriesSourceType');
    readType = {'interpTimeseries','interp6DoFArrayWithTime','interp3DoFArrayWithTime','interpStructWithTime'};
    % 39 40
    sourceDType = {'timeseries','double','double','struct'};
    % 41 42
    if any(strcmpi(h.TimeseriesSourceType, cellhorzcat(sourceType{1.0:4.0})))
        % 43 44
        if not(strcmpi(class(h.TimeseriesSource), sourceDType{strmatch(h.TimeseriesSourceType, cellhorzcat(sourceType{1.0:4.0}), 'exact')}))
            % 45 46
            error('Aero:Body:SourceDType', 'TimeseriesSource needs to be updated to work with TimeseriesSourceType');
            % 47 48
        end % if
        if not(strcmpi(func2str(h.TimeseriesReadFcn), readType{strmatch(h.TimeseriesSourceType, cellhorzcat(sourceType{1.0:4.0}), 'exact')}))
            % 50 51
            error('Aero:Body:ReadFcn', 'TimeseriesReadFcn needs to be updated to work with TimeseriesSourceType');
            % 52 53
        end % if
    end % if
    % 55 56
end % function

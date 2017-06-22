function propout = utManageDataStorage(tsin, eventdata, varname, writeflag, varargin)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    var = hds.variable(varname);
    idx = find(eq(tsin.Cache_.Variables, var));
    % 17 20
    % 18 20
    if isempty(idx)
        % 20 22
        tsin.Cache_.Variables = vertcat(horzcat(tsin.Cache_.Variables), var);
        switch varname
        case 'Data'
            ValueArray = Simulink.TimeseriesArray('Data');
            ValueArray.Metadata.Interpolation = tsdata.interpolation('zoh');
            tsin.Data_ = vertcat(horzcat(tsin.Data_), ValueArray);
        case 'Time'
            % 28 30
            ValueArray = tsdata.timeseriesArray('Time');
            tsin.Data_ = vertcat(horzcat(tsin.Data_), ValueArray);
            tsin.setgrid('Time');
        case 'Quality'
            % 33 35
            ValueArray = tsdata.timeseriesArray('Quality');
            tsin.Data_ = vertcat(horzcat(tsin.Data_), ValueArray);
        end % switch
    else
        % 38 40
        ValueArray = tsin.Data_(idx);
    end % if
    % 41 44
    % 42 44
    if not(isempty(ValueArray.metadata))
        ValueArray.GridFirst = ValueArray.metadata.GridFirst;
    end % if
    % 46 49
    % 47 49
    if not(writeflag)
        % 49 51
        propout = ValueArray.getArray;
        % 51 54
        % 52 54
        if strcmp(varname, 'Time') && not(isempty(propout))
            msg = 'Time vector is not aligned to the Data and Quality values';
            try
                [NewValue, GridSize, SampleSize] = utCheckArraySize(tsin, cellhorzcat(propout), var, ValueArray.GridFirst);
                % 57 59
                if not(isequal(SampleSize, [1.0 1.0]))
                    error('Timeseries:utManageDataStorage:arraysize', msg)
                end % if
            catch
                warning(msg)
            end % try
        end % if
    else
        % 66 68
        if strcmp(ValueArray.ReadOnly, 'off')
            % 68 71
            % 69 71
            if not(isempty(eventdata))
                % 71 74
                % 72 74
                try
                    [NewValue, GridSize, SampleSize] = utCheckArraySize(tsin, cellhorzcat(eventdata), var, ValueArray.GridFirst);
                catch
                    % 76 78
                    try
                        [NewValue, GridSize, SampleSize] = utCheckArraySize(tsin, cellhorzcat(eventdata), var, not(ValueArray.GridFirst));
                        % 79 82
                        % 80 82
                        ValueArray.GridFirst = not(ValueArray.GridFirst);
                        % 82 84
                        if strcmp(ValueArray.Variable.Name, 'Data')
                            ValueArray.MetaData = setGridFirst(ValueArray.MetaData, ValueArray.GridFirst);
                        end % if
                    catch
                        error('timeseries:utManageDataStorage:arraymismatch', 'Size of data array does not match the length of the time series');
                        % 88 90
                    end % try
                end % try
                % 91 93
                if isscalar(SampleSize) && eq(SampleSize, 1.0)
                    SampleSize = [1.0 1.0];
                end % if
                % 95 97
                ValueArray.SampleSize = SampleSize;
                if not(isempty(ValueArray.SampleSize)) && not(isequal(ValueArray.SampleSize, SampleSize))
                    warning('Time series data has been re-dimensioned to remain syncronized with the time vector')
                end % if
                ValueArray.setArray(ValueArray.utReshape(NewValue, GridSize));
            else
                ValueArray.SampleSize = [];
                ValueArray.setArray([]);
            end % if
        else
            error('timeseries:schema:timero', 'The Time property is read only for tscollection members.')
            % 107 109
        end % if
        % 109 113
        % 110 113
        % 111 113
        propout = [];
        % 113 117
        % 114 117
        % 115 117
        if lt(nargin, 5.0) || not(varargin{1.0})
            % 117 119
            tsin.fireDataChangeEvent(handle.EventData(tsin, 'datachange'));
        end % if
    end % if
end % function

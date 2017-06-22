function openref(type, location, errormode)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    persistent prev_location;
    % 15 17
    if lt(nargin, 3.0)
        errormode = false;
    end
    % 19 21
    if not(isempty(prev_location))
        try
            hilite_system(prev_location, 'none');
        end % try
        prev_location = [];
    end
    % 26 28
    subtype = '';
    if any(eq(type, ','))
        [type, rem] = strtok(type, ',');
        subtype = strtok(rem, ',');
    end
    % 32 36
    % 33 36
    % 34 36
    problems = {'.mex','.dll','.mat'};
    [path_ignore, name_ignore, ext] = fileparts(location);
    if any(strncmpi(ext, problems, 4.0))
        msg = sprintf('Cannot open file of type "%s"', ext);
        i_error(errormode, msg);
        return
    end
    % 42 44
    switch type
    case 'OpenFile'
        location = i_verify_location(location);
        try
            open(location);
        catch
            i_error(errormode);
        end % try
        % 52 62
        % 53 62
        % 54 62
        % 55 62
        % 56 62
        % 57 62
        % 58 62
        % 59 62
        % 60 62
    case 'LibraryLink'
        % 61 63
        try
            thismodel = i_model_from_locn(location);
            % 64 66
            dependencies.ensure_loaded(thismodel)
            hilite_system(location, 'find');
            prev_location = location;
        catch
            i_error(errormode);
        end % try
    case 'ModelReference'
        try
            thismodel = i_model_from_locn(location);
            % 74 76
            dependencies.ensure_loaded(thismodel)
            hilite_system(location, 'find');
            prev_location = location;
        catch
            i_error(errormode);
        end % try
    case {'SFunction','MSFunction','MATLABFcn'}
        try
            thismodel = i_model_from_locn(location);
            % 84 86
            dependencies.ensure_loaded(thismodel)
            hilite_system(location, 'find');
            prev_location = location;
        catch
            i_error(errormode);
        end % try
    case 'Stateflow'
        try
            thismodel = i_model_from_locn(location);
            % 94 96
            dependencies.ensure_loaded(thismodel)
            open_system(location);
            prev_location = [];
        catch
            i_error(errormode);
        end % try
    case 'RTWConfig'
        % 102 105
        % 103 105
        try
            location = i_verify_location(location);
            % 106 108
            dependencies.ensure_loaded(location);
            obj = handle(get_param(location, 'Handle'));
            s = obj.getActiveConfigSet();
            s.openDialog();
        catch
            i_error(errormode);
        end % try
    case {'BlockCallback','FromFileBlock'}
        try
            thismodel = i_model_from_locn(location);
            % 117 119
            dependencies.ensure_loaded(strtok(thismodel))
            hilite_system(location, 'find');
            prev_location = location;
        end % try
    case 'ModelCallback'
        try
            % 124 126
            open_system(location);
        catch
            i_error(errormode);
        end % try
    case 'StateflowTarget'
        % 130 132
        try
            % 132 135
            % 133 135
            open_system(location)
        catch
            i_error(errormode);
        end % try
        % 139 144
        % 140 144
        % 141 144
        % 142 144
    case 'none'
    otherwise
        % 144 147
        % 145 147
        % 146 150
        % 147 150
        % 148 150
        try
            open(location);
        catch
            i_error(errormode);
        end % try
    end
    % 155 157
end
function location_out = i_verify_location(location)
    % 158 171
    % 159 171
    % 160 171
    % 161 171
    % 162 171
    % 163 171
    % 164 171
    % 165 171
    % 166 171
    % 167 171
    % 168 171
    % 169 171
    location_out = location;
    % 171 173
    if exist(location, 'file')
        % 173 175
        return
    end
    % 176 178
    if isempty(location)
        % 178 180
        return
    end
    % 181 185
    % 182 185
    % 183 185
    location_out = dependencies.url_unescape(location);
    % 185 187
end
function i_error(errormode, msg)
    % 188 191
    % 189 191
    if lt(nargin, 2.0)
        msg = lasterr;
    end
    % 193 195
    if errormode
        error('Simulink:dependencies:openreffailure', msg);
    else
        errordlg(msg);
    end
end
function thismodel = i_model_from_locn(location)
    % 201 207
    % 202 207
    % 203 207
    % 204 207
    % 205 207
    thismodel = strtok(location, '/');
    thismodel = i_verify_location(thismodel);
    % 208 210
end

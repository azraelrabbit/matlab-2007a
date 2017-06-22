function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mlock;
    % 9 11
    pk = findpackage('hdlcoderprops');
    c = schema.class(pk, 'TestBenchCommon', pk.findclass('AbstractProp'));
    % 12 14
    schema.prop(c, 'tb_name', 'string');
    % 14 16
    p = schema.prop(c, 'tb_stimulus', 'mxArray');
    set(p, 'SetFunction', @set_testbenchstimulus);
    % 17 19
    schema.prop(c, 'tb_fracdelay_stimulus', 'mxArray');
    % 19 21
    schema.prop(c, 'tb_user_stimulus', 'mxArray');
    schema.prop(c, 'force_clockenable', 'bool');
    schema.prop(c, 'force_clockenable_value', 'bool');
    schema.prop(c, 'force_clock', 'bool');
    schema.prop(c, 'force_clock_high_time', 'HDLuint32');
    schema.prop(c, 'force_clock_low_time', 'HDLuint32');
    schema.prop(c, 'force_reset', 'bool');
    schema.prop(c, 'force_hold_time', 'HDLuint32');
    schema.prop(c, 'error_margin', 'HDLuint32');
    % 29 31
    schema.prop(c, 'force_reset_value', 'bool');
    schema.prop(c, 'tb_postfix', 'string');
    % 32 36
    % 33 36
    % 34 36
    p = schema.prop(c, 'tbrefsignals', 'bool');
    set(p, 'FactoryValue', true);
    % 37 39
    p = schema.prop(c, 'testbenchreferencepostfix', 'string');
    set(p, 'FactoryValue', '_ref');
end % function
function stim = set_testbenchstimulus(this, stim)
    % 42 45
    % 43 45
    if isempty(stim)
        stim = {};
    else
        if not(iscell(stim))
            stim = cellhorzcat(stim);
        end % if
        % 50 52
        stims = {'impulse','step','ramp','chirp','noise'};
        temp_stims = [];
        for n=1.0:length(stim)
            v = stim{n};
            if ischar(v)
                position = strmatch(lower(v), stims);
            else
                position = [];
            end % if
            if isempty(position) || gt(length(position), 1.0)
                errstr = '';
                for n=1.0:minus(length(stims), 1.0)
                    errstr = horzcat(errstr, '''', stims{n}, ''', ');
                end % for
                errstr = horzcat(errstr, 'or ''', stims{end}, '''');
                error('Illegal property value ''%s'' for %s, expected one of %s.', sprintf('%s ', stim{:}), fullpropname, errstr);
            else
                % 68 70
                temp_stims = horzcat(temp_stims, position);
            end % if
        end % for
        stim = stims(sort(unique(temp_stims)));
    end % if
end % function

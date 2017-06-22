function privgeneratehdl(filterobj, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(builtin('license', 'checkout', 'Filter_Design_HDL_Coder'))
        error(generatemsgid('nolicenseavailable'), 'Unable to check out a license for the Filter Design HDL Coder.');
        % 9 11
    end % if
    % 11 14
    % 12 14
    hprop = hdlcoderprops.HDLProps;
    PersistentHDLPropSet(hprop);
    hdlsetparameter('tbrefsignals', false);
    % 16 19
    % 17 19
    set(hprop.CLI, 'CastBeforeSum', 'off')
    if any(strcmpi(fieldnames(get(filterobj)), 'Arithmetic')) && strcmpi(filterobj.arithmetic, 'fixed')
        % 20 22
        if any(strcmpi(fieldnames(filterobj), 'CastBeforeSum'))
            % 22 24
            if filterobj.CastBeforeSum
                set(hprop.CLI, 'CastBeforeSum', 'on')
            else
                set(hprop.CLI, 'CastBeforeSum', 'off')
            end % if
        end % if
    end % if
    % 30 33
    % 31 33
    set(hprop.CLI, varargin{:});
    updateINI(hprop);
    % 34 38
    % 35 38
    % 36 38
    iscbs_specified = strcmpi('CastBeforeSum', varargin);
    if any(iscbs_specified)
        varargin = cellhorzcat('CastBeforeSum', varargin{plus(find(iscbs_specified), 1.0)});
    else
        varargin = {};
    end % if
    % 43 46
    % 44 46
    if hprop.INI.getPropSet('Global').prop_set_enables(2.0)
        % 46 48
        hdlsetparameter('vhdl_package_name', horzcat(hdlgetparameter('filter_name'), hdlgetparameter('package_suffix')));
        % 48 50
    end % if
    % 50 52
    [cando, errstr] = ishdlable(filterobj);
    if cando
        hdlmakecodegendir;
    else
        error(generatemsgid('unsupportedarch'), errstr);
    end % if
    % 57 59
    privdispatchhdl(filterobj, varargin{:});
    % 59 62
    % 60 62
    hdlwritepackage;
    % 62 64
    [topports, topdecls, topinst] = hdlentityports(hdlentitytop);
    hdlsetparameter('lasttopleveltargetlang', hdlgetparameter('target_language'));
    hdlsetparameter('lasttoplevelname', hdlentitytop);
    hdlsetparameter('lasttoplevelports', topports);
    hdlsetparameter('lasttoplevelportnames', hdlentityportnames);
    hdlsetparameter('lasttopleveldecls', topdecls);
    hdlsetparameter('lasttoplevelinstance', topinst);
    hdlsetparameter('lasttopleveltimestamp', datestr(now, 31.0));
    % 71 74
    % 72 74
    hdlsetparameter('hdlcompilescript', true);
    hdlsetparameter('hdlcompiletb', false);
    hdlsetparameter('hdlsimscript', false);
    hdlsetparameter('hdlsimprojectscript', false);
    hdlsetparameter('hdlsynthscript', true);
    hdlsetparameter('hdlmapfile', false);
    % 79 81
    hdlwritescripts;
end % function

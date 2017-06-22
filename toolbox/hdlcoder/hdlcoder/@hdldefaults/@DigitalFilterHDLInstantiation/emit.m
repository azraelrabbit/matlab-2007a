function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    displayProgressMsg(hC);
    % 8 9
    bfp = hC.SimulinkHandle;
    % 10 11
    blocktype = get_param(bfp, 'blocktype');
    if strcmp(blocktype, 'S-Function')
        functionname = get_param(bfp, 'functionname');
    end % if
    % 15 16
    if strcmp(blocktype, 'S-Function') && strcmp(functionname, 'sdspfilter2')
        % 17 18
        cpdt = get_param(bfp, 'CompiledPortDataTypes');
        in_sltype = char(cpdt.Inport(1.0));
        [inputWL, inputFL, signed] = hdlgetsizesfromtype(in_sltype);
        % 21 22
        if eq(inputWL, 0.0)
            arithmetic = 'double';
        else
            arithmetic = 'fixed';
        end % if
        % 27 28
        filterobj = dfiltblktoobj(bfp, 'arithmetic', arithmetic, 'inputformat', horzcat(inputWL, inputFL));
        % 29 30
        if not(isempty(filterobj))
            % 31 45
            % 32 45
            % 33 45
            % 34 45
            % 35 45
            % 36 45
            % 37 45
            % 38 45
            % 39 45
            % 40 45
            % 41 45
            % 42 45
            % 43 45
            % 44 45
            vhdlpkgreqd = hdlgetparameter('vhdl_package_required');
            % 46 48
            % 47 48
            oldcgmode = hdlcodegenmode;
            hdlcodegenmode('filtercoder');
            % 50 52
            % 51 52
            localCopyParamsToGlobalPool;
            % 53 55
            % 54 55
            hdlentitysignalsinit;
            % 56 57
            dfname = hC.Name;
            ip = hdlgetparameter('instance_prefix');
            dfname = regexprep(dfname, horzcat('^', ip), '');
            % 60 65
            % 61 65
            % 62 65
            % 63 65
            % 64 65
            finname = horzcat(dfname, '_in');
            foutname = horzcat(dfname, '_out');
            % 67 68
            hC.setInputPortName(3.0, finname);
            hC.setOutputPortName(0.0, foutname);
            % 70 72
            % 71 72
            hdlsetparameter('filter_name', dfname);
            hdlsetparameter('filter_input_name', finname);
            hdlsetparameter('filter_output_name', foutname);
            % 75 77
            % 76 77
            hdlsetparameter('ClockInputPort', hC.InputPorts(1.0).getSignal.Name);
            hdlsetparameter('ClockEnableInputPort', hC.InputPorts(2.0).getSignal.Name);
            hdlsetparameter('ResetInputPort', hC.InputPorts(3.0).getSignal.Name);
            % 80 81
            hdlsetparameter('filter_excess_latency', 0.0);
            hdlsetparameter('filter_registered_input', 0.0);
            hdlsetparameter('filter_registered_output', 0.0);
            % 84 85
            privdispatchhdl(filterobj);
            % 86 89
            % 87 89
            % 88 89
            hdlcodegenmode(oldcgmode);
            % 90 96
            % 91 96
            % 92 96
            % 93 96
            % 94 96
            % 95 96
            hdlsetparameter('vhdl_package_required', vhdlpkgreqd);
            % 97 99
            % 98 99
            fp = get(get_param(bfp, 'Handle'), 'Path');
            slname = get_param(bfp, 'Name');
            hdladdtoentitylist(horzcat(fp, '/', slname), dfname, '', '');
            % 102 103
        end % if
    end % if
    % 105 110
    % 106 110
    % 107 110
    % 108 110
    % 109 110
    hdlcode.entity_name = hC.Name;
    hdlcode.arch_name = 'rtl';
    hdlcode.component_name = hC.Name;
end % function
function displayProgressMsg(hC)
    % 115 119
    % 116 119
    % 117 119
    % 118 119
    fullpathname = getfullname(hC.SimulinkHandle);
    nameforuser = horzcat(hC.Name, hdlgetparameter('filename_suffix'));
    fullfilename = fullfile(hdlgetparameter('codegendir'), nameforuser);
    % 122 123
    msg = horzcat('Working on ', fullpathname, ' as ', '<a href="matlab:edit(''', fullfilename, ''')">', fullfilename, '</a>');
    % 124 125
    hdldisp(msg, 1.0);
end % function
function localCopyParamsToGlobalPool
    % 128 134
    % 129 134
    % 130 134
    % 131 134
    % 132 134
    % 133 134
    hDriver = hdlcurrentdriver;
    slpropval = hDriver.CoderParameterObject;
    PersistentHDLPropSet(copy(slpropval));
    hdlsetparameter('entitynamelist', []);
    hdlsetparameter('entitypathlist', []);
    hdlsetparameter('entityportlist', []);
    hdlsetparameter('entityarchlist', []);
    % 141 142
    hdlsetparameter('lasttopleveltargetlang', '');
    hdlsetparameter('lasttoplevelname', '');
    hdlsetparameter('lasttoplevelports', '');
    hdlsetparameter('lasttoplevelportnames', '');
    hdlsetparameter('lasttopleveldecls', '');
    hdlsetparameter('lasttoplevelinstance', '');
    hdlsetparameter('lasttopleveltimestamp', '');
    % 149 150
    hdlsetparameter('vhdl_package_required', false);
end % function

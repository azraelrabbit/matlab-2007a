function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    displayProgressMsg(hC);
    % 7 9
    status = 0.0;
    % 9 11
    chart = sf('Private', 'block2chart', hC.simulinkHandle);
    modelH = get_param(bdroot(hC.simulinkHandle), 'handle');
    machine = sf('find', 'all', 'machine.simulinkModel', modelH);
    % 13 15
    if ne(length(machine), 1.0)
        error('Failed to get machine from Stateflow block.');
    end
    % 17 19
    entityName = hC.Name;
    % 19 21
    if eq(strcmpi(hdlgetparameter('target_language'), 'vhdl'), 1.0)
        pkgnamebackup = hdlgetparameter('vhdl_package_name');
        packageName = getPackageName;
        sf('set', chart, 'chart.unique.codegenName', entityName);
        hdlsetparameter('vhdl_package_name', packageName);
    else
        sf('set', chart, 'chart.unique.codegenName', entityName);
    end
    % 28 30
    try
        sf('Private', 'autobuild_driver', 'buildchart', machine, 'slhdlc', 'no', 'no', chart);
    catch
        status = 1.0;
        slsfnagctlr('View');
    end % try
    % 35 37
    sf('set', chart, 'chart.unique.codegenName', '');
    if eq(strcmpi(hdlgetparameter('target_language'), 'vhdl'), 1.0)
        hdlsetparameter('vhdl_package_name', pkgnamebackup);
    end
    % 40 42
    if status
        chartName = sf('get', chart, 'chart.name');
        errMsg = sprintf('%s\nStateflow HDL code generation failed for chart ''%s'' (#%d).', lasterr, chartName, chart)
        % 44 46
        sf('Private', 'construct_error', chart, 'Build', errMsg, 1.0);
    end
    % 47 49
    inputPortOffset = 3.0;
    outputPortOffset = 0.0;
    % 50 71
    % 51 71
    % 52 71
    % 53 71
    % 54 71
    % 55 71
    % 56 71
    % 57 71
    % 58 71
    % 59 71
    % 60 71
    % 61 71
    % 62 71
    % 63 71
    % 64 71
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    hChart = idToHandle(sfroot, chart);
    % 71 73
    sl_inputs = find(hChart, '-depth', 1.0, '-isa', 'Stateflow.Data', 'Scope', 'Input');
    sl_outputs = find(hChart, '-depth', 1.0, '-isa', 'Stateflow.Data', 'Scope', 'Output');
    sf_inputs = sf('get', chart, 'chart.hdlInfo.hdlInPortNames');
    sf_outputs = sf('get', chart, 'chart.hdlInfo.hdlOutPortNames');
    % 76 78
    if eq(length(sl_inputs), length(sf_inputs)) && eq(length(sl_outputs), length(sf_outputs))
        % 78 80
        hasvectorport = 0.0;
    else
        hasvectorport = 1.0;
    end
    % 83 85
    if eq(strcmpi(hdlgetparameter('target_language'), 'vhdl'), 1.0) && eq(hasvectorport, 1.0)
        inputs = sl_inputs;
        outputs = sl_outputs;
        for counter=0.0:1.0:minus(length(inputs), 1.0)
            portName = sf('CodegenNameOf', inputs(plus(counter, 1.0)).ID);
            % 89 91
            hC.setInputPortName(plus(inputPortOffset, counter), portName);
        end % for
        for counter=0.0:1.0:minus(length(outputs), 1.0)
            portName = sf('CodegenNameOf', outputs(plus(counter, 1.0)).ID);
            % 94 96
            hC.setOutputPortName(plus(outputPortOffset, counter), portName);
        end % for
    else
        inputs = sf_inputs;
        outputs = sf_outputs;
        for counter=0.0:1.0:minus(length(inputs), 1.0)
            portName = inputs{plus(counter, 1.0)};
            hC.setInputPortName(plus(inputPortOffset, counter), portName);
        end % for
        for counter=0.0:1.0:minus(length(outputs), 1.0)
            portName = outputs{plus(counter, 1.0)};
            hC.setOutputPortName(plus(outputPortOffset, counter), portName);
        end % for
    end
    % 109 111
    hdlcode.entity_name = entityName;
    hdlcode.arch_name = 'fsm_SFHDL';
    hdlcode.component_name = entityName;
    % 113 116
    % 114 116
    chartPath = sf('FullNameOf', chart, '/');
    hdladdtoentitylist(chartPath, entityName, '', '');
end
function displayProgressMsg(hC)
    % 119 123
    % 120 123
    % 121 123
    fullpathname = getfullname(hC.SimulinkHandle);
    nameforuser = horzcat(hC.Name, hdlgetparameter('filename_suffix'));
    fullfilename = fullfile(hdlgetparameter('codegendir'), nameforuser);
    % 125 127
    msg = horzcat('Working on ', fullpathname, ' as ', '<a href="matlab:edit(''', fullfilename, ''')">', fullfilename, '</a>');
    % 127 129
    hdldisp(msg, 1.0);
end
function pkgFilename = getPackageName(hC)
    % 131 134
    % 132 134
    hcoderobj = hdlcurrentdriver;
    pkgName = hcoderobj.PirInstance.getTopNetwork.Name;
    pkgSuffix = hdlgetparameter('package_suffix');
    pkgFilename = horzcat(pkgName, pkgSuffix);
end

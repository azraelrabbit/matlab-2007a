function generateSubsystemWithLatency(this, hC, targetBlkPath, latencyInfo)
    % 1 29
    % 2 29
    % 3 29
    % 4 29
    % 5 29
    % 6 29
    % 7 29
    % 8 29
    % 9 29
    % 10 29
    % 11 29
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    hdldrv = hdlcurrentdriver;
    rates = hdldrv.ModelConnection.ModelRates;
    if not(isempty(ge(rates, 0.0)))
        BaseRate = 1.0;
    else
        BaseRate = min(rates(gt(rates, 0.0)));
    end % if
    % 36 37
    validBlk = 1.0;
    % 38 39
    try
        originalBlkPath = getfullname(hC.SimulinkHandle);
    catch
        validBlk = 0.0;
    end % try
    % 44 45
    if validBlk
        % 46 47
        add_block('built-in/Subsystem', targetBlkPath);
        % 48 49
        [turnhilitingon, color] = getHiliteInfo(hC);
        % 50 51
        if turnhilitingon
            hiliteBlkAncestors(targetBlkPath, color);
        end % if
        % 54 55
        for ii=1.0:length(hC.InputPorts)
            inportPath{ii} = horzcat(targetBlkPath, '/In', num2str(ii));
            add_block('built-in/Inport', inportPath{ii});
            set_param(inportPath{ii}, 'Position', horzcat(85.0, plus(78.0, mtimes(minus(ii, 1.0), 20.0)), 115.0, plus(92.0, mtimes(minus(ii, 1.0), 20.0))));
        end % for
        % 60 61
        for ii=1.0:length(hC.OutputPorts)
            outportPath{ii} = horzcat(targetBlkPath, '/Out', num2str(ii));
            add_block('built-in/Outport', outportPath{ii});
            set_param(outportPath{ii}, 'Position', horzcat(395.0, plus(88.0, mtimes(minus(ii, 1.0), 20.0)), 425.0, plus(102.0, mtimes(minus(ii, 1.0), 20.0))));
        end % for
        % 66 67
        blkpath = horzcat(targetBlkPath, '/', hC.Name);
        add_block(originalBlkPath, blkpath);
        set_param(blkpath, 'Position', [185.0 75.0 215.0 115.0]);
        % 70 73
        % 71 73
        % 72 73
        for ii=1.0:length(hC.OutputPorts)
            sampleTime = BaseRate;
            if gt(latencyInfo.Outputs{ii}, 0.0)
                gendelayblkpath = horzcat(targetBlkPath, '/', hC.Name, '_GenDelay', num2str(ii));
                add_block('simulink/Discrete/Integer Delay', gendelayblkpath);
                set_param(gendelayblkpath, 'NumDelays', num2str(latencyInfo.Outputs{ii}));
                set_param(gendelayblkpath, 'samptime', num2str(sampleTime));
                set_param(gendelayblkpath, 'Position', [265.0 75.0 295.0 115.0]);
                set_param(gendelayblkpath, 'BackgroundColor', color);
                makeSyntheticBlkPassThrough(hC, gendelayblkpath);
                % 83 85
                % 84 85
                makeSyntheticBlkPassThrough(hC, gendelayblkpath);
                add_line(targetBlkPath, horzcat(hC.Name, '/', num2str(ii)), horzcat(hC.Name, '_GenDelay', num2str(ii), '/1'), 'autorouting', 'on');
                add_line(targetBlkPath, horzcat(hC.Name, '_GenDelay', num2str(ii), '/1'), horzcat('Out', num2str(ii), '/1'), 'autorouting', 'on');
            else
                add_line(targetBlkPath, horzcat(hC.Name, '/', num2str(ii)), horzcat('Out', num2str(ii), '/1'), 'autorouting', 'on');
            end % if
            % 91 92
        end % for
        % 93 100
        % 94 100
        % 95 100
        % 96 100
        % 97 100
        % 98 100
        % 99 100
        for ii=1.0:length(hC.InputPorts)
            add_line(targetBlkPath, horzcat('In', num2str(ii), '/', '1'), horzcat(hC.Name, '/', num2str(ii)), 'autorouting', 'on');
        end % for
    else
        % 104 109
        % 105 109
        % 106 109
        % 107 109
        % 108 109
        % 109 111
        % 110 111
    end % if
end % function
function hiliteBlkAncestors(blkPath, color)
    % 114 117
    % 115 117
    % 116 117
    currentTargetModel = bdroot;
    while not(isempty(blkPath)) && not(strcmp(blkPath, currentTargetModel))
        set_param(blkPath, 'BackgroundColor', color);
        blkPath = get_param(blkPath, 'Parent');
    end % while
end % function
function [turnhilitingon, color] = getHiliteInfo(hC)
    % 124 127
    % 125 127
    % 126 127
    srcMdlName = strtok(getfullname(hC.SimulinkHandle), '/');
    % 128 130
    % 129 130
    srcMdlCoderObj = hdlmodeldriver(srcMdlName);
    % 131 134
    % 132 134
    % 133 134
    color = srcMdlCoderObj.getParameter('hilitecolor');
    turnhilitingon = srcMdlCoderObj.getParameter('hiliteancestors');
end % function
function makeSyntheticBlkPassThrough(hC, syntheticBlkPath)
    % 138 141
    % 139 141
    % 140 141
    hdltargetcc = hdltargetmodelcc(hC.SimulinkHandle);
    % 142 143
    if not(isempty(hdltargetcc))
        hdltargetcc.forEach(syntheticBlkPath, 'simulink/Discrete/Integer Delay', {}, 'hdldefaults.PassThroughHDLEmission');
    else
        % 146 148
        % 147 148
        % 148 150
        % 149 150
    end % if
end % function

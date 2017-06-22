function addSLBlockLatency(this, hC, targetBlkPath, latencyInfo, outputBlk, lastBlkPosition)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    blkSize = [20.0 40.0];
    blkPosition = horzcat(plus(lastBlkPosition(1.0), 50.0), lastBlkPosition(2.0));
    move_down = [0.0 50.0];
    % 11 13
    % 12 13
    hdldrv = hdlcurrentdriver;
    rates = hdldrv.ModelConnection.ModelRates;
    validRates = rates(gt(rates, 0.0));
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    if isempty(validRates)
        BaseRate = 1.0;
    else
        BaseRate = min(validRates);
    end % if
    [turnhilitingon, color] = this.getHiliteInfo(hC);
    for ii=1.0:length(hC.OutputPorts)
        blkPosition = plus(blkPosition, mtimes(minus(ii, 1.0), move_down));
        position = horzcat(blkPosition, plus(blkPosition, blkSize));
        sampleTime = BaseRate;
        if gt(latencyInfo.Outputs{ii}, 0.0)
            gendelayblkpath = horzcat(targetBlkPath, '/', hC.Name, '_GenDelay', num2str(ii));
            add_intDelay(gendelayblkpath);
            set_param(gendelayblkpath, 'NumDelays', num2str(latencyInfo.Outputs{ii}));
            set_param(gendelayblkpath, 'samptime', num2str(sampleTime));
            set_param(gendelayblkpath, 'Position', position);
            set_param(gendelayblkpath, 'BackgroundColor', color);
            makeSyntheticBlkPassThrough(hC, gendelayblkpath);
            % 39 41
            % 40 41
            makeSyntheticBlkPassThrough(hC, gendelayblkpath);
            % 42 44
            % 43 44
            add_line(targetBlkPath, horzcat(outputBlk, '/', num2str(ii)), horzcat(hC.Name, '_GenDelay', num2str(ii), '/1'), 'autorouting', 'on');
            add_line(targetBlkPath, horzcat(hC.Name, '_GenDelay', num2str(ii), '/1'), horzcat('Out', num2str(ii), '/1'), 'autorouting', 'on');
        else
            add_line(targetBlkPath, horzcat(outputBlk, '/', num2str(ii)), horzcat('Out', num2str(ii), '/1'), 'autorouting', 'on');
        end % if
    end % for
end % function
function makeSyntheticBlkPassThrough(hC, syntheticBlkPath)
    % 52 56
    % 53 56
    % 54 56
    % 55 56
    hdltargetcc = hdltargetmodelcc(hC.SimulinkHandle);
    % 57 58
    if not(isempty(hdltargetcc))
        hdltargetcc.forEach(syntheticBlkPath, 'simulink/Discrete/Integer Delay', {}, 'hdldefaults.PassThroughHDLEmission');
    else
        % 61 63
        % 62 63
        % 63 65
        % 64 65
    end % if
end % function
function add_intDelay(blkPath)
    current_system = get_param(0.0, 'currentSystem');
    simulink_present = find_system('type', 'block_diagram', 'name', 'simulink');
    if isempty(simulink_present)
        load_system('simulink');
    end % if
    set_param(0.0, 'currentSystem', current_system);
    add_block('simulink/Discrete/Integer Delay', blkPath);
    if isempty(simulink_present)
        bdclose('simulink');
    end % if
end % function

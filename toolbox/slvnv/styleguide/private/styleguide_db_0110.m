function rec = styleguide_db_0110
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    rec = Simulink.MdlAdvisorCheck;
    rec.Title = DAStudio.message('Slvnv:styleguide:db0110Title');
    rec.TitleID = 'StyleGuide: db_0110';
    rec.TitleTips = DAStudio.message('Slvnv:styleguide:db0110Tip');
    rec.TitleInRAWFormat = false;
    rec.CallbackHandle = @db_0110_StyleThreeCallback;
    rec.CallbackContext = 'None';
    rec.CallbackStyle = 'StyleThree';
    rec.CallbackReturnInRAWFormat = false;
    rec.PushToModelExplorer = false;
    rec.Visible = true;
    rec.Enable = true;
    rec.Value = true;
    rec.Group = sg_maab_group;
    rec.LicenseName = {'SL_Verification_Validation'};
end
function [ResultDescription, ResultHandles] = db_0110_StyleThreeCallback(system)
    % 23 26
    % 24 26
    feature('scopedaccelenablement', 'off');
    % 26 29
    % 27 29
    ResultDescription = {};
    ResultHandles = {};
    ResultDescription{plus(end, 1.0)} = sg_maab_msg('db0110Tip');
    ResultHandles{plus(end, 1.0)} = [];
    mdladvObj = Simulink.ModelAdvisor.getModelAdvisor(system);
    mdladvObj.setCheckResultStatus(false);
    % 34 36
    failedHdls = CheckTunableExpressions(system);
    failedHdls = unique(failedHdls);
    % 37 40
    % 38 40
    if isempty(failedHdls)
        currentDescription = DAStudio.message('Slvnv:styleguide:PassedMsg');
        mdladvObj.setCheckResultStatus(true);
        % 42 44
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = {};
    else
        % 46 48
        currentDescription = DAStudio.message('Slvnv:styleguide:db0110Fail');
        ResultDescription{plus(end, 1.0)} = currentDescription;
        ResultHandles{plus(end, 1.0)} = failedHdls;
        mdladvObj.setCheckResultStatus(false);
    end
end
function failed = CheckTunableExpressions(system)
    failed = [];
    % 55 90
    % 56 90
    % 57 90
    % 58 90
    % 59 90
    % 60 90
    % 61 90
    % 62 90
    % 63 90
    % 64 90
    % 65 90
    % 66 90
    % 67 90
    % 68 90
    % 69 90
    % 70 90
    % 71 90
    % 72 90
    % 73 90
    % 74 90
    % 75 90
    % 76 90
    % 77 90
    % 78 90
    % 79 90
    % 80 90
    % 81 90
    % 82 90
    % 83 90
    % 84 90
    % 85 90
    % 86 90
    % 87 90
    % 88 90
    allBlocks = find_system(system, 'FollowLinks', styleguide_lib_follow('check'), 'LookUnderMasks', 'all', 'FindAll', 'off', 'Type', 'block');
    bObjs = get_param(allBlocks, 'Object');
    % 91 94
    % 92 94
    for i=1.0:length(allBlocks)
        tunableProps = getTunableProps(bObjs{i});
        % 95 98
        % 96 98
        for j=1.0:length(tunableProps)
            propValue = bObjs{i}.(tunableProps{j});
            mId = '([a-zA-Z_]\w*)';
            Ident = regexp(propValue, mId, 'match');
            if ~(isempty(Ident))
                % 102 105
                % 103 105
                mIdOnly = '^\s*[a-zA-Z_]\w*\s*$';
                matchIdx = regexp(propValue, mIdOnly);
                if isempty(matchIdx)
                    % 107 115
                    % 108 115
                    % 109 115
                    % 110 115
                    % 111 115
                    % 112 115
                    % 113 115
                    for k=1.0:length(Ident)
                        paramCheck = horzcat('exist(''', Ident{k}, ''',''var'');');
                        inBaseWS = evalin('base', paramCheck);
                        if inBaseWS
                            failed(plus(end, 1.0)) = bObjs{i}.Handle;
                            % 119 122
                            % 120 122
                            break
                        else
                            mdlWS = get_param(bdroot(system), 'ModelWorkspace');
                            if ~(isempty(mdlWS))
                                inMdlWS = mdlWS.evalin('base', paramCheck);
                                if inMdlWS
                                    failed(plus(end, 1.0)) = bObjs{i}.Handle;
                                    % 128 131
                                    % 129 131
                                    break
                                end
                            end
                        end
                    end % for
                end
            end
        end % for
    end % for
end
function props = getTunableProps(bObj)
    % 141 145
    % 142 145
    % 143 145
    switch bObj.BlockType
    case 'Constant'
        props = {'Value'};
    case 'DiscreteIntegrator'
        props = {'gainval','InitialCondition','UpperSaturationLimit','LowerSaturationLimit'};
    case 'Gain'
        props = {'Gain'};
    case 'Integrator'
        props = {'InitialCondition','UpperSaturationLimit','LowerSaturationLimit','AbsoluteTolerance'};
    case 'Saturate'
        props = {'UpperLimit','LowerLimit'};
    case 'Switch'
        props = {'Threshold'};
    case 'UnitDelay'
        props = {'X0'};
    case 'Derivative'
        props = {'LinearizePole'};
    case 'StateSpace'
        props = {'A','B','C','D','X0','AbsoluteTolerance'};
    case 'TransportDelay'
        props = {'DelayTime','InitialOutput','BufferSize','PadeOrder'};
    case 'VariableTransportDelay'
        props = {'MaximumDelay','InitialOutput','MaximumPoints','PadeOrder','AbsoluteTolerance'};
    case 'Backlash'
        props = {'BacklashWidth','InitialOutput'};
    case 'DeadZone'
        props = {'LowerValue','UpperValue'};
    case 'HitCross'
        props = {'HitCrossingOffset'};
    case 'Quantizer'
        props = {'QuantizationInterval'};
    case 'RateLimiter'
        props = {'RisingSlewLimit','FallingSlewLimit','InitialCondition'};
    case 'Relay'
        props = {'OnSwitchValue','OffSwitchValue','OnOutputValue','OffOutputValue'};
    case 'Memory'
        props = {'X0'};
    case 'CombinatorialLogic'
        props = {'TruthTable'};
    case 'Lookup2D'
        props = {'RowIndex','ColumnIndex','OutputValues'};
    case 'Lookup'
        props = {'InputValues','OutputValues'};
    case 'Bias'
        props = {'Bias'};
    case 'MagnitudeAngleToComplex'
        props = {'ConstantPart'};
    case 'PermuteDimensions'
        props = {'Order'};
    case 'RealImagToComplex'
        props = {'ConstantPart'};
    case 'Sin'
        props = {'Amplitude','Bias','Frequency','Phase','Samples','Offset'};
    case 'InitialCondition'
        props = {'Value'};
    case 'RateTransition'
        props = {'X0'};
    otherwise
        props = [];
    end
end

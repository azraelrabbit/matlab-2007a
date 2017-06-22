function bParam = getBlockParams(blk, specialMode)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    bParam = get_param(blk, 'MaskNames');
    % 18 20
    if not(isempty(bParam))
    else
        % 21 24
        % 22 24
        % 23 25
        blkType = get_param(blk, 'blocktype');
        switch blkType
        case 'Scope'
            bParam = {};
            filterFixpt = false;
        case 'SubSystem'
            filterFixpt = false;
            % 31 33
            bParam = {};
            % 33 35
            maskType = get_param(blk, 'MaskType');
            switch maskType
            case 'Stateflow'
                bParam = {'Chart'};
            otherwise
                % 39 41
                % 40 42
                bParam = {};
            end % switch
        case 'Inport'
            filterFixpt = false;
            bParam = {'Port';'PortDimensions';'SampleTime';'DefinedInBlk'};
            % 47 52
            % 48 52
            % 49 52
            % 50 52
        case 'From'
            % 51 53
            bParam = locGetDialogParams(blk);
            bParam{plus(end, 1.0)} = 'DefinedInBlk';
        case {'Outport','Goto'}
            % 55 60
            % 56 60
            % 57 60
            % 58 60
            bParam = locGetDialogParams(blk);
            bParam{plus(end, 1.0)} = 'UsedByBlk';
        otherwise
            bParam = locGetDialogParams(blk);
        end % switch
        % 64 66
        if lt(nargin, 2.0) || not(strcmp(specialMode, 'Fixpt'))
            [diffList, diffIdx] = setdiff(bParam, {'ShowAdditionalParam';'ParameterDataTypeMode';'ParameterDataType';'ParameterScalingMode';'ParameterScaling';'SettingsModeFixpt';'OutputDataTypeScalingMode';'OutDataType';'OutScaling';'LockScale';'RndMeth';'SaturateOnIntegerOverflow'});
            % 67 82
            % 68 82
            % 69 82
            % 70 82
            % 71 82
            % 72 82
            % 73 82
            % 74 82
            % 75 82
            % 76 82
            % 77 82
            % 78 82
            % 79 82
            % 80 82
            bParam = bParam(sort(diffIdx));
        end % if
        % 83 93
        % 84 93
        % 85 93
        % 86 93
        % 87 93
        % 88 93
        % 89 93
        % 90 93
        % 91 93
    end % if
function bParam = locGetDialogParams(blk)
    % 94 102
    % 95 102
    % 96 102
    % 97 102
    % 98 102
    % 99 102
    % 100 102
    dParam = get_param(blk, 'dialogparameters');
    if isstruct(dParam)
        bParam = fieldnames(dParam);
        bParam = bParam(:);
    else
        bParam = {};
    end % if

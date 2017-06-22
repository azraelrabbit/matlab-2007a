function Vals = getMaskParams(blockObj, block)
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
    % 14 15
    des_setallfieldvalues(block);
    % 16 17
    Vals{idxEntityType} = 'Default';
    Vals{idxEntityName} = 'CustomEntity';
    Vals{idxPriorityEntityGeneration} = '1';
    Vals{idxInterGenTime} = 'Specify via dialog';
    Vals{idxBlockable} = 'Yes with immediate restart';
    Vals{idxDistribution} = 'Constant';
    Vals{idxMinUnif} = '0';
    Vals{idxSeed} = '12345';
    Vals{idxMaxUnif} = '1';
    Vals{idxMean} = '1';
    Vals{idxSampleTime} = '-1';
    Vals{idxOffsetTime} = '0';
    Vals{idxTrigger} = 'Rising';
    Vals{idxTime} = '1';
    Vals{idxStatCountOpt} = 'Disabled';
    Vals{idxAttrNameCount} = 'Count';
    Vals{idxSchedule} = 'According to sorted block order';
    Vals{idxGenFirstEvtOpt} = 'Off';
    Vals{idxOutPortStatus} = 'Disabled';
    Vals{idxAvgGenTimeOpt} = 'Disabled';
    Vals{idxFcnCallOpt} = 'Disabled';
end % function

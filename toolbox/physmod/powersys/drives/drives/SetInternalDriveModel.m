function SetInternalDriveModel(DriveType, AverageValue, block)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    switch DriveType
    case 'AC1'
        % 15 17
        return
    case 'AC2'
        BlockToReplace{1.0} = 'SVM generator';
        BlockToReplace{2.0} = 'Three-phase Inverter';
        ReplacementBlocks = BlockToReplace;
    case 'AC3'
        BlockToReplace{1.0} = 'Three-phase Inverter';
        BlockToReplace{2.0} = 'F.O.C.';
        BlockToReplace{3.0} = 'Mux';
        ReplacementBlocks = BlockToReplace;
    case 'AC4'
        % 27 29
        return
    case 'AC5'
        BlockToReplace{1.0} = 'Vector control';
        BlockToReplace{2.0} = 'Three-phase Inverter';
        BlockToReplace{3.0} = 'Mux';
        BlockToReplace{4.0} = 'Active rectifier';
        ReplacementBlocks = BlockToReplace;
    case 'AC6'
        BlockToReplace{1.0} = 'Three-phase Inverter';
        BlockToReplace{2.0} = 'VECT';
        BlockToReplace{3.0} = 'Mux';
        ReplacementBlocks = BlockToReplace;
    case 'AC7'
        BlockToReplace{1.0} = 'Three-phase Inverter';
        BlockToReplace{2.0} = 'Current Controller';
        BlockToReplace{3.0} = 'Mux';
        ReplacementBlocks = BlockToReplace;
    case 'DC1'
        BlockToReplace{1.0} = 'Thyristor converter';
        BlockToReplace{2.0} = 'Bridge firing unit';
        ReplacementBlocks = BlockToReplace;
    case 'DC2'
        BlockToReplace{1.0} = 'Thyristor converter 1';
        BlockToReplace{2.0} = 'Thyristor converter 2';
        BlockToReplace{3.0} = 'Bridge firing unit';
        ReplacementBlocks = BlockToReplace;
    case 'DC3'
        BlockToReplace{1.0} = 'Thyristor converter';
        BlockToReplace{2.0} = 'Bridge firing unit';
        ReplacementBlocks = BlockToReplace;
    case {'DC4'}
        BlockToReplace{1.0} = 'Thyristor converter 1';
        BlockToReplace{2.0} = 'Thyristor converter 2';
        BlockToReplace{3.0} = 'Bridge firing unit';
        ReplacementBlocks = BlockToReplace;
    case {'DC5','DC6','DC7'}
        BlockToReplace{1.0} = 'Chopper';
        BlockToReplace{2.0} = 'Current controller';
        ReplacementBlocks = BlockToReplace;
    end
    % 68 71
    % 69 71
    ReferenceLibrary = horzcat(DriveType, 'DriveInternalModels');
    WantAverageValueModel = eq(AverageValue, 1.0);
    HaveAverageValueModel = not(isempty(findstr(get_param(horzcat(getfullname(block), '/', BlockToReplace{1.0}), 'ReferenceBlock'), 'average model')));
    % 73 76
    % 74 76
    if WantAverageValueModel && not(HaveAverageValueModel)
        % 76 78
        load_system(ReferenceLibrary);
        for i=1.0:length(BlockToReplace)
            MaskValues = get_param(horzcat(getfullname(block), '/', BlockToReplace{i}), 'MaskValues');
            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', BlockToReplace{i}, horzcat(ReferenceLibrary, '/', ReplacementBlocks{i}, ' (average model)'), 'noprompt');
            set_param(horzcat(getfullname(block), '/', BlockToReplace{i}), 'MaskValues', MaskValues);
        end % for
    else
        if HaveAverageValueModel && not(WantAverageValueModel)
            load_system(ReferenceLibrary);
            for i=1.0:length(BlockToReplace)
                MaskValues = get_param(horzcat(getfullname(block), '/', BlockToReplace{i}), 'MaskValues');
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', BlockToReplace{i}, horzcat(ReferenceLibrary, '/', ReplacementBlocks{i}), 'noprompt');
                set_param(horzcat(getfullname(block), '/', BlockToReplace{i}), 'MaskValues', MaskValues);
            end % for
        end
    end
end

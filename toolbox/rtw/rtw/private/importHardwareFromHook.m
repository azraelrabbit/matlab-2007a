function importHardwareFromHook(hHardware, hookFile, mdlName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    wordlengths = feval(hookFile, 'wordlengths', mdlName);
    set(hHardware, 'TargetBitPerChar', wordlengths.CharNumBits);
    set(hHardware, 'TargetBitPerShort', wordlengths.ShortNumBits);
    set(hHardware, 'TargetBitPerInt', wordlengths.IntNumBits);
    set(hHardware, 'TargetBitPerLong', wordlengths.LongNumBits);
    if isfield(wordlengths, 'WordSize')
        set(hHardware, 'TargetWordSize', wordlengths.WordSize);
    end % if
    % 14 15
    cImp = feval(hookFile, 'cImplementation', mdlName);
    set(hHardware, 'TargetShiftRightIntArith', cImp.ShiftRightIntArith);
    if isfield(cImp, 'TypeEmulationWarnSuppressLevel')
        set(hHardware, 'TargetTypeEmulationWarnSuppressLevel', cImp.TypeEmulationWarnSuppressLevel);
    end % if
    if isfield(cImp, 'PreprocMaxBitsSint')
        set(hHardware, 'TargetPreprocMaxBitsSint', cImp.PreprocMaxBitsSint);
    end % if
    if isfield(cImp, 'PreprocMaxBitsUint')
        set(hHardware, 'TargetPreprocMaxBitsUint', cImp.PreprocMaxBitsUint);
    end % if
    % 26 27
    if isfield(cImp, 'Endianess')
        set(hHardware, 'TargetEndianess', cImp.Endianess);
    end % if
end % function

function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    schema.package('dspfwiz');
    % 7 10
    % 8 10
    enumdatatypes4block;
    % 10 13
    % 11 13
    enumdatatypes4realizemdl;
end % function
function enumdatatypes4block
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    [libnames, constructors, dfilt_idx, qfilt_idx] = get_lib_info('blocktarget');
    % 20 23
    % 21 23
    block_datatypes4dfilt(libnames, constructors, dfilt_idx);
    % 23 26
    % 24 26
    block_datatypes4qfilt(libnames, constructors, qfilt_idx);
end % function
function enumdatatypes4realizemdl
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    [libnames, constructors, dfilt_idx, qfilt_idx] = get_lib_info('realizemdltarget');
    % 33 36
    % 34 36
    realizemdl_datatypes4dfilt(libnames, constructors, dfilt_idx);
    % 36 39
    % 37 39
    realizemdl_datatypes4qfilt(libnames, constructors, qfilt_idx);
end % function
function [librarynames, constructors, dfilt_idx, qfilt_idx] = get_lib_info(abstractclass)
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    pk = findpackage('dspfwiztargets');
    c = findclass(pk);
    subclassnames = get(c, 'Name');
    constructors = findnonabstractsubclasses(abstractclass, 'dspfwiztargets');
    librarynames = [];
    dfilt_idx = [];
    qfilt_idx = [];
    for i=1.0:length(constructors)
        idx = find(strcmpi(constructors{i}, subclassnames));
        librarynames = horzcat(librarynames, cellhorzcat(c(idx).Description));
        h = feval(horzcat('dspfwiztargets.', constructors{i}));
        if isdfiltable(h)
            dfilt_idx = vertcat(dfilt_idx, i);
        end % if
        if isqfiltable(h)
            qfilt_idx = vertcat(qfilt_idx, i);
        end % if
    end % for
end % function
function block_datatypes4dfilt(librarynames, constructors, dfilt_idx)
    % 67 71
    % 68 71
    % 69 71
    if isempty(findtype('blocklibnames4dfilt'))
        schema.EnumType('blocklibnames4dfilt', librarynames(dfilt_idx));
    end % if
    % 73 75
    if isempty(findtype('blocklibconstructors4dfilt'))
        schema.EnumType('blocklibconstructors4dfilt', constructors(dfilt_idx));
    end % if
end % function
function block_datatypes4qfilt(librarynames, constructors, qfilt_idx)
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    if isempty(findtype('blocklibnames4qfilt'))
        schema.EnumType('blocklibnames4qfilt', librarynames(qfilt_idx));
    end % if
    % 86 88
    if isempty(findtype('blocklibconstructors4qfilt'))
        schema.EnumType('blocklibconstructors4qfilt', constructors(qfilt_idx));
    end % if
end % function
function realizemdl_datatypes4dfilt(librarynames, constructors, dfilt_idx)
    % 92 96
    % 93 96
    % 94 96
    if isempty(findtype('realizemdllibnames4dfilt'))
        schema.EnumType('realizemdllibnames4dfilt', librarynames(dfilt_idx));
    end % if
    % 98 100
    if isempty(findtype('realizemdllibconstructors4dfilt'))
        schema.EnumType('realizemdllibconstructors4dfilt', constructors(dfilt_idx));
    end % if
end % function
function realizemdl_datatypes4qfilt(librarynames, constructors, qfilt_idx)
    % 104 109
    % 105 109
    % 106 109
    % 107 109
    qfilt_idx = qfilt_idx(end:-1.0:1.0);
    % 109 112
    % 110 112
    if isempty(findtype('realizemdllibnames4qfilt'))
        schema.EnumType('realizemdllibnames4qfilt', librarynames(qfilt_idx));
    end % if
    % 114 116
    if isempty(findtype('realizemdllibconstructors4qfilt'))
        schema.EnumType('realizemdllibconstructors4qfilt', constructors(qfilt_idx));
    end % if
end % function

function [builddir, modulename] = drive_cgsetup(block)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    builddir = './';
    sys = bdroot(block);
    params = get_param(sys, 'RTWGenSettings');
    if isstruct(params) && isfield(params, 'RelativeBuildDir')
        candidate = horzcat(fullfile(pwd, params.RelativeBuildDir), filesep);
        if exist(candidate, 'dir')
            builddir = candidate;
        end % if
    end % if
    % 16 19
    % 17 19
    % 18 19
    subsystemBlock = horzcat(block, '/', 'Subsystem');
    modulename = horzcat('drive_', getfullname(sys), '_', get_param(subsystemBlock, 'MachineID'));
end % function

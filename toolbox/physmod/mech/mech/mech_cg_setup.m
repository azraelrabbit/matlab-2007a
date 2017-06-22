function directory = mech_cg_setup(sys)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    persistent register;
    if isempty(register)
        mech_register_cg_target('grt.tlc');
        mech_register_cg_target('grt_malloc.tlc');
        mech_register_cg_target('xpctarget.tlc');
        mech_register_cg_target('rsim.tlc');
        mech_register_cg_target('rtwin.tlc');
        mech_register_cg_target('ert_malloc.tlc');
        mech_register_cg_target('ert.tlc');
        mech_register_cg_target('modelrefsim.tlc');
        mech_register_cg_target('rtwsfcn.tlc');
        register = 1.0;
    end
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    directory = [];
    params = get_param(sys, 'RTWGenSettings');
    if isstruct(params) && isfield(params, 'RelativeBuildDir')
        directory = horzcat(fullfile(pwd, params.RelativeBuildDir), filesep);
    end
    % 30 32
    if not(isempty(directory)) && eq(exist(directory), 7.0)
        % 32 36
        % 33 36
        % 34 36
        disp('### Generating code for SimMechanics');
        % 36 41
        % 37 41
        % 38 41
        % 39 41
        targetlang = get_param(sys, 'TargetLang');
        if strcmpi(targetlang, 'C++')
            error('C++ code generation is not supported by SimMechanics')
        end
        % 44 49
        % 45 49
        % 46 49
        % 47 49
        targetfile = get_param(sys, 'RTWSystemTargetFile');
        mech_target_manager('check', targetfile, getfullname(sys));
    else
        directory = [];
    end
end

function issue_inv_comp_env_val_error(env, envVal, checkEnvVal, correctSetting)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    DAStudio.error('RTW:compilerConfig:invalidEnvVariable', env, envVal, checkEnvVal, env, correctSetting, fullfile(prefdir, 'mexopts.bat'));
    % 10 11
end % function

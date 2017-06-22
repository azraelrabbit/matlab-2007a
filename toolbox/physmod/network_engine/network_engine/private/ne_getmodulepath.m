function [gen_src_path, gen_src_name] = ne_getmodulepath(info)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    [gen_src_path, gen_src_name] = fileparts(info.GeneratedEqnSource);
    gen_src_path = horzcat(gen_src_path, filesep);
end % function

function drive_cgfinish(directory, module)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    l_process_file(fullfile(directory, horzcat(module, '.c')), false);
    l_process_file(fullfile(directory, horzcat(module, '.h')), true);
end % function
function l_process_file(filename, isheader)
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    directory = fileparts(filename);
    tempfile = fullfile(directory, '_sim_driveline.tmp');
    % 17 18
    infile = fopen(filename, 'r');
    outfile = fopen(tempfile, 'w');
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    fprintf(outfile, '/* SimDriveline target specific file\n');
    fprintf(outfile, ' *      This file generated as part of SimDriveline code generation.\n');
    fprintf(outfile, ' */\n');
    % 27 28
    if isheader
        fprintf(outfile, '#include "drive_std.h"\n');
        fprintf(outfile, '#ifdef __cplusplus\n');
        fprintf(outfile, 'extern "C" {\n');
        fprintf(outfile, '#endif\n');
    end % if
    % 34 35
    l_copy_file(infile, outfile);
    % 36 37
    if isheader
        fprintf(outfile, '#ifdef __cplusplus\n');
        fprintf(outfile, '}\n');
        fprintf(outfile, '#endif\n');
    end % if
    % 42 43
    fclose(infile);
    fclose(outfile);
    % 45 46
    infile = fopen(tempfile, 'r');
    outfile = fopen(filename, 'w');
    l_copy_file(infile, outfile);
    fclose(infile);
    fclose(outfile);
    % 51 52
    delete(tempfile);
end % function
function l_copy_file(infile, outfile)
    % 55 57
    % 56 57
        while not(feof(infile))
        line = fgetl(infile);
        fprintf(outfile, '%s\n', line);
    end % while
end % function

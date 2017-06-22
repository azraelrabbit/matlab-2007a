function mech_cg_finish(directory, module_names)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if not(iscell(module_names))
        module_names = cellhorzcat(module_names);
    end % if
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    for i=1.0:length(module_names)
        header = horzcat(directory, filesep, module_names{i}, '.h');
        source = horzcat(directory, filesep, module_names{i}, '.c');
        local_AddHeaderLine(header);
        local_AddHeaderLine(source);
    end % for
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    disp('### Code generation for SimMechanics complete');
end % function
function local_AddHeaderLine(filename)
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    directory = fileparts(filename);
    tempfile = horzcat(directory, filesep, 'sim_mechanics_scratch.c');
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    infile = fopen(filename, 'r');
    outfile = fopen(tempfile, 'w');
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    fprintf(outfile, '/* SimMechanics target specific file\n');
    fprintf(outfile, ' *      This file generated a part of SimMechanics code generation.\n');
    fprintf(outfile, ' */\n');
    % 52 53
    fprintf(outfile, '#include "tmwtypes.h"\n');
    fprintf(outfile, '#include <stdlib.h>\n');
    fprintf(outfile, '#include <string.h>\n');
    fprintf(outfile, '#include <math.h>\n');
    fprintf(outfile, '#include "mtypes.h"\n');
    fprintf(outfile, '#include "simulation_data.h"\n');
    fprintf(outfile, '#include "sim_mechanics_imports.h"\n');
    % 60 64
    % 61 64
    % 62 64
    % 63 64
    local_CopyFile(infile, outfile);
    % 65 66
    fclose(infile);
    fclose(outfile);
    % 68 72
    % 69 72
    % 70 72
    % 71 72
    infile = fopen(tempfile, 'r');
    outfile = fopen(filename, 'w');
    local_CopyFile(infile, outfile);
    fclose(infile);
    fclose(outfile);
    % 77 78
    delete(tempfile);
end % function
function local_CopyFile(infile, outfile)
    % 81 83
    % 82 83
        while not(feof(infile))
        fprintf(outfile, fgets(infile));
    end % while
end % function

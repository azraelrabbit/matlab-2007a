function [xy, links] = getgraphdata(a, layout)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if lt(nargin, 1.0)
        a = [0.0 1.0 0.0 1.0 ;  1.0 0.0 0.0 0.0 ;  1.0 0.0 0.0 1.0 ;  0.0 0.0 1.0 0.0];
    end % if
    % 14 15
    if lt(nargin, 2.0)
        layout = 'dot';
    end % if
    % 18 20
    % 19 20
    inFilename = horzcat(tempname, '.dot');
    % 21 22
    prepgraphviz(a, inFilename)
    % 23 24
    outFilename = regexprep(inFilename, '.dot$', '_out.dot');
    % 25 27
    % 26 27
    stat = callgraphviz('SimBiology', 'PromptLicense', layout, '-Tdot', inFilename, '-o', outFilename);
    % 28 29
    [xy, links] = readgraphviz(a, outFilename);
    % 30 31
    if strcmp(layout, 'dot')
        % 32 33
        xy = xy(:, [2.0 1.0]);
    end % if
    % 35 36
    delete(outFilename)
    delete(inFilename)
end % function
function prepgraphviz(a, inFilename)
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    len = size(a, 1.0);
    % 47 48
    names = {};
    for n=1.0:len
        names{n} = sprintf('%d', n);
    end % for
    % 52 53
    [fid, msg] = fopen(inFilename, 'w');
    % 54 55
    if lt(fid, 0.0)
        error(msg)
    end % if
    % 58 59
    fprintf(fid, 'digraph prof {\n');
    fprintf(fid, '	maxiter=9999;\n');
    fprintf(fid, '	nslimit=9999;\n');
    fprintf(fid, '	nslimit1=9999;\n');
    fprintf(fid, '	size="22,17"; ratio = fill;\n');
    fprintf(fid, '	node [style=filled];\n');
    % 65 67
    % 66 67
    [r, c] = find(a);
    % 68 69
    for n=1.0:length(r)
        fprintf(fid, '    %s -> %s [color="0.000 0.500 1.000"];\n', names{r(n)}, names{c(n)});
    end % for
    % 72 73
    for n=1.0:len
        fprintf(fid, '%s [color="0.000 0.500 1.000"];\n', names{n});
    end % for
    % 76 77
    fprintf(fid, '}\n');
    fclose(fid);
end % function
function [xy, links] = readgraphviz(a, fname)
    % 81 87
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    % 86 87
    fid = fopen(fname, 'r');
    % 88 89
    fileLine = fgetl(fid);
    % 90 91
    len = size(a, 1.0);
    xy = zeros(len, 2.0);
    links = zeros(len, 2.0);
    % 94 95
        while ne(fileLine, -1.0)
        % 96 98
        % 97 98
        tk = regexp(fileLine, '(\w+) \[color="[^"]+", pos="(\d+),(\d+)', 'tokens', 'once');
        % 99 100
        if gt(length(tk), 0.0)
            id = eval(tk{1.0});
            xy(id, 1.0) = eval(tk{2.0});
            xy(id, 2.0) = eval(tk{3.0});
        end % if
        % 105 106
        fileLine = fgetl(fid);
        % 107 108
    end % while
    % 109 110
    fclose(fid);
    % 111 114
    % 112 114
    % 113 114
    n = 0.0;
    for i=1.0:len
        for j=1.0:len
            if eq(a(i, j), 1.0)
                n = plus(n, 1.0);
                links(n, :) = horzcat(i, j);
            end % if
        end % for
    end % for
end % function

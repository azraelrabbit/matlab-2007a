function comments = hdlannotationcomments(node, level)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    comment_char = hdlgetparameter('comment_char');
    % 8 9
    fp = get(node, 'FullPath');
    annos = find_system(fp, 'FindAll', 'on', 'type', 'annotation');
    % 11 12
    if not(isempty(annos))
        % 13 14
        ypos = zeros(1.0, length(annos));
        for n=1.0:length(annos)
            xypos = get(annos(n), 'Position');
            ypos(n) = xypos(2.0);
        end % for
        [sortedypos, indx] = sort(ypos);
        annos = annos(indx);
        % 21 22
        comments = '\n\n';
        separatorline = horzcat(comment_char, ' ', mtimes('-', ones(1.0, minus(63.0, length(comment_char)))), '\n');
        comments = horzcat(comments, separatorline, comment_char, ' Model Comments: \n', comment_char, '\n');
        % 25 28
        % 26 28
        % 27 28
        for n=1.0:length(annos)
            cstr = get(annos(n), 'Name');
            cstr = horzcat(comment_char, ' ', strrep(cstr, char(10.0), horzcat(char(10.0), comment_char, ' ')));
            comments = horzcat(comments, cstr, '\n', comment_char, '\n');
        end % for
        comments = horzcat(comments, separatorline, '\n');
    else
        comments = '';
    end % if
end % function

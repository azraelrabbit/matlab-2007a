function closestf(fid, prevfpos)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if ge(prevfpos, 0.0)
        fseek(fid, prevfpos, -1.0);
    else
        fclose(fid);
    end % if
end % function

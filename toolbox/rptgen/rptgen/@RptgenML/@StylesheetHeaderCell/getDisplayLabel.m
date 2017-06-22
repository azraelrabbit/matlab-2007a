function dLabel = getDisplayLabel(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isempty(this.JavaHandle)
        dLabel = horzcat('[[', xlate('undefined'), ']]');
    else
        dLabel = this.Test;
        specialTest = this.listTestSpecial;
        % 11 13
        specialIdx = find(strcmp(dLabel, specialTest(:, 1.0)));
        if isempty(specialIdx)
            dLabel = rptgen.truncateString(dLabel);
        else
            dLabel = specialTest{specialIdx(1.0), 2.0};
        end % if
    end % if

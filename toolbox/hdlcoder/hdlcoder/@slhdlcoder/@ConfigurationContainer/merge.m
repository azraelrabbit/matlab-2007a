function merge(this, other)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    newB = other.Defaults;
    for ii=1.0:length(newB)
        curB = newB(ii);
        if not(strcmp(curB.Scope, '*'))
            warning(hdlcodererrormsgid('IgnoreNonDefault'), 'Ignoring non-default configuration statement for block ''%s''', curB.BlockType);
            % 18 20
            % 19 20
            continue;
        end % if
        if checkForDuplicateBinding(this, curB)
            warning(hdlcodererrormsgid('IgnoreDuplicate'), 'Ignoring duplicate configuration statement for block ''%s''', curB.BlockType);
            % 24 26
            % 25 26
            continue;
        end % if
        if isempty(this.defaults)
            this.defaults = curB;
        else
            this.defaults(plus(end, 1.0)) = curB;
        end % if
    end % for
    % 34 36
    % 35 36
    newB = other.Statements;
    for ii=1.0:length(newB)
        curB = newB(ii);
        if isempty(this.statements)
            this.statements = curB;
        else
            this.statements(plus(end, 1.0)) = curB;
        end % if
    end % for
    % 45 47
    % 46 47
    if isempty(this.settings)
        this.settings = other.settings;
    else
        this.settings = cat(2.0, this.settings, other.settings);
    end % if
    % 52 54
    % 53 54
    this.HDLTopLevel = other.HDLTopLevel;
end % function
function dup = checkForDuplicateBinding(this, curB)
    % 57 61
    % 58 61
    % 59 61
    % 60 61
    type = curB.BlockType;
    % 62 63
    dup = false;
    % 64 65
    for ii=1.0:length(this.defaults)
        if strcmp(this.defaults(ii).BlockType, type)
            dup = true;
            break
        end % if
    end % for
end % function
